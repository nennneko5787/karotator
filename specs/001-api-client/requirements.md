# 001 API クライアント刷新 — requirements

略号: `API`

## 背景

現行の `lib/http.dart` は 1 ファイル 830 行に以下が同居している。

- HTTP 送信（`get` / `post` / `patch` / `delete` がほぼ同一のコードで 4 回重複）
- 複数アカウントのセッション管理（`nowAccountId`、Cookie、ログイン応答の保存）
- 全エンドポイントのメソッド

`todo.md` の「HTTP」節にある 3 項目（セッションと HTTP の分離 / カテゴリ別ファイル分割 / PATCH の整理）はこれを指す。
加えて [`specs/api/conventions.md`](../api/conventions.md) の解析により、現行実装と Karotter 側の実際の規約に次のずれがあることが判明した。

| # | 現行 | 実際 |
| --- | --- | --- |
| 1 | リフレッシュ先が `auth/refresh` | `auth/refresh-token`。ボディに `deviceId` / `clientType` / `deviceName` が要る |
| 2 | CSRF が要る要求のたびに `auth/csrf-token` を叩く（毎回 1 往復無駄） | 任意のレスポンスの `csrfToken` を回収して使い回す |
| 3 | `x-active-account-id` を送っていない | 全ての非 auth 要求に付く |
| 4 | 401 を握らず例外にする（自動リフレッシュなし） | 401 でリフレッシュして 1 回再送 |
| 5 | Cookie の `karotter_csrf` を 1 つしか持てない | 複数値をカンマ連結して送る |
| 6 | タイムアウト無し | 15 秒 |

## 要件

### 構造

- **REQ-API-001** システムは、セッション状態（アカウント一覧・トークン・Cookie・デバイス ID）を HTTP 送信処理から分離した独立の型として提供すること。
- **REQ-API-002** システムは、HTTP メソッドごとに重複した送信処理を持たず、単一の送信経路に集約すること。
- **REQ-API-003** システムは、エンドポイント定義を Karotter の第 1 パスセグメント（`auth` / `posts` / `users` / `social` / `boards` / `notifications` / `dm` / `search`）に対応するファイルへ分割すること。
- **REQ-API-004** システムは、`KarotterApi().posts.timeline(...)` のようにカテゴリ経由で全エンドポイントへ到達できる単一の入口を提供すること。

### 送信

- **REQ-API-005** システムは、全てのリクエストに `x-client-type: unofficial_app`、`x-device-id`、および保持している場合は `Authorization: Bearer <accessToken>` を付与すること。
- **REQ-API-006** アクティブなアカウントが存在する間、システムは auth 系（`conventions.md` §6）以外の全リクエストに `x-active-account-id` を付与すること。
- **REQ-API-007** CSRF トークンを 1 つ以上保持している場合、システムは `x-csrf-token` に重複を除いたカンマ区切りで全てを付与すること。
- **REQ-API-008** システムは、各リクエストを 15 秒で打ち切ること。
- **REQ-API-009** 添付ファイルを含むリクエストを送るとき、システムは `multipart/form-data` として送信し、`Content-Type` ヘッダを自ら設定しないこと。

### 応答

- **REQ-API-010** レスポンスボディに文字列の `csrfToken` が含まれるとき、システムはそれを最新の CSRF トークンとして保持すること。
- **REQ-API-011** レスポンスに `Set-Cookie` が含まれるとき、システムはアクティブなアカウントの Cookie ストアを更新すること。同名 Cookie が複数ある場合は全て保持すること。
- **REQ-API-012** もしステータスが 401 であり、かつ対象が auth 系以外であり、かつ当該リクエストで未再送ならば、システムはトークンをリフレッシュした上で同一リクエストを 1 回だけ再送すること。
- **REQ-API-013** もしステータスが 403 でボディの `error` に `CSRF` を含み、かつ当該リクエストで未再送ならば、システムは CSRF トークンを取得し直して同一リクエストを 1 回だけ再送すること。
- **REQ-API-014** もしステータスが 403 で `code` が `ACCOUNT_BANNED` ならば、システムは保持しているトークンを破棄し、`KarotterBannedException` を送出すること。
- **REQ-API-015** もしステータスが 403 で `code` が `BIRTHDAY_REQUIRED` ならば、システムは `KarotterBirthdayRequiredException` を送出すること。
- **REQ-API-016** 上記に該当しない 4xx / 5xx について、システムはそれぞれ `KarotterClientException` / `KarotterServerException` を送出すること。例外はサーバーが返した `code` と `error` を保持すること。

### リフレッシュ

- **REQ-API-017** リフレッシュするとき、システムは `POST /auth/refresh-token` に `deviceId` / `clientType` / `deviceName` を送ること。
- **REQ-API-018** もしリフレッシュが 409 かつ `code` が `REFRESH_RETRY` を返したならば、システムは 350ms 待って 1 回だけ再送すること。
- **REQ-API-019** もしリフレッシュが 403 を返したならば、システムは `GET /auth/csrf-token` を取得し直して 1 回だけ再送すること。
- **REQ-API-020** リフレッシュが失敗してから 15 秒間、システムは新たなリフレッシュを試みず即座に失敗させること。
- **REQ-API-021** リフレッシュが進行中の間、システムは新たなリフレッシュを開始せず進行中の結果を共有すること。

### セッション

- **REQ-API-022** システムは、複数アカウントを保持し、アクティブなアカウントを切り替えられること。
- **REQ-API-023** アカウントを削除するとき、システムはそのアカウントの Cookie とログイン情報を安全なストレージから消去すること。
- **REQ-API-024** システムは、デバイス ID を初回に一度だけ生成し、以後の起動でも同じ値を返すこと。

### 移行

- **REQ-API-025** 刷新後、`lib/http.dart` および `HTTPClient` は存在しないこと。全ての呼び出し箇所が新しい入口を使うこと。
- **REQ-API-026** システムは、現行の `HTTPClient` が提供していた全機能と等価な機能を提供すること（機能の後退を起こさないこと）。

### 仕様の自動取得

- **REQ-API-027** システムは、Karotter Web クライアントの JS から到達可能な全エンドポイント（HTTP メソッドとパス）を機械的に抽出し、`specs/api/` 配下へ書き出す手段を提供すること。
- **REQ-API-028** 抽出結果には、パスパラメータを `{}` に正規化したパスと、そのエンドポイントが出現したチャンク名を含めること。
- **REQ-API-029** 抽出手段は Flutter SDK 同梱の `dart` のみで実行でき、追加のパッケージ依存を持たないこと。

## 非目標

- 抽出した全 297 エンドポイントの Dart 実装。今回実装するのは現行利用分と `todo.md` 記載分に限る（[design.md](design.md) §5）。
- レスポンス型の自動生成。ミニファイされた JS からは型が復元できないため、`freezed` による手書きを続ける。
- ギルド / コミュニティ / ラジオ / お絵かきチャット / スペース等、karotator が未着手の領域。一覧のみ残す。
