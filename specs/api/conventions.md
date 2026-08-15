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

## 9. 表示できないカロート

閲覧者に見せられないカロートは、本体を伏せて理由コードだけを載せた形で返る。
**`id` 以外は来ないことがある。** `author` すら `null` になる。

```jsonc
{
  "id": 1764682,
  "authorId": 81,
  "author": null,
  "canView": false,
  "hiddenReason": "FILTERED",
  "hiddenFilterDetail": "MINOR_RESTRICTED"
}
```

引用元 (`quotedPost`) だけでなく、`GET /posts/{id}` の `post` 本体もこの形で返る。

### 理由コード

`hiddenReason` が親で、値によって見る詳細フィールドが変わる。

| `hiddenReason` | 詳細フィールド |
| --- | --- |
| `RELATION` | `hiddenRelationDetail` |
| `FILTERED` | `hiddenFilterDetail` |

| `hiddenRelationDetail` | 意味 |
| --- | --- |
| `BLOCKED` | 閲覧者が作者をブロックしている |
| `BLOCKED_BY_AUTHOR` | 作者が閲覧者をブロックしている |
| `MUTED` | 閲覧者が作者をミュートしている |

| `hiddenFilterDetail` | 意味 |
| --- | --- |
| `PRIVATE_ACCOUNT` | 非公開アカウント |
| `LIMITED_VISIBILITY` | 投稿の公開範囲 |
| `EXPIRED` | 公開期限切れ |
| `ADMIN_HIDDEN` | 運営による表示制限 |
| `MUTED_KEYWORD` | ミュートキーワードに一致 |
| `MINOR_RESTRICTED` | 年齢制限 |
| `R18_FILTERED` | 閲覧者の R18 表示設定がオフ |
| `BOT_FILTERED` | 閲覧者が BOT を非表示にしている |
| `PARODY_FILTERED` | 閲覧者がパロディを非表示にしている |

どちらの列挙も Web 側に既定分岐があり、値が増える前提で書かれている。

### `NOT_FOUND` は API の値ではない

`quotedPostId` があるのに `quotedPost` が無いとき、Web クライアントは
`{id, canView: false, hiddenReason: "FILTERED", hiddenFilterDetail: "NOT_FOUND"}`
を**自前で合成**する。サーバーはこの値を返さない。

### 復帰

`hiddenReason` が `RELATION` かつ `hiddenRelationDetail` が `MUTED` / `BLOCKED`
（＝閲覧者が自分で隠した）ときだけ、閲覧者の操作で開ける。

```
GET /posts/{id}?includeMutedOrBlocked=true
```

`BLOCKED_BY_AUTHOR` には効かない。同じパラメータは `GET /users/{username}` と
`GET /users/{id}/{tab}` にもある。スレッドの親を辿る箇所では
`includeUnavailableReference=true` も併用されている（効果は未確認）。

> 出典: `KaroatCard` / `Post` チャンクの文言生成関数。
> `dart run tool/grep_bundle.dart 'hiddenReason'` で再確認できる。

## 10. 投稿制限

**メール認証と規約クイズの両方**が済むまで投稿できない。判定は `AuthUser` の
`emailVerified` と `legalQuizPassed`。

制限はサーバー側だけが持つ。Web は投稿の操作を塞いでおらず、帯を出すだけ。
弾かれると SYSTEM 通知が届く。

| 通知本文の書き出し | 行き先 |
| --- | --- |
| `規約クイズにまだ合格していないため投稿できません` | `/legal-quiz` |
| `まだメール認証が完了していないため投稿できません` | `/settings?tab=accounts` |

`route` があればそちらが優先される（`//` で始まるものは弾くこと）。
ただし**実際に届いた SYSTEM 通知に `route` は含まれていなかった**ので、
本文の前方一致は必須。

### SYSTEM 通知には行為者がいない

```jsonc
{
  "id": 6288341,
  "groupKey": "SYSTEM:none:2026-08-15T10:39:48.971Z",
  "type": "SYSTEM",
  "message": "まだメール認証が完了していないため投稿できません。設定 → アカウントから…",
  "userId": 42128,
  "actorId": null, "actor": null, "actors": [], "actorCount": 0,
  "postId": null, "post": null, "posts": [], "postCount": 0,
  "communityId": null, "community": null, "subscriptionGiftId": null,
  "likeContext": "OTHER", "rekarotContext": "OTHER", "reactionEmojis": [],
  "isRead": false, "createdAt": "...", "notificationIds": [6288341]
}
```

`actor` を `required` にすると、**SYSTEM 通知が 1 件混ざるだけで通知一覧の
レスポンス全体が読めなくなる**。`communityId` / `subscriptionGiftId` /
`reactionEmojis` も通知の種類によって載る。

### 規約クイズ

`GET /auth/legal-quiz`

```jsonc
{
  "token": "_46WwtkDa0UtSe59.CiT19...",   // 1.8KB ほどある
  "expiresInSeconds": 900,                 // トークンの寿命 = 15 分
  "requiredCorrectAnswers": 5,             // 設問数と同じ。全問正解が要る
  "questions": [{
    "id": "privacy-minors-careful",        // ← 文字列。数値ではない
    "prompt":       {"ja": "...", "en": "..."},
    "document":     {"ja": "プライバシーポリシー", "en": "Privacy Policy"},
    "documentPath": "/privacy",
    "options": [{
      "id": "c15e08d3385c0822",            // ← 文字列（16 進）
      "label": {"ja": "...", "en": "..."}
    }]
  }]
}
```

**`id` は設問・選択肢ともに文字列。** 設問はスラグ、選択肢は 16 進で、
問題を引き直すと選択肢 ID は変わる。

既定 5 問。呼ぶたびに別の問題が返り、合格するまで何度でも引き直せる。
`documentPath` は `legalDocuments` の `path` とそのまま一致する。

`POST /auth/legal-quiz/grade`

```jsonc
// 送信（値も文字列）
{"legalQuizToken": "<token>",
 "legalQuizAnswers": {"privacy-minors-careful": "c15e08d3385c0822"}}

// 応答
{
  "passed": true,
  "legalQuizPassed": true,
  "questions": [{"id": 1, "options": [
    {"id": 1, "explanation": {"ja": "...", "en": "..."},
     "isCorrect": true, "isSelected": true}
  ]}]
}
```

`passed`（今回の合否）と `legalQuizPassed`（アカウントへの記録）は**別物**。
未ログインだと合格しても記録されない。

### メール認証

| エンドポイント | 送信 | 応答 |
| --- | --- | --- |
| `POST /auth/me/email` | `{email}` | `{email, message}` |
| `POST /auth/me/email/resend` | なし | `{cooldownSeconds, message}` |
| `POST /auth/verify-email` | `{token}` | `{emailVerified, legalQuizPassed?, message}` |

`token` は確認メールのリンク（`/verify-email?token=...`）に入っている。
再送は `cooldownSeconds` の間できない。失敗時は 429 の retry から秒数を拾う。

> 出典: `Layout` / `legal-quiz` / `settings` / `notificationTarget` チャンク。
> `dart run tool/grep_bundle.dart 'legal-quiz'` で再確認できる。

## 11. 本文の記法とカスタムリアクション

### 本文

トークン化は空白・URL・ハッシュタグ・メンション・ルビの 5 種。
先に伏せ字で分割し、その中身を同じ規則で解く（伏せ字の中にも URL やルビが入る）。

```js
// 伏せ字
/(\|\|[\s\S]+?\|\|)/g

// トークン
/(\s+
 |(?:https?:\/\/|www\.)[^\s<>()]+[^\s.,!?<>()]
 |#[\p{L}\p{N}_]{1,50}
 |@[A-Za-z0-9_]{1,30}
 |(?:[|｜][^《》\n]+|[^\s《》｜|]+)《[^《》\n]+》)/gu

// ルビ 1 つ
/^(?:[|｜]([^《》\n]+)|([^\s《》｜|]+))《([^《》\n]+)》$/u
```

`www.` 始まりの URL は表示はそのまま、開くときに `https://` を足す。
ルビは `｜漢字《かんじ》` と `漢字《かんじ》` の 2 通り。

### pro リアクション

`ReactionSummary.emoji` には通常の絵文字だけでなく `pro:otsukaresama` の形の
識別子が入る。一覧を返す API は無く、`proReactions` チャンクに埋まっている。

```jsonc
{"code": "pro:otsukaresama", "slug": "otsukaresama",
 "label": "おつかれ様", "labelEn": "Nice work",
 "assetUrl": "/reactions/pro/otsukaresama.png"}
```

一覧は [`pro-reactions.md`](pro-reactions.md)（`dart run tool/fetch_pro_reactions.dart`）。
画像は Karotter Web のホスト基準。

付けられるのは PRO プランのみ。判定は素の `subscriptionPlan` ではなく、
状態と期限を加味した実効プランで行う。

```js
plan !== "FREE" && (status === "ACTIVE" || status === "TRIALING")
  && (!activeUntil || activeUntil > now) ? plan : "FREE"
```

同じ判定で文字数上限も決まる（`PRO:7000 / PLUS:1000 / FREE:200`）。

> 出典: `PostRichText` / `proReactions` / `subscription` チャンク。
> `dart run tool/grep_bundle.dart 'proReactions'` で再確認できる。

## 12. 本文の Markdown

`Post.content` は素のテキストではなく **Markdown**（GFM）。Karotter Web は
`react-markdown` に通してから描いている。

| 記法 | 出方 |
| --- | --- |
| `# 〜` 〜 `###### ` | 見出し。`#` の後ろに**空白が要る** |
| `**〜**` / `*〜*` / `~~〜~~` | 太字 / 斜体 / 打ち消し |
| `` `〜` `` / ` ```lang ` | インラインコード / コードブロック |
| `> 〜` | 引用 |
| `- 〜` / `1. 〜` | 箇条書き / 番号付き |
| `[文字](URL)` | リンク |
| `\| a \| b \|` | 表（GFM） |
| `---` | 区切り線 |
| `-# 〜` | **Karotter 独自**。小さい文字（Discord と同じ記法） |

### ハッシュタグと衝突しない

見出しは `#` の後ろに空白が要るので、`#にんじん` は見出しにならず素の文字と
して残り、§11 のトークナイザがハッシュタグとして拾う。`-#` も空白が無いので
箇条書き（`- `）にはならない。**parser の既定のままで衝突しない。**

### 二段構え

Markdown を解いた**後**の素のテキストに、§11 のトークナイザ（URL・メンション・
ハッシュタグ・ルビ・伏せ字）を掛ける。逆順にはしない。

- 裸の URL の持ち主は §11。Markdown 側の自動リンクは**外す**。両方が拾うと
  二重になるし、`www.` の扱いは §11 側にしか無い。
- **インラインコードの中にはトークナイザを掛けない。** `` `#tag` `` や
  `` `||x||` `` が勝手に解釈されると困る。

### 解かない場所

引用元カードや通知の短い文字では Markdown を解かない。Karotter Web も
`lightweight` を立てて素の段落 1 つとして描いている。

> 出典: `PostRichText` チャンクと本文描画まわり。
> 未確認: 画像記法 `![]()`、脚注、`rehypePlugins` の `maxSize:10`。
