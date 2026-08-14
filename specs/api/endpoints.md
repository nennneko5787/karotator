# Karotter API エンドポイント一覧

<!-- このファイルは自動生成される。手で編集しない。 -->
<!-- 再生成: dart run tool/fetch_api_spec.dart -->

出典: `https://karotter.com` の JS バンドル（`tool/fetch_api_spec.dart` による抽出）。
全 **297** 件 / 24 カテゴリ。

パスは `<APIホスト>/api` からの相対。`{}` はパスパラメータ。
規約（認証・CSRF・ページネーション）は [conventions.md](conventions.md) を参照。

> [!WARNING]
> ミニファイされた JS からのヒューリスティックな抽出であり、網羅性も正確性も保証しない。
> 動的に組み立てられたパスは含まれない。クエリ欄は観測できた範囲。

## カテゴリ

- [`/apikeys`](#apikeys) — 3 件
- [`/audio`](#audio) — 1 件
- [`/auth`](#auth) — 22 件
- [`/boards`](#boards) — 15 件
- [`/channels`](#channels) — 19 件
- [`/communities`](#communities) — 21 件
- [`/contact`](#contact) — 1 件
- [`/dm`](#dm) — 19 件
- [`/draw`](#draw) — 9 件
- [`/follow`](#follow) — 18 件
- [`/guild-bots`](#guild-bots) — 4 件
- [`/guilds`](#guilds) — 30 件
- [`/invites`](#invites) — 1 件
- [`/news`](#news) — 15 件
- [`/notifications`](#notifications) — 6 件
- [`/oauth`](#oauth) — 4 件
- [`/posts`](#posts) — 36 件
- [`/radio`](#radio) — 18 件
- [`/reports`](#reports) — 1 件
- [`/search`](#search) — 4 件
- [`/social`](#social) — 27 件
- [`/subscriptions`](#subscriptions) — 9 件
- [`/users`](#users) — 12 件
- [`/v2`](#v2) — 2 件

## apikeys

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/apikeys` |  |
| `POST` | `/apikeys` |  |
| `DELETE` | `/apikeys/{}` |  |

## audio

| Method | Path | Query |
| --- | --- | --- |
| `POST` | `/audio` |  |

## auth

| Method | Path | Query |
| --- | --- | --- |
| `POST` | `/auth/2fa/disable` |  |
| `POST` | `/auth/2fa/enable` |  |
| `GET` | `/auth/2fa/setup` |  |
| `GET` | `/auth/csrf-token` |  |
| `POST` | `/auth/forgot-password` |  |
| `GET` | `/auth/legal-quiz` |  |
| `POST` | `/auth/legal-quiz/grade` |  |
| `POST` | `/auth/login` |  |
| `POST` | `/auth/login/2fa` |  |
| `POST` | `/auth/logout` |  |
| `GET` | `/auth/me` |  |
| `POST` | `/auth/me/email` |  |
| `POST` | `/auth/me/email/resend` |  |
| `DELETE` | `/auth/oauth/{}` |  |
| `POST` | `/auth/register` |  |
| `POST` | `/auth/reset-password` |  |
| `POST` | `/auth/session-unread-snapshots` |  |
| `GET` | `/auth/sessions` |  |
| `DELETE` | `/auth/sessions/others` |  |
| `DELETE` | `/auth/sessions/{}` |  |
| `POST` | `/auth/switch-session` |  |
| `POST` | `/auth/verify-email` |  |

## boards

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/boards` |  |
| `POST` | `/boards` |  |
| `GET` | `/boards/following` |  |
| `DELETE` | `/boards/{}` |  |
| `GET` | `/boards/{}` |  |
| `DELETE` | `/boards/{}/follow` |  |
| `POST` | `/boards/{}/follow` |  |
| `POST` | `/boards/{}/replies/{}/reactions` |  |
| `POST` | `/boards/{}/threads` |  |
| `DELETE` | `/boards/{}/threads/{}` |  |
| `GET` | `/boards/{}/threads/{}` |  |
| `DELETE` | `/boards/{}/threads/{}/follow` |  |
| `POST` | `/boards/{}/threads/{}/follow` |  |
| `POST` | `/boards/{}/threads/{}/reactions` |  |
| `POST` | `/boards/{}/threads/{}/replies` |  |

## channels

| Method | Path | Query |
| --- | --- | --- |
| `DELETE` | `/channels/messages/{}` |  |
| `PATCH` | `/channels/messages/{}` |  |
| `POST` | `/channels/messages/{}/reactions` |  |
| `DELETE` | `/channels/{}` |  |
| `PATCH` | `/channels/{}` |  |
| `GET` | `/channels/{}/forum-posts` | `limit` |
| `POST` | `/channels/{}/forum-posts` |  |
| `GET` | `/channels/{}/forum-posts/{}` | `limit` |
| `POST` | `/channels/{}/forum-posts/{}/replies` |  |
| `GET` | `/channels/{}/messages` | `limit` |
| `POST` | `/channels/{}/messages` |  |
| `PUT` | `/channels/{}/permissions/{}/{}` |  |
| `DELETE` | `/channels/{}/stage` |  |
| `PATCH` | `/channels/{}/stage` |  |
| `POST` | `/channels/{}/stage` |  |
| `PATCH` | `/channels/{}/stage/me` |  |
| `PATCH` | `/channels/{}/stage/participants/{}` |  |
| `POST` | `/channels/{}/voice/join` |  |
| `POST` | `/channels/{}/voice/leave` |  |

## communities

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/communities` | `q` |
| `POST` | `/communities` |  |
| `GET` | `/communities/home-timelines` |  |
| `PUT` | `/communities/home-timelines/reorder` |  |
| `DELETE` | `/communities/{}` |  |
| `GET` | `/communities/{}` | `tab` |
| `PATCH` | `/communities/{}` |  |
| `DELETE` | `/communities/{}/home-timeline` |  |
| `POST` | `/communities/{}/home-timeline` |  |
| `POST` | `/communities/{}/invite` |  |
| `POST` | `/communities/{}/join` |  |
| `POST` | `/communities/{}/leave` |  |
| `GET` | `/communities/{}/members` |  |
| `DELETE` | `/communities/{}/members/{}` |  |
| `PATCH` | `/communities/{}/members/{}/role` |  |
| `POST` | `/communities/{}/owner-transfer` |  |
| `GET` | `/communities/{}/posts` | `e`, `limit`, `page`, `tab` |
| `POST` | `/communities/{}/posts/{}/hide` |  |
| `GET` | `/communities/{}/reports` |  |
| `PATCH` | `/communities/{}/reports/{}` |  |
| `PUT` | `/communities/{}/rules` |  |

## contact

| Method | Path | Query |
| --- | --- | --- |
| `POST` | `/contact` |  |

## dm

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/dm/groups` | `limit`, `n`, `page`, `t` |
| `POST` | `/dm/groups` |  |
| `GET` | `/dm/groups/{}` | `limit`, `n`, `page`, `r` |
| `POST` | `/dm/groups/{}/call/join` |  |
| `POST` | `/dm/groups/{}/call/leave` |  |
| `POST` | `/dm/groups/{}/call/start` |  |
| `POST` | `/dm/groups/{}/clear` |  |
| `POST` | `/dm/groups/{}/leave` |  |
| `POST` | `/dm/groups/{}/members` |  |
| `DELETE` | `/dm/groups/{}/members/{}` |  |
| `GET` | `/dm/groups/{}/messages` | `limit`, `n`, `page`, `r` |
| `POST` | `/dm/groups/{}/messages` |  |
| `POST` | `/dm/groups/{}/read` |  |
| `DELETE` | `/dm/messages/{}` |  |
| `PATCH` | `/dm/messages/{}` |  |
| `POST` | `/dm/messages/{}/poll/vote` |  |
| `POST` | `/dm/messages/{}/reactions` |  |
| `POST` | `/dm/start` |  |
| `GET` | `/dm/unread/count` | `limit`, `n`, `page`, `t` |

## draw

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/draw/rooms` | `limit`, `page` |
| `POST` | `/draw/rooms` |  |
| `DELETE` | `/draw/rooms/{}` |  |
| `GET` | `/draw/rooms/{}` |  |
| `POST` | `/draw/rooms/{}/chat` |  |
| `POST` | `/draw/rooms/{}/invite/rotate` |  |
| `POST` | `/draw/rooms/{}/join` |  |
| `PUT` | `/draw/rooms/{}/layers` |  |
| `GET` | `/draw/rooms/{}/realtime-token` |  |

## follow

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/follow/block` |  |
| `POST` | `/follow/block/${null==ct` | `void 0:ct.user.id}` |
| `DELETE` | `/follow/block/{}` |  |
| `POST` | `/follow/block/{}` |  |
| `DELETE` | `/follow/follower/${null==ct` | `void 0:ct.user.id}` |
| `POST` | `/follow/hide-rekarots/${null==ft` | `void 0:ft.user.id}` |
| `DELETE` | `/follow/hide-rekarots/{}` |  |
| `POST` | `/follow/hide-rekarots/{}` |  |
| `GET` | `/follow/mute` |  |
| `POST` | `/follow/mute/${null==ct` | `void 0:ct.user.id}` |
| `DELETE` | `/follow/mute/{}` |  |
| `POST` | `/follow/mute/{}` |  |
| `GET` | `/follow/requests/pending` |  |
| `POST` | `/follow/requests/{}/{}` |  |
| `DELETE` | `/follow/{}` |  |
| `POST` | `/follow/{}` |  |
| `DELETE` | `/follow/{}/post-notify` |  |
| `POST` | `/follow/{}/post-notify` |  |

## guild-bots

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/guild-bots/applications` |  |
| `POST` | `/guild-bots/applications` |  |
| `DELETE` | `/guild-bots/applications/{}` |  |
| `POST` | `/guild-bots/applications/{}/token` |  |

## guilds

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/guilds` |  |
| `POST` | `/guilds` |  |
| `DELETE` | `/guilds/{}` |  |
| `PATCH` | `/guilds/{}` |  |
| `GET` | `/guilds/{}/audit-logs` | `limit` |
| `GET` | `/guilds/{}/bans` |  |
| `POST` | `/guilds/{}/bans/${null==tn` | `void 0:tn.userId}` |
| `DELETE` | `/guilds/{}/bans/{}` |  |
| `GET` | `/guilds/{}/channels` |  |
| `POST` | `/guilds/{}/channels` |  |
| `PUT` | `/guilds/{}/channels/reorder` |  |
| `GET` | `/guilds/{}/events` |  |
| `POST` | `/guilds/{}/events` |  |
| `DELETE` | `/guilds/{}/events/{}` |  |
| `PATCH` | `/guilds/{}/events/{}` |  |
| `GET` | `/guilds/{}/invites` |  |
| `POST` | `/guilds/{}/invites` |  |
| `DELETE` | `/guilds/{}/invites/{}` |  |
| `GET` | `/guilds/{}/members` | `limit` |
| `DELETE` | `/guilds/{}/members/${null==Cs` | `void 0:Cs.id}` |
| `DELETE` | `/guilds/{}/members/${null==tn` | `void 0:tn.userId}`, `void 0:tn.userId}/roles/{}` |
| `PATCH` | `/guilds/{}/members/${null==tn` | `void 0:tn.userId}` |
| `POST` | `/guilds/{}/members/${null==tn` | `void 0:tn.userId}/transfer-ownership` |
| `PUT` | `/guilds/{}/members/${null==tn` | `void 0:tn.userId}/roles/{}` |
| `GET` | `/guilds/{}/messages/search` |  |
| `GET` | `/guilds/{}/roles` | `limit` |
| `POST` | `/guilds/{}/roles` |  |
| `DELETE` | `/guilds/{}/roles/{}` |  |
| `PATCH` | `/guilds/{}/roles/{}` |  |
| `GET` | `/guilds/{}/voice-states` |  |

## invites

| Method | Path | Query |
| --- | --- | --- |
| `POST` | `/invites/{}` |  |

## news

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/news` | `limit` |
| `POST` | `/news` |  |
| `GET` | `/news/${null==ie` | `void 0:ie.id}/comments` |
| `GET` | `/news/admin/list` |  |
| `PATCH` | `/news/admin/{}/review` |  |
| `GET` | `/news/me` |  |
| `POST` | `/news/uploads` |  |
| `DELETE` | `/news/{}` |  |
| `GET` | `/news/{}` |  |
| `PUT` | `/news/{}` |  |
| `POST` | `/news/{}/comments` |  |
| `DELETE` | `/news/{}/comments/{}` |  |
| `PATCH` | `/news/{}/comments/{}` |  |
| `DELETE` | `/news/{}/like` |  |
| `POST` | `/news/{}/like` |  |

## notifications

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/notifications` |  |
| `GET` | `/notifications/grouped-posts` | `notificationIds` |
| `POST` | `/notifications/push/register` |  |
| `POST` | `/notifications/push/unregister` |  |
| `PATCH` | `/notifications/read-all` |  |
| `GET` | `/notifications/unread/count` |  |

## oauth

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/oauth/clients` |  |
| `POST` | `/oauth/clients` |  |
| `DELETE` | `/oauth/clients/{}` |  |
| `POST` | `/oauth/clients/{}/secret` |  |

## posts

| Method | Path | Query |
| --- | --- | --- |
| `POST` | `/posts` |  |
| `PUT` | `/posts/${null==ne` | `void 0:ne.id}` |
| `POST` | `/posts/batch-views` |  |
| `POST` | `/posts/feedback/beta-survey` |  |
| `GET` | `/posts/me/bookmark-folders` |  |
| `POST` | `/posts/me/bookmark-folders` |  |
| `DELETE` | `/posts/me/bookmark-folders/{}` |  |
| `PATCH` | `/posts/me/bookmark-folders/{}` |  |
| `GET` | `/posts/me/bookmarks` | `limit`, `page` |
| `GET` | `/posts/recommended` | `limit`, `mode` |
| `GET` | `/posts/scheduled/me` |  |
| `DELETE` | `/posts/scheduled/{}` |  |
| `PUT` | `/posts/scheduled/{}` |  |
| `GET` | `/posts/timeline` | `limit`, `mode` |
| `DELETE` | `/posts/{}` |  |
| `GET` | `/posts/{}` | `includeMutedOrBlocked`, `includeUnavailableReference`, `limit` |
| `GET` | `/posts/{}/analytics` |  |
| `DELETE` | `/posts/{}/bookmark` |  |
| `POST` | `/posts/{}/bookmark` |  |
| `PUT` | `/posts/{}/bookmark-folders` |  |
| `POST` | `/posts/{}/conversation/leave` |  |
| `DELETE` | `/posts/{}/like` |  |
| `POST` | `/posts/{}/like` |  |
| `GET` | `/posts/{}/likes` | `limit` |
| `GET` | `/posts/{}/poll/options/{}/voters` | `limit` |
| `POST` | `/posts/{}/poll/vote` |  |
| `GET` | `/posts/{}/quotes` | `limit` |
| `POST` | `/posts/{}/react` |  |
| `DELETE` | `/posts/{}/react/{}` |  |
| `GET` | `/posts/{}/react/{}/users` | `limit` |
| `DELETE` | `/posts/{}/rekarot` |  |
| `POST` | `/posts/{}/rekarot` |  |
| `GET` | `/posts/{}/rekarots` | `limit` |
| `GET` | `/posts/{}/replies` | `limit`, `page` |
| `GET` | `/posts/{}/reply-targets` |  |
| `POST` | `/posts/{}/translate` |  |

## radio

| Method | Path | Query |
| --- | --- | --- |
| `POST` | `/radio` |  |
| `GET` | `/radio/active` |  |
| `GET` | `/radio/ice-servers` |  |
| `GET` | `/radio/{}` |  |
| `POST` | `/radio/{}/accept-speaker-invite` |  |
| `POST` | `/radio/{}/end` |  |
| `POST` | `/radio/{}/join` |  |
| `POST` | `/radio/{}/leave` |  |
| `GET` | `/radio/{}/messages` |  |
| `POST` | `/radio/{}/messages` |  |
| `DELETE` | `/radio/{}/participants/{}/invite-speaker` |  |
| `POST` | `/radio/{}/participants/{}/invite-speaker` |  |
| `PATCH` | `/radio/{}/participants/{}/mute` |  |
| `PATCH` | `/radio/{}/participants/{}/role` |  |
| `POST` | `/radio/{}/participants/{}/transfer-host` |  |
| `GET` | `/radio/{}/realtime-token` |  |
| `POST` | `/radio/{}/request-speaker` |  |
| `PATCH` | `/radio/{}/settings` |  |

## reports

| Method | Path | Query |
| --- | --- | --- |
| `POST` | `/reports` |  |

## search

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/search/communities` | `q` |
| `GET` | `/search/hashtags` | `q` |
| `GET` | `/search/trending/topics` | `limit` |
| `GET` | `/search/users` | `compact`, `limit`, `q` |

## social

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/social/circles` | `limit`, `q` |
| `POST` | `/social/circles` |  |
| `DELETE` | `/social/circles/{}` |  |
| `PATCH` | `/social/circles/{}` |  |
| `POST` | `/social/circles/{}/members` |  |
| `DELETE` | `/social/circles/{}/members/{}` |  |
| `GET` | `/social/link-preview` | `url` |
| `GET` | `/social/lists` | `limit`, `q` |
| `POST` | `/social/lists` |  |
| `DELETE` | `/social/lists/{}` |  |
| `PATCH` | `/social/lists/{}` |  |
| `POST` | `/social/lists/{}/members` |  |
| `DELETE` | `/social/lists/{}/members/{}` |  |
| `GET` | `/social/lists/{}/posts` | `limit` |
| `POST` | `/social/questions/${null==pt` | `void 0:pt.username}` |
| `GET` | `/social/questions/inbox` |  |
| `DELETE` | `/social/questions/{}` |  |
| `GET` | `/social/stories` |  |
| `POST` | `/social/stories` |  |
| `GET` | `/social/stories/user/{}` |  |
| `DELETE` | `/social/stories/{}` |  |
| `GET` | `/social/stories/{}/comments` |  |
| `POST` | `/social/stories/{}/comments` |  |
| `DELETE` | `/social/stories/{}/like` |  |
| `POST` | `/social/stories/{}/like` |  |
| `GET` | `/social/stories/{}/viewers` |  |
| `POST` | `/social/stories/{}/views` |  |

## subscriptions

| Method | Path | Query |
| --- | --- | --- |
| `POST` | `/subscriptions/checkout` |  |
| `POST` | `/subscriptions/gifts/checkout` |  |
| `GET` | `/subscriptions/gifts/received` |  |
| `GET` | `/subscriptions/gifts/{}` |  |
| `POST` | `/subscriptions/gifts/{}/response` |  |
| `GET` | `/subscriptions/me` |  |
| `GET` | `/subscriptions/plans` |  |
| `POST` | `/subscriptions/portal` |  |
| `PATCH` | `/subscriptions/preferences` |  |

## users

| Method | Path | Query |
| --- | --- | --- |
| `DELETE` | `/users/account` |  |
| `GET` | `/users/level-ranking` | `limit` |
| `PATCH` | `/users/password` |  |
| `PATCH` | `/users/profile` |  |
| `PATCH` | `/users/profile/pinned-post` |  |
| `GET` | `/users/recommended` | `limit` |
| `PATCH` | `/users/settings` |  |
| `PATCH` | `/users/status` |  |
| `PATCH` | `/users/username` |  |
| `GET` | `/users/username/quota` |  |
| `GET` | `/users/{}` | `limit` |
| `GET` | `/users/{}/{}` | `limit` |

## v2

| Method | Path | Query |
| --- | --- | --- |
| `GET` | `/v2/feed/public` | `kind`, `limit`, `mode` |
| `POST` | `/v2/feed/views` |  |
