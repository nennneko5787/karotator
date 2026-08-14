# Karotter API 規約

> 出典: `https://karotter.com` が配信している JS チャンク（Vite / rolldown ビルド、axios ベース）の解析結果。
> エンドポイント一覧は [`endpoints.md`](endpoints.md) / [`endpoints.json`](endpoints.json)（`dart run tool/fetch_api_spec.dart` で再生成）。
> **公式ドキュメントではない。** Karotter 側の変更で無効化されうる。

## 1. ベース URL

Web クライアントはアクセス中のホスト名から API ホストを決めている。

| Web ホスト | API ホスト |
| --- | --- |
| `*.karotter.com`（既定） | `https://api.karotter.com` |
| `*.karotter.jp` | `https://api.karotter.jp` |
| `*.karotter.net` | `https://api.karotter.net` |
| `*.karon.jp` | `https://apikarotter.karon.jp` |

ネイティブアプリ判定時は常に既定（`https://api.karotter.com`）。全エンドポイントは `<APIホスト>/api` 配下。

- タイムアウト: **15 秒**
- 既定 `Content-Type`: `application/json`
- Cookie を送受信する（axios `withCredentials: true` 相当）

## 2. リクエストヘッダ

全リクエストに付与される。

| ヘッダ | 値 |
| --- | --- |
| `x-client-type` | Web は `web` / `ios` / `android`。**karotator は `unofficial_app` を名乗る**（非公式であることを隠さないため） |
| `x-device-id` | 端末ごとに一度だけ生成し永続化する UUID |
| `x-active-account-id` | 現在アクティブなアカウントの**数値ユーザー ID**。§6 の auth 系エンドポイントには付けない |
| `x-csrf-token` | §3 |
| `Authorization` | `Bearer <accessToken>`（トークンがある場合のみ） |

`multipart/form-data` を送る場合は `Content-Type` を**明示的に外す**（境界文字列を HTTP クライアントに決めさせる）。

## 3. CSRF トークン

### 取得

CSRF トークンの入手経路は 2 つあり、通常は後者だけで足りる。

1. `GET /auth/csrf-token` → `{ "csrfToken": "..." }`
2. **任意のレスポンスのボディに `csrfToken` 文字列フィールドがあれば、それを最新値として保持する**

つまり Web クライアントは CSRF が要る度に `/auth/csrf-token` を叩いてはいない。
通信のついでに回収したトークンを使い回し、足りないときだけ 1. にフォールバックする。

### 送信

`x-csrf-token` には次を重複除去して**カンマ区切りで連結**したものを入れる。

1. メモリ上に保持している最新トークン
2. Cookie `karotter_csrf` の**全ての**値（同名 Cookie が複数飛んでくることがある）

## 4. 認証トークン

| 名前 | 用途 |
| --- | --- |
| `accessToken` | `Authorization: Bearer` に載せる。短命 |
| `refreshToken` | ネイティブアプリのみボディで送る。Web は Cookie 任せ |
| `sessionId` | セッション識別子。`auth/switch-session` で使う |

### リフレッシュ

`POST /auth/refresh-token`

```jsonc
{
  "deviceId":   "<x-device-id と同じ UUID>",
  "clientType": "unofficial_app",
  "deviceName": "Karotator on <OS>",
  "refreshToken": "<ネイティブのみ>"
}
```

レスポンス: `{ accessToken, refreshToken?, sessionId? }`

異常系の扱い:

| 応答 | 動作 |
| --- | --- |
| `409` + `code: "REFRESH_RETRY"` | **350ms 待って 1 回だけ**同じ要求を再送 |
| `403` | `GET /auth/csrf-token` を取り直して 1 回だけ再送 |
| その他のエラー | 失敗。以後 **15 秒間**はリフレッシュを試みない（クールダウン） |

同時に複数のリフレッシュが走らないよう、進行中の要求は 1 つに束ねる。

## 5. レスポンス共通の分岐

| 条件 | 意味 | 期待される動作 |
| --- | --- | --- |
| `401` | アクセストークン期限切れ | リフレッシュして**同じ要求を 1 回だけ**再送。失敗したら再ログインへ |
| `403` + `code: "ACCOUNT_BANNED"` | BAN | トークン破棄・ログアウト。`error` / `bannedUntil` / `banReason` を表示 |
| `403` + `code: "BIRTHDAY_REQUIRED"` | 生年月日未設定 | 生年月日入力へ誘導 |
| `403` + `error` に `CSRF` を含む | CSRF 不一致 | CSRF を取り直して**1 回だけ**再送 |

再送は `401` / `403(CSRF)` それぞれ **1 リクエストにつき 1 回まで**。無限ループさせない。

## 6. リフレッシュ対象外のエンドポイント

以下は 401 を受けてもリフレッシュ・再送しない（リフレッシュ自身が 401 を返す無限ループを避けるため）。

```
/auth/login
/auth/register
/auth/me
/auth/csrf-token
/auth/refresh
/auth/refresh-token
/auth/switch-session
/auth/logout
```

`x-active-account-id` もこれらには付けない。

## 7. ページネーション

2 方式が混在する。同じエンドポイントが `mode` によって切り替わることもある。

### ページ番号方式

要求: `?page=1&limit=20`
応答: `{ "pagination": { "page": 1, "limit": 20, "total"?: n, "pages"?: n, "hasMore"?: bool } }`

### カーソル方式

要求: `?cursor=<前回の nextCursor>&limit=20`（初回は `cursor` を付けない）
応答: `{ "pagination": { "limit": 20, "hasNext": bool, "nextCursor": n } }`

`GET /posts/timeline` と `GET /posts/recommended` は `mode=latest` のときカーソル方式、それ以外はページ番号方式。
`GET /users/{id}/{tab}` はカーソル方式（`nextCursor` が無ければ終端）。

## 8. 本文の形式

- 通常は JSON。
- 添付ファイルを伴うもの（`POST /posts`、`POST /dm/groups/{}/messages`、`POST /boards/{}/threads/{}/replies` など）は `multipart/form-data`。
  - 真偽値・数値は文字列化して入れる。
  - 配列（`mediaAlts`、`pollOptions` など）は **JSON 文字列にして 1 フィールドに入れる**。
  - ファイルはフィールド名 `media`（DM は `attachments`）で複数回 append する。
