# Karotter 開発者 API ドキュメント

<!-- このファイルは自動生成される。手で編集しない。 -->
<!-- 再生成: dart run tool/fetch_api_docs.dart -->

出典: `https://karotter.com` のバンドル内 `api-docs-DO5se_tC.js` に含まれる Karotter 自身のドキュメント。

> [!IMPORTANT]
> これは **開発者 API**（APIキー / Bot トークン / OAuth）の仕様であり、
> karotator が使っている**内部 API とは一致しない**。
> パスの接頭辞も異なる（開発者 API は `/v1` 相当、内部 API は `/api`）。
>
> 内部 API の観測結果は [endpoints.md](endpoints.md)、
> 共通規約は [conventions.md](conventions.md) を参照。
>
> ただし **レスポンススキーマ**（[schemas/](schemas/)）は両者でほぼ共通で、
> karotator のモデルを直す際の一次情報として使える。

## 目次

- [認証](#auth) — 1 件
- [OAuth 2 ログイン](#oauth) — 3 件
- [サーバーBot API](#guild-bot) — 5 件
- [タイムライン](#timeline) — 1 件
- [投稿](#posts) — 7 件
- [インタラクション](#interactions) — 8 件
- [ユーザー](#users) — 5 件
- [フォロー](#follows) — 6 件
- [検索](#search) — 1 件
- [ニュース](#news) — 6 件
- [リアクション](#reactions) — 3 件
- [ストーリー](#stories) — 6 件
- [掲示板](#boards) — 7 件
- [ダイレクトメッセージ](#dm) — 5 件
- [通知](#notifications) — 5 件
- [v2 互換API](#v2-compat) — 12 件
- [レスポンススキーマ](#schemas) — 4 件

## 認証

<a id="auth"></a>

すべてのリクエストには APIキーによる認証が必要です。

### `GET` `/users/me`

認証中のユーザー情報を取得

レスポンス:

```json
{ id, username, displayName, avatarUrl, bio, isPrivate, isOfficial, ... }
```


## OAuth 2 ログイン

<a id="oauth"></a>

Karotterアカウントで外部アプリにログインするための認可コードフローです。設定ページでOAuthアプリを作成してから利用します。

### `GET` `/api/oauth/authorize`

ユーザーをKarotterの認可画面へリダイレクト

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `response_type` | `string` | ○ | code を指定 |
| `client_id` | `string` | ○ | OAuthアプリのclient_id |
| `redirect_uri` | `string` | ○ | 登録済みリダイレクトURI |
| `scope` | `string` |  | profile email offline_access |
| `state` | `string` |  | CSRF対策用の任意文字列 |
| `code_challenge` | `string` |  | PKCE code challenge |
| `code_challenge_method` | `string` |  | S256 または plain |

### `POST` `/api/oauth/token`

認可コードをアクセストークンへ交換

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `grant_type` | `string` | ○ | authorization_code または refresh_token |
| `code` | `string` |  | 認可コード |
| `redirect_uri` | `string` |  | 認可時と同じリダイレクトURI |
| `client_id` | `string` |  | 公開クライアントまたはPOST認証で使用 |
| `client_secret` | `string` |  | 機密クライアントで使用 |
| `code_verifier` | `string` |  | PKCE code verifier |
| `refresh_token` | `string` |  | refresh_token grantで使用 |

レスポンス:

```json
{ access_token, token_type: "Bearer", expires_in, scope, refresh_token? }
```

### `GET` `/api/oauth/userinfo`

OAuthアクセストークンでユーザー情報を取得

認証: `Authorization: Bearer ACCESS_TOKEN`

レスポンス:

```json
{ sub, id, username, displayName, picture, email?, email_verified? }
```


## サーバーBot API

<a id="guild-bot"></a>

Discord風のサーバー/Bot APIです。このセクションはAPIキーではなく Authorization: Bot <token> を使用します。

### `GET` `/guilds`

Botがインストール済みのサーバー一覧を取得

認証: `Authorization: Bot BOT_TOKEN`

レスポンス:

```json
{ guilds: Guild[] }
```

### `GET` `/guilds/:guildId/channels`

Botが表示できるチャンネル一覧を取得

認証: `Bot token + VIEW_CHANNEL`

レスポンス:

```json
{ channels: GuildChannel[] }
```

### `POST` `/channels/:channelId/messages`

Botとしてテキストまたはアナウンスチャンネルにメッセージを送信

認証: `Bot token + SEND_MESSAGES`

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `content` | `string` | ○ | メッセージ本文 |

レスポンス:

```json
{ message: GuildMessage }
```

### `POST` `/applications/commands`

スラッシュコマンド定義を作成または更新

認証: `Authorization: Bot BOT_TOKEN`

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `name` | `string` | ○ | コマンド名 |
| `description` | `string` | ○ | 説明 |
| `guildId` | `number` |  | 指定時はサーバー限定コマンド |
| `defaultMemberPermissions` | `string` |  | Discord風BigInt権限文字列 |
| `payload` | `object` |  | options等の追加定義 |

レスポンス:

```json
{ command: GuildApplicationCommand }
```

### `PUT` `/applications/commands/:commandId/permissions`

コマンドのロール/ユーザー/チャンネル別権限を最大100件まで置き換え

認証: `Authorization: Bot BOT_TOKEN`

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `guildId` | `number` | ○ | 対象サーバーID |
| `permissions` | `array` | ○ | [{ id, type: ROLE|USER|CHANNEL, permission }] |

レスポンス:

```json
{ command }
```


## タイムライン

<a id="timeline"></a>

ホームタイムラインの取得。権限: canReadTimeline

### `GET` `/timeline`

ホームタイムラインを取得

認証: `canReadTimeline`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `page` | `number` |  | ページ番号 (デフォルト: 1) |
| `limit` | `number` |  | 取得件数 (デフォルト: 20, 最大: 100) |

レスポンス:

```json
{ posts: Post[], hasMore: boolean }
```


## 投稿

<a id="posts"></a>

投稿の作成・取得・操作。権限: canReadPosts / canCreatePosts

### `POST` `/posts`

新しい投稿を作成

認証: `canCreatePosts`

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `content` | `string` | ○ | 投稿テキスト |
| `parentId` | `number` |  | リプライ先の投稿ID |
| `quotedPostId` | `number` |  | 引用元の投稿ID |
| `visibility` | `string` |  | public | followers | circle | mutual (デフォルト: public) |
| `media` | `File[]` |  | メディアファイル (最大10枚) |
| `pollOptions` | `string` |  | アンケート選択肢 (JSON文字列) |
| `pollDurationHours` | `number` |  | アンケート期間 (時間) |
| `minimumAge` | `number` |  | 最低年齢制限 (6〜99)。isR18 / hideFromMinors=true の場合は18以上として扱われます |
| `maximumAge` | `number` |  | 最高年齢制限 (6〜99)。minimumAge未満にはできません |
| `isR18` | `boolean` |  | R18コンテンツフラグ |

レスポンス:

```json
{ post: Post }
```

### `GET` `/posts`

ユーザーの投稿一覧を取得

認証: `canReadPosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `page` | `number` |  | ページ番号 |
| `limit` | `number` |  | 取得件数 (デフォルト: 20, 最大: 100) |
| `userId` | `number` |  | 特定ユーザーの投稿を指定 |

レスポンス:

```json
{ posts: Post[], hasMore: boolean }
```

### `GET` `/posts/:postId`

投稿の詳細を取得

認証: `canReadPosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

レスポンス:

```json
{ post: Post }
```

### `GET` `/posts/:postId/replies`

投稿のリプライ一覧を取得

認証: `canReadPosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |
| `page` | `number` |  | ページ番号 |
| `limit` | `number` |  | 取得件数 |

### `GET` `/posts/:postId/quotes`

投稿の引用一覧を取得

認証: `canReadPosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

### `PATCH` `/posts/:postId`

投稿を編集

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `content` | `string` |  | 投稿テキスト (最大200文字) |
| `visibility` | `string` |  | PUBLIC | CIRCLE |
| `viewerCircleId` | `number` |  | サークルID (visibility=CIRCLEの場合必須) |
| `replyRestriction` | `string` |  | EVERYONE | FOLLOWING | MENTIONED | CIRCLE |
| `replyCircleId` | `number` |  | サークルID (replyRestriction=CIRCLEの場合必須) |
| `isR18` | `boolean` |  | R18コンテンツフラグ |
| `hideFromMinors` | `boolean` |  | 未成年非表示フラグ |
| `isAiGenerated` | `boolean` |  | AI生成コンテンツフラグ |
| `isPromotional` | `boolean` |  | 宣伝コンテンツフラグ |
| `mediaSpoilerFlags` | `boolean[]` |  | メディアのスポイラーフラグ配列 |
| `mediaR18Flags` | `boolean[]` |  | メディアのR18フラグ配列 |

レスポンス:

```json
{ message, post: Post }
```

### `DELETE` `/posts/:postId`

投稿を削除 (リプライも連鎖削除)

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

レスポンス:

```json
{ message }
```


## インタラクション

<a id="interactions"></a>

いいね・ブックマーク・リカロートの操作。権限: canCreatePosts

### `POST` `/posts/:postId/like`

投稿にいいね

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

### `DELETE` `/posts/:postId/like`

いいねを取消

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

### `POST` `/posts/:postId/bookmark`

投稿をブックマーク

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

### `DELETE` `/posts/:postId/bookmark`

ブックマークを解除

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

### `PUT` `/posts/:postId/bookmark-folders`

ブックマークフォルダを更新

認証: `canCreatePosts`

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `folderIds` | `number[]` | ○ | フォルダIDの配列 |

### `POST` `/posts/:postId/rekarot`

リカロート（リポスト）

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

### `DELETE` `/posts/:postId/rekarot`

リカロートを取消

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

### `GET` `/bookmarks`

ブックマーク一覧を取得

認証: `canReadPosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `page` | `number` |  | ページ番号 |
| `limit` | `number` |  | 取得件数 |
| `folderId` | `number` |  | フォルダIDでフィルタ |


## ユーザー

<a id="users"></a>

ユーザー情報の取得。権限: canReadFollows

### `GET` `/users/me`

認証ユーザーのプロフィールを取得

レスポンス:

```json
{ id, username, displayName, avatarUrl, bio, followersCount, followingCount, ... }
```

### `GET` `/users/:id`

ユーザーIDで取得

認証: `canReadFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `GET` `/users/by/username/:username`

ユーザー名で取得

認証: `canReadFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `username` | `string` | ○ | ユーザー名 |

### `GET` `/users/:id/followers`

フォロワー一覧を取得

認証: `canReadFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |
| `limit` | `number` |  | 取得件数 (1-50) |
| `cursor` | `string` |  | ページネーションカーソル |

### `GET` `/users/:id/following`

フォロー中一覧を取得

認証: `canReadFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |
| `limit` | `number` |  | 取得件数 (1-50) |
| `cursor` | `string` |  | ページネーションカーソル |


## フォロー

<a id="follows"></a>

フォロー操作・リクエスト管理。権限: canWriteFollows

### `POST` `/users/:id/follow`

ユーザーをフォロー

認証: `canWriteFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `DELETE` `/users/:id/follow`

フォローを解除

認証: `canWriteFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `GET` `/follows/:username`

フォロー状態を確認

認証: `canReadFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `username` | `string` | ○ | ユーザー名 |

### `GET` `/follow-requests`

フォローリクエスト一覧

認証: `canReadFollows`

### `POST` `/follow-requests/:requestId/accept`

フォローリクエストを承認

認証: `canWriteFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `requestId` | `number` | ○ | リクエストID |

### `POST` `/follow-requests/:requestId/reject`

フォローリクエストを拒否

認証: `canWriteFollows`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `requestId` | `number` | ○ | リクエストID |


## 検索

<a id="search"></a>

投稿やユーザーの検索。権限: canReadPosts

### `GET` `/search`

投稿またはユーザーを検索

認証: `canReadPosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `q` | `string` | ○ | 検索クエリ |
| `type` | `string` |  | posts | users (デフォルト: posts) |
| `page` | `number` |  | ページ番号 |
| `limit` | `number` |  | 取得件数 |


## ニュース

<a id="news"></a>

ニュース記事の取得・作成。権限: canReadNews / canCreateNews / canPublishNews

### `GET` `/news`

ニュース記事一覧を取得

認証: `canReadNews`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `page` | `number` |  | ページ番号 |
| `limit` | `number` |  | 取得件数 |

### `POST` `/news`

ニュース記事を作成（下書き）

認証: `canCreateNews`

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `title` | `string` | ○ | 記事タイトル |
| `body` | `string` | ○ | 記事本文 (Markdown) |
| `category` | `string` | ○ | カテゴリ |
| `summary` | `string` |  | 記事の要約 |

レスポンス:

```json
{ article: NewsArticle }
```

### `POST` `/news/uploads`

ニュース用画像をアップロード

認証: `canCreateNews`

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `media` | `File[]` | ○ | 画像ファイル (最大6枚) |

### `GET` `/news/:articleId`

記事の詳細を取得

認証: `canReadNews`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `articleId` | `number` | ○ | 記事ID |

### `PUT` `/news/:articleId`

記事を更新

認証: `canCreateNews`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `articleId` | `number` | ○ | 記事ID |

### `POST` `/news/:articleId/submit`

記事を審査に提出

認証: `canPublishNews`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `articleId` | `number` | ○ | 記事ID |


## リアクション

<a id="reactions"></a>

投稿への絵文字リアクション操作。権限: canCreatePosts / canReadPosts

### `POST` `/posts/:postId/react`

投稿に絵文字リアクション

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `emoji` | `string` | ○ | 絵文字 (Unicode) |

### `DELETE` `/posts/:postId/react/:emoji`

リアクションを取消

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |
| `emoji` | `string` | ○ | 絵文字 |

### `GET` `/posts/:postId/reactions`

投稿のリアクション一覧

認証: `canReadPosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `postId` | `number` | ○ | 投稿ID |

レスポンス:

```json
{ reactions: [{ emoji, count, reacted }] }
```


## ストーリー

<a id="stories"></a>

24時間で消えるストーリーの閲覧・操作。権限: canReadStories / canWriteStories

### `GET` `/stories`

フォロー中ユーザーのストーリー一覧

認証: `canReadStories`

レスポンス:

```json
{ stories: Story[] }
```

### `GET` `/stories/user/:username`

指定ユーザーのストーリー一覧

認証: `canReadStories`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `username` | `string` | ○ | ユーザー名 |

### `POST` `/stories/:storyId/like`

ストーリーにいいね

認証: `canWriteStories`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `storyId` | `number` | ○ | ストーリーID |

### `DELETE` `/stories/:storyId/like`

ストーリーのいいねを取消

認証: `canWriteStories`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `storyId` | `number` | ○ | ストーリーID |

### `GET` `/stories/:storyId/comments`

ストーリーのコメント一覧

認証: `canReadStories`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `storyId` | `number` | ○ | ストーリーID |

レスポンス:

```json
{ comments: [{ id, storyId, authorId, content, createdAt, author }] }
```

### `POST` `/stories/:storyId/comments`

ストーリーにコメント

認証: `canWriteStories`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `storyId` | `number` | ○ | ストーリーID |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `content` | `string` | ○ | コメント本文 (最大200文字) |

レスポンス:

```json
{ comment: { id, storyId, authorId, content, createdAt, author } }
```


## 掲示板

<a id="boards"></a>

掲示板の閲覧・スレッド作成・リプライ・リアクション。権限: canReadBoards / canWriteBoards

### `GET` `/boards`

掲示板一覧を取得

認証: `canReadBoards`

レスポンス:

```json
{ boards: [{ id, slug, title, description, threadCount, replyCount, followed }] }
```

### `GET` `/boards/:slug`

掲示板の詳細とスレッド一覧

認証: `canReadBoards`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `slug` | `string` | ○ | 掲示板スラッグ |
| `limit` | `number` |  | スレッド取得件数 (デフォルト: 20, 最大: 50) |

### `GET` `/boards/threads/:threadId`

スレッドとリプライ一覧を取得

認証: `canReadBoards`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `threadId` | `number` | ○ | スレッドID |

レスポンス:

```json
{ thread: Thread, replies: Reply[] }
```

### `POST` `/boards/:slug/threads`

新しいスレッドを作成

認証: `canWriteBoards`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `slug` | `string` | ○ | 掲示板スラッグ |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `title` | `string` | ○ | タイトル (最大100文字) |
| `content` | `string` | ○ | 本文 (最大10000文字) |

### `POST` `/boards/threads/:threadId/replies`

スレッドにリプライ

認証: `canWriteBoards`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `threadId` | `number` | ○ | スレッドID |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `content` | `string` | ○ | 本文 (最大10000文字) |

### `POST` `/boards/threads/:threadId/react`

スレッドに絵文字リアクション (トグル)

認証: `canWriteBoards`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `threadId` | `number` | ○ | スレッドID |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `emoji` | `string` | ○ | 絵文字 |

### `POST` `/boards/replies/:replyId/react`

リプライに絵文字リアクション (トグル)

認証: `canWriteBoards`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `replyId` | `number` | ○ | リプライID |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `emoji` | `string` | ○ | 絵文字 |


## ダイレクトメッセージ

<a id="dm"></a>

DMグループ・メッセージの閲覧・送信。権限: canReadDm / canWriteDm

### `GET` `/dm/groups`

DMグループ一覧を取得

認証: `canReadDm`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `page` | `number` |  | ページ番号 (デフォルト: 1) |
| `limit` | `number` |  | 取得件数 (デフォルト: 20, 最大: 50) |

レスポンス:

```json
{ groups: [{ id, name, isGroup, members, ... }], pagination }
```

### `GET` `/dm/groups/:groupId/messages`

グループのメッセージ一覧

認証: `canReadDm`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `groupId` | `number` | ○ | グループID |
| `limit` | `number` |  | 取得件数 (デフォルト: 50, 最大: 100) |
| `cursor` | `number` |  | ページネーションカーソル (メッセージID) |

レスポンス:

```json
{ messages: Message[], pagination: { hasNext, nextCursor } }
```

### `POST` `/dm/groups/:groupId/messages`

メッセージを送信

認証: `canWriteDm`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `groupId` | `number` | ○ | グループID |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `content` | `string` | ○ | メッセージ本文 (最大4000文字) |

レスポンス:

```json
{ message: { id, groupId, senderId, content, attachmentUrls, attachmentTypes, sender, createdAt } }
```

### `POST` `/dm/groups/:groupId/messages/images`

画像付きDMを送信 (multipart/form-data)

認証: `canWriteDm`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `groupId` | `number` | ○ | グループID |

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `content` | `string` |  | 任意のメッセージ本文 (最大4000文字) |
| `images` | `File[]` | ○ | 画像ファイル (JPG / PNG / WEBP / GIF / HEIC / HEIF、最大4枚) |
| `attachmentAlts` | `string` |  | 代替テキスト配列のJSON文字列 |
| `attachmentSpoilerFlags` | `string` |  | スポイラーフラグ配列のJSON文字列 |
| `attachmentR18Flags` | `string` |  | R18フラグ配列のJSON文字列 |

レスポンス:

```json
{ message: { id, groupId, senderId, content, attachmentUrls, attachmentTypes, attachmentAlts, sender, createdAt } }
```

### `POST` `/dm/groups/:groupId/read`

グループを既読にする

認証: `canReadDm`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `groupId` | `number` | ○ | グループID |


## 通知

<a id="notifications"></a>

通知の取得・既読・削除。権限: canReadPosts / canCreatePosts

### `GET` `/notifications`

通知一覧を取得

認証: `canReadPosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `page` | `number` |  | ページ番号 (デフォルト: 1) |
| `limit` | `number` |  | 取得件数 (デフォルト: 20, 最大: 100) |
| `type` | `string` |  | タイプでフィルタ (カンマ区切り: LIKE,REPLY,MENTION,FOLLOW,REKAROT,REACTION,QUOTE等) |

レスポンス:

```json
{ notifications: [{ id, type, message, actor, post, isRead, createdAt }], pagination }
```

### `GET` `/notifications/unread/count`

未読通知数を取得

認証: `canReadPosts`

レスポンス:

```json
{ count: number }
```

### `PATCH` `/notifications/:notificationId/read`

通知を既読にする

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `notificationId` | `number` | ○ | 通知ID |

### `PATCH` `/notifications/read-all`

すべての通知を既読にする

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `type` | `string` |  | タイプでフィルタ (カンマ区切り) |

### `DELETE` `/notifications/:notificationId`

通知を削除

認証: `canCreatePosts`

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `notificationId` | `number` | ○ | 通知ID |


## v2 互換API

<a id="v2-compat"></a>

Twitter API v2 互換のエンドポイント群。既存ツールからの移行を容易にします。

### `GET` `/2/users/me`

認証ユーザーを取得

### `GET` `/2/users/:id`

ユーザーをIDで取得

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `GET` `/2/users/by/username/:username`

ユーザーをユーザー名で取得

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `username` | `string` | ○ | ユーザー名 |

### `GET` `/2/users/:id/followers`

フォロワー一覧

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `GET` `/2/users/:id/following`

フォロー中一覧

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `POST` `/2/users/:id/following`

ユーザーをフォロー

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `DELETE` `/2/users/:sourceUserId/following/:targetUserId`

フォローを解除

### `GET` `/2/users/:id/tweets`

ユーザーの投稿一覧

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `GET` `/2/users/:id/timelines/reverse_chronological`

ホームタイムライン

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | ユーザーID |

### `POST` `/2/tweets`

投稿を作成

リクエストボディ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `text` | `string` | ○ | 投稿テキスト |

### `GET` `/2/tweets/:id`

投稿を取得

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `id` | `number` | ○ | 投稿ID |

### `GET` `/2/tweets/search/recent`

最近の投稿を検索

クエリ / パスパラメータ:

| 名前 | 型 | 必須 | 説明 |
| --- | --- | --- | --- |
| `query` | `string` | ○ | 検索クエリ |


## レスポンススキーマ

<a id="schemas"></a>

開発者APIが実際に返す主要オブジェクトのフィールド一覧。Post/User の例を示します。

### `GET` `/schemas/post`

Post オブジェクト（開発者APIが実際に返すフィールド）

レスポンス:

```json
{
  "id": 123,
  "content": "投稿本文",
  "authorId": 45,
  "parentId": null,
  "quotedPostId": null,
  "mediaUrls": ["https://.../1.jpg"],
  "mediaTypes": ["image"],
  "mediaAlts": [""],
  "mediaSpoilerFlags": [false],
  "mediaR18Flags": [false],
  "minimumAge": null,
  "maximumAge": null,
  "isR18": false,
  "hideFromMinors": false,
  "adminForceHidden": false,
  "adminForceR18": false,
  "embedUrl": null,
  "embedTitle": null,
  "embedDescription": null,
  "embedImage": null,
  "likesCount": 10,
  "rekarotsCount": 2,
  "repliesCount": 3,
  "viewsCount": 100,
  "bookmarksCount": 1,
  "replyRestriction": "EVERYONE",
  "replyCircleId": null,
  "excludedMentions": [],
  "isAiGenerated": false,
  "isPromotional": false,
  "editedAt": null,
  "createdAt": "2026-04-12T12:34:56.789Z",
  "updatedAt": "2026-04-12T12:34:56.789Z",
  "author": {
    "id": 45,
    "username": "alice",
    "displayName": "Alice",
    "avatarUrl": "https://.../avatar.jpg",
    "avatarFrameId": null,
    "officialMark": "NONE",
    "isParodyAccount": false,
    "isBotAccount": false,
    "adminForceParody": false,
    "adminForceBot": false,
    "isPrivate": false
  },
  "viewerCircle": null,
  "viewerCircleId": null,
  "replyCircle": null,
  "replyCircleId": null,
  "mentions": [{ "mentionedId": 12 }],
  "replyTargets": [{ "user": { "id": 12, "username": "bob", "displayName": "Bob", "avatarUrl": "https://.../bob.jpg", "avatarFrameId": null, "officialMark": "NONE", "isPrivate": false } }],
  "quotedPost": null,
  "poll": null,
  "reactions": [{ "emoji": "👍", "userId": 45 }],
  "reactionSummary": [{ "emoji": "👍", "count": 1, "reacted": false }],
  "likes": [{ "id": 678 }],
  "rekarots": [],
  "bookmarks": [],
  "hashtags": ["tag1", "tag2"],
  "replyToUsers": [],
  "bookmarksCount": 1,
  "_count": { "likes": 10, "rekarots": 2, "replies": 3, "reactions": 5, "bookmarks": 1 },
  "liked": false,
  "rekaroted": false,
  "bookmarked": false
}
```

### `GET` `/schemas/user`

User オブジェクト（開発者APIが実際に返すフィールド）

レスポンス:

```json
{
  "user": {
    "id": 45,
    "username": "alice",
    "displayName": "Alice",
    "avatarUrl": "https://.../avatar.jpg",
    "avatarFrameId": null,
    "headerUrl": "https://.../header.jpg",
    "bio": "自己紹介",
    "websiteUrl": null,
    "location": null,
    "isPrivate": false,
    "officialMark": "NONE",
    "isBotAccount": false,
    "isParodyAccount": false,
    "followersCount": 123,
    "followingCount": 45,
    "postsCount": 78,
    "createdAt": "2026-01-01T00:00:00.000Z",
    "pinnedPostId": null
  },
  "relationship": {
    "isFollowing": false,
    "isFollowedBy": false,
    "isBlocked": false,
    "isBlockedBy": false,
    "isMuted": false,
    "hasPendingRequest": false
  },
  "pinnedPost": null
}
```

### `GET` `/schemas/poll`

Poll オブジェクト（開発者APIが実際に返すフィールド）

レスポンス:

```json
{
  "id": 11,
  "expiresAt": "2026-04-12T13:00:00.000Z",
  "isExpired": false,
  "isAnonymous": true,
  "totalVotes": 42,
  "ownVoteOptionId": null,
  "options": [
    {
      "id": 1,
      "text": "選択肢A",
      "imageUrl": null,
      "position": 0,
      "votesCount": 30,
      "percentage": 71,
      "votedByMe": false
    },
    {
      "id": 2,
      "text": "選択肢B",
      "imageUrl": null,
      "position": 1,
      "votesCount": 12,
      "percentage": 29,
      "votedByMe": false
    }
  ]
}
```

### `GET` `/schemas/timeline-item`

Timeline のアイテム（POST/REKAROT など）サンプル

レスポンス:

```json
{
  "type": "POST",
  "time": "2026-04-12T12:34:56.789Z",
  "itemId": "post-123",
  "id": 123,
  "content": "投稿本文",
  "authorId": 45,
  "likesCount": 10,
  "repliesCount": 3,
  "rekarotsCount": 2,
  "createdAt": "2026-04-12T12:34:56.789Z",
  "author": {
    "id": 45,
    "username": "alice",
    "displayName": "Alice",
    "avatarUrl": "https://.../avatar.jpg"
  }
}
```

