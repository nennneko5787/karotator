# 001 API クライアント刷新 — design

## 1. 構成

```
lib/api/
  karotter_api.dart      入口。カテゴリを束ねるだけ
  client.dart            KarotterHttpClient — 単一の送信経路 + 再送 + リフレッシュ
  exceptions.dart        例外階層
  session/
    session.dart         KarotterSession — 下記 5 つを束ねるだけ
    device.dart          DeviceId       端末 UUID
    accounts.dart        AccountStore   アカウント一覧とアクティブ切替
    credentials.dart     CredentialStore トークンの永続化
    cookies.dart         CookieJar      Cookie の永続化と Set-Cookie マージ
    csrf.dart            CsrfStore      CSRF トークンの保持と合成
  endpoints/
    endpoints.dart       カテゴリ共通の基底 (KarotterEndpoints)
    auth.dart            AuthApi
    posts.dart           PostsApi
    users.dart           UsersApi
    social.dart          SocialApi
    boards.dart          BoardsApi
    notifications.dart   NotificationsApi
    dm.dart              DmApi
    search.dart          SearchApi
tool/
  fetch_api_spec.dart    specs/api/ の生成 (REQ-API-027..029)
```

`lib/http.dart` は削除する（REQ-API-025）。`lib/exceptions.dart` は `lib/api/exceptions.dart` へ移す。

依存の向きは一方向:

```
karotter_api → endpoints/* → client → session
```

`session` は HTTP を知らない。`client` はエンドポイントを知らない。

## 2. セッション (REQ-API-001, 010, 011, 022..024)

現行 `HTTPClient` の問題は「1 つのクラスがアカウント一覧・トークン・Cookie・CSRF・デバイス ID を
まとめて面倒を見ている」こと。これらは**保存先も寿命も更新契機も違う**ので、混ぜると
どのメソッドが何を触るのか読めなくなる。分けた上で `KarotterSession` は束ねるだけにする。

| 型 | 持つもの | 保存先 | 寿命 |
| --- | --- | --- | --- |
| `DeviceId` | 端末 UUID 1 個 | `SharedPreferences` | 端末の一生 |
| `AccountStore` | アカウント ID 一覧・アクティブ | `SharedPreferences` | アカウントを消すまで |
| `CredentialStore` | アクセストークン等 | `FlutterSecureStorage` | リフレッシュのたび更新 |
| `CookieJar` | Cookie | `FlutterSecureStorage` | レスポンスのたび更新 |
| `CsrfStore` | CSRF トークン | メモリ | プロセスの一生 |

各型は**アクティブアカウントを知らない**。アカウント ID は呼び出し側（`KarotterSession`）が渡す。
そうすると「アカウントを切り替えたら何が変わるか」が `KarotterSession` の 1 箇所だけを読めば分かる。

```dart
class DeviceId {
  Future<String> get();            // 初回だけ生成して以後同じ値 (REQ-API-024)
}

class AccountStore {
  Future<List<String>> ids();
  Future<String?>      activeId();
  Future<void>         activate(String id);
  Future<String>       create();   // UUID を発行して activate
  Future<String?>      remove(String id);   // 消した後のアクティブ ID を返す
}

class CredentialStore {
  Future<LoginResponse?> load(String accountId);
  Future<void>           save(String accountId, LoginResponse res);
  Future<void>           applyRefresh(String accountId, RefreshResponse res);
  Future<void>           clear(String accountId);
}

class CookieJar {
  Future<String?>      header(String accountId);              // "a=1; b=2"
  Future<void>         merge(String accountId, Iterable<String> setCookies);
  Future<List<String>> valuesOf(String accountId, String name);
  Future<void>         clear(String accountId);
}

class CsrfStore {
  String? get latest;
  void     remember(String? token);                    // REQ-API-010
  String?  header(List<String> cookieValues);          // 重複除去してカンマ連結
}
```

`KarotterSession` はこれらの上に「今のアカウント」という文脈を足すだけ。

```dart
class KarotterSession {
  final AccountStore accounts;
  final CredentialStore credentials;
  final CookieJar cookies;
  final CsrfStore csrf;

  Future<void> initialize();       // activeId と deviceId をメモリに載せる

  String? get accountId;           // アプリ内部の UUID
  int?    get userId;              // Karotter の数値ユーザー ID
  String  get deviceId;

  Future<LoginResponse?> login();                    // アクティブのトークン
  Future<void>           saveLogin(LoginResponse r);
  Future<void>           applyRefresh(RefreshResponse r);
  Future<void>           signOut();                  // トークンと Cookie を捨てる

  Future<String?> switchTo(String accountId);
  Future<String>  addAccount();
  Future<void>    removeAccount(String accountId);   // REQ-API-023
}
```

### Cookie の保持形式

現行は `Map<String,String>` に潰しているが、`karotter_csrf` は同名で複数飛んでくる（conventions §3）。
潰すと欠落するので、`name=value` の**リスト**として順序付きで持つ（REQ-API-011）。
マージ規則:

- `karotter_csrf` — 追記。既に同じ値があれば足さない
- それ以外 — 同名を置き換え（後勝ち）
- `expires` / `path` / `domain` / `secure` / `httponly` / `samesite` / `max-age` — 属性なので捨てる

## 3. KarotterHttpClient (REQ-API-002, 005..021)

送信経路は 1 本だけ。

```dart
Future<KarotterResponse> send(
  String method,
  String path, {
  Map<String, Object?>? query,
  Object? json,                 // Map / List → JSON 本文
  Map<String, String>? fields,  // multipart のテキスト部
  List<KarotterFile>? files,    // multipart のファイル部
  Map<String, String>? headers,
});
```

`get` / `post` / `patch` / `put` / `delete` は `send` への薄い委譲。
`json` と `files` は排他。`files` が非 null なら multipart（REQ-API-009）。

### 送信フロー

```
send(method, path, ...)
  └─ _attempt(retriedAuth: false, retriedCsrf: false)
       1. ヘッダ組み立て
          x-client-type / x-device-id / Authorization?
          x-active-account-id?   ← auth系でなければ (REQ-API-006)
          x-csrf-token?          ← メモリ値 + Cookie の karotter_csrf 全部, 重複除去 (REQ-API-007)
          Cookie
       2. 15 秒タイムアウトで送信 (REQ-API-008)
       3. Set-Cookie をセッションへマージ (REQ-API-011)
       4. ボディ JSON の csrfToken を回収 (REQ-API-010)
       5. ステータス判定 → 下表
```

| 判定 | 動作 |
| --- | --- |
| 2xx / 3xx | `KarotterResponse` を返す |
| 401 かつ 非 auth 系 かつ `!retriedAuth` | `_refresh()` → `_attempt(retriedAuth: true)` (REQ-API-012) |
| 403 + `code == ACCOUNT_BANNED` | `clearTokens()` → `KarotterBannedException` (REQ-API-014) |
| 403 + `code == BIRTHDAY_REQUIRED` | `KarotterBirthdayRequiredException` (REQ-API-015) |
| 403 + `error` に `CSRF` かつ `!retriedCsrf` | `fetchCsrfToken()` → `_attempt(retriedCsrf: true)` (REQ-API-013) |
| その他 4xx | `KarotterClientException` (REQ-API-016) |
| 5xx | `KarotterServerException` |

`retriedAuth` / `retriedCsrf` を引数で持ち回すことで、再送は各 1 回に限られる。
`_isAuthEndpoint(path)` は conventions §6 の 8 パスの部分一致。

### リフレッシュ (REQ-API-017..021)

```dart
Future<void> _refresh() // 直列化 + クールダウン
```

- 進行中の `Future` を `_refreshing` に持ち、2 人目以降はそれを await する（REQ-API-021）。
- 最後の失敗から 15 秒以内なら即 throw（REQ-API-020）。
- 本体は `POST auth/refresh-token` に `{deviceId, clientType, deviceName}`。
  - `409` + `REFRESH_RETRY` → 350ms sleep して 1 回だけ再送（REQ-API-018）
  - `403` → `GET auth/csrf-token` して 1 回だけ再送（REQ-API-019）
- 成功したら `session.applyRefresh()`。

リフレッシュ自身は `send` を通さず素の HTTP で行う。`send` を再入させると 401 のたびに再帰する。

## 4. 例外 (REQ-API-016)

```
KarotterException            statusCode / code / message / body
├─ KarotterClientException   4xx
│   ├─ KarotterBannedException           403 ACCOUNT_BANNED  (+ bannedUntil, banReason)
│   └─ KarotterBirthdayRequiredException 403 BIRTHDAY_REQUIRED
└─ KarotterServerException   5xx
```

既存の `KarotterClientException(statusCode, message)` の位置引数を維持し、`code` などは名前付き任意引数で足す。
既存の `catch (KarotterClientException e)` を書き換えずに済む。

## 5. 実装するエンドポイント

`specs/api/endpoints.md` の 297 本のうち、現行利用分と `todo.md` 記載分を実装する。

| カテゴリ | 実装 |
| --- | --- |
| `auth` | login, login/2fa, logout, refresh-token, switch-session, csrf-token, me, sessions(一覧/個別削除/他全削除) |
| `posts` | timeline, recommended, 取得, 作成, **削除**, 返信一覧, reply-targets, like/rekarot/bookmark/react とその解除, poll/vote, **conversation/leave**, **me/bookmarks**, scheduled/me, scheduled 削除 |
| `users` | プロフィール取得, タブ(posts/replies/media/likes), password 変更, **profile 更新**, **settings 更新**, **pinned-post**, recommended |
| `social` | circles(一覧/**作成**/**削除**/**メンバー**), lists(一覧/**作成**/**削除**/**メンバー**/**posts**), link-preview |
| `boards` | 一覧, スレッド一覧, スレッド取得, 返信取得, 返信投稿, **スレッド作成**, follow/unfollow, リアクション |
| `notifications` | 一覧, 未読数, 全既読, grouped-posts, **push/register**, **push/unregister** |
| `dm` | **groups 一覧 / 取得 / 作成, messages 取得 / 送信, read, unread/count, start** |
| `search` | **users, hashtags, communities, trending/topics** |
| `follow` | follow/unfollow, **block, mute, requests** — `UsersApi` に同居させる |

太字は今回新規。未実装領域（guilds / communities / radio / draw / spaces / subscriptions / channels / news / apikeys / oauth）は `endpoints.md` に一覧だけ残す。

## 6. 呼び出し側の移行 (REQ-API-025)

`HTTPClient()` の 76 箇所を機械的に置換する。

| 旧 | 新 |
| --- | --- |
| `HTTPClient().getTimeLine(...)` | `KarotterApi().posts.timeline(...)` |
| `HTTPClient().getPostById(id)` | `KarotterApi().posts.byId(id)` |
| `HTTPClient().login(...)` | `KarotterApi().auth.login(...)` |
| `HTTPClient().nowAccountId` | `KarotterApi().session.accountId` |
| `HTTPClient().nowUserId` | `KarotterApi().session.userId` |
| `HTTPClient().loadLoginResponse()` | `KarotterApi().session.loadLogin()` |
| `HTTPClient().initialize()` | `KarotterApi().initialize()` |

`KarotterApi` はシングルトン（現行 `HTTPClient` と同じく `factory` で単一インスタンスを返す）。
Riverpod への移行はこの仕様の範囲外とする。

## 7. tool/fetch_api_spec.dart (REQ-API-027..029)

```
dart run tool/fetch_api_spec.dart [--out specs/api] [--origin https://karotter.com]
```

1. `<origin>/` を取得し `<script type="module" src="/assets/*.js">` を得る
2. そこから `"...-XXXXXXXX.js"` 形式の参照を辿って全チャンクを幅優先で取得（実測 167 件 / 4.7MB）
3. 各チャンクから `` .<method>(`/path`) `` を正規表現で抽出。`${...}` は `{}` に正規化
4. `{params:{...}}` が直後に続く場合はクエリキー名も拾う
5. `endpoints.json`（機械可読）と `endpoints.md`（一覧表）を出力

`dart:io` / `dart:convert` のみ使用。pub 依存なし（REQ-API-029）。

抽出は**ヒューリスティック**であることを明記する。`.get()` の全てが HTTP とは限らず、
動的に組み立てられたパスは取り逃す。生成物は「参考資料」であって契約ではない。

## 8. テスト

`test/api/` に以下を置く。ネットワークには出ず、`http` パッケージの `MockClient` を使う。

| 対象 | 確認 |
| --- | --- |
| ヘッダ組み立て | REQ-API-005..007 |
| CSRF 回収 | REQ-API-010 |
| 401 再送 | REQ-API-012（再送が 1 回で止まること含む） |
| 403 CSRF 再送 | REQ-API-013 |
| BAN / 生年月日 | REQ-API-014, 015 |
| リフレッシュ 409 / 403 / クールダウン / 直列化 | REQ-API-018..021 |
| Cookie の複数 `karotter_csrf` 保持 | REQ-API-011 |
