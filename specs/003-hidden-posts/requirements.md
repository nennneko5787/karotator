# 003 表示できないカロート — requirements

略号: `HIDE`

## 背景

Karotter は、閲覧者が見てはいけないカロートを**省略した形**で返す。本体を伏せたうえで
「なぜ見せないか」だけを載せる。実際に観測した引用元がこれ。

```jsonc
"quotedPostId": 1764682,
"quotedPost": {
  "id": 1764682,
  "parentId": null,
  "quotedPostId": null,
  "authorId": 81,
  "author": null,          // ← null
  "replyToUsers": [],
  "canView": false,
  "hiddenReason": "FILTERED",
  "hiddenFilterDetail": "MINOR_RESTRICTED"
}
```

現行の `QuotedPost` は `author` / `createdAt` / `likesCount` などを `required` で宣言しているため、
**この応答をパースできない**。しかも引用元は親カロートの一部なので、1 件混ざるだけで
タイムラインのレスポンスが丸ごと読めなくなる。

これは [002 design §2](../002-response-models/design.md) が既に警告していた失敗である。

> 新しく足すフィールドは必ず `@Default(...)` か nullable にする。
> `required` を足すと、そのフィールドを返さないエンドポイント（一覧の簡略版など）でパースが落ちる。

`QuotedPost` はこの規則の適用外だと暗黙に扱われてきた。実際には**最も欠けやすいモデル**だった。

## 観測した仕様

出典: `https://karotter.com` のバンドル。`KaroatCard-W_gj4viW.js`（引用カード）と
`Post--g0vUbZo.js`（スレッド親カード）の文言生成関数。

### 二段構えの理由コード

`hiddenReason` が親で、値によって見る詳細フィールドが変わる。

| `hiddenReason` | 見る詳細 |
| --- | --- |
| `RELATION` | `hiddenRelationDetail` |
| `FILTERED` | `hiddenFilterDetail` |

`hiddenRelationDetail` — 閲覧者と作者の関係による非表示。

| 値 | 意味 |
| --- | --- |
| `BLOCKED` | 閲覧者が作者をブロックしている |
| `BLOCKED_BY_AUTHOR` | 作者が閲覧者をブロックしている |
| `MUTED` | 閲覧者が作者をミュートしている |
| (既定) | ブロックまたはミュート設定 |

`hiddenFilterDetail` — 設定・公開範囲による非表示。

| 値 | 意味 |
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
| `NOT_FOUND` | 引用元を取得できなかった（後述。**サーバーは返さない**） |
| (既定) | 表示設定または公開範囲 |

いずれも既定の分岐があり、Karotter 側で値が増えうる前提で書かれている。

### クライアント側で合成する `NOT_FOUND`

`quotedPostId` があるのに `quotedPost` が無いとき、Web クライアントは自前でスタブを作る。

```js
e.quotedPost ? e.quotedPost
  : typeof e.quotedPostId === "number"
    ? {id: e.quotedPostId, canView: false, hiddenReason: "FILTERED", hiddenFilterDetail: "NOT_FOUND"}
    : null
```

`NOT_FOUND` の文言はこの合成経路にしか存在しない。スレッド親カード側の分岐には無く、既定に落ちる。

### 見せられるものだけ見せる

`canView: false` のとき、Web は作者行（アバター・表示名・マーク・@ID）ごと出さない。
`canView !== false` **かつ** `author` がある場合にだけ描く。`createdAt` / `editedAt` も
`"createdAt" in P && P.createdAt` のように存在確認してから触っている。
つまり **`id` 以外は何も保証されていない**。

### 復帰できる非表示がある

`hiddenReason === "RELATION"` かつ `hiddenRelationDetail` が `MUTED` / `BLOCKED`
（＝**閲覧者が自分で**隠した）ときだけ、「表示する」ボタンを出して取り直す。

```
GET /posts/{id}?includeMutedOrBlocked=true
```

`BLOCKED_BY_AUTHOR` にはボタンを出さない。相手が隠したものを閲覧者の操作では開けない。
一度開いたら、そこから辿る引用元・スレッドにもこのフラグを引き継ぐ。
同じパラメータは `GET /users/{username}` と `GET /users/{id}/{tab}` にも効く。

### 引用元だけの話ではない

スレッドの親を辿る箇所は `GET /posts/{id}` の応答本体を `canView` で判定している。

```js
const n = (await c.get(`/posts/${r}`, {params:{includeUnavailableReference:true, ...}})).data.post;
if (n.canView !== false) U.setQueryData(["post", n.id], n);   // 見えない親はキャッシュしない
```

**カロートを単体で取得しても、非表示スタブが返る。** 引用元のモデルだけ直しても足りない。

## 発見済みの不整合

| # | 内容 | 影響 |
| --- | --- | --- |
| 1 | `QuotedPost.author` / `createdAt` が `required` | **非表示の引用元が 1 件混ざるとタイムライン全体が落ちる** |
| 2 | `hiddenRelationDetail` がモデルに無い | ブロック・ミュート由来の非表示を区別できない |
| 3 | `hiddenReason` / `hiddenFilterDetail` が `String?` | 文字列比較が UI に散る。未知の値との区別も付かない |
| 4 | `Post` に `canView` が無い | 単体取得・スレッド親の非表示を検出できない |
| 5 | `quotedPostId` があり `quotedPost` が無い場合を素通り | 引用の存在自体が画面から消える |
| 6 | 「表示する」に相当する導線が無い | 自分でミュートした相手の引用を開けない |
| 7 | `AbstractPost` の 22 フィールドが未使用 | `QuotedPost` に「揃っているはず」の前提を作り、1 の遠因になった |
| 8 | `UserResponse.pinnedPost` が `QuotedPost` 型 | 固定ポストと引用元が同じ型。`profile_tab.dart` が `post is QuotedPost` を固定ポストの判定に使っている |

7・8 は 1 の直接の原因ではないが、同じ「型が実態より多くを約束している」問題である。

## 要件

### 表現

- **REQ-HIDE-001** レスポンスに `canView` が `false` のカロートが含まれるとき、システムは解釈を中断せず、そのカロートを保持すること。
- **REQ-HIDE-002** 表示できないカロートについて、システムが存在を前提としてよい項目は `id` のみとすること。
- **REQ-HIDE-003** システムは、表示できるカロートと表示できないカロートを、呼び出し側が取り違えられない形で区別できるようにすること。
- **REQ-HIDE-004** システムは、表示できないカロートについて理由コードと詳細コードを保持すること。
- **REQ-HIDE-005** 知らない理由コードを受け取ったとき、システムは例外を投げず、既定の扱いに落とすこと。
- **REQ-HIDE-006** もし `quotedPostId` があり `quotedPost` が無いならば、システムはそれを「取得できなかった引用元」として扱うこと。

### 適用範囲

- **REQ-HIDE-007** システムは、引用元・スレッドの親・単体取得したカロートのいずれについても、同じ非表示の扱いを適用すること。
- **REQ-HIDE-008** 表示できないカロートを受け取ったとき、システムはそれを完全なカロートとして再利用しないこと。
- **REQ-HIDE-009** システムは、固定ポストであることを、型の違いではなく明示的な指定で表すこと。

### 表示

- **REQ-HIDE-010** 表示できないカロートを描くとき、システムは理由に応じた文言を Karotter Web と同じ内容で示すこと。
- **REQ-HIDE-011** 表示できないカロートを描くとき、システムは作者・本文・メディアを一切示さないこと。
- **REQ-HIDE-012** 理由コードが未知である間、システムは既定の文言を示すこと。

### 復帰

- **REQ-HIDE-013** 閲覧者自身のミュートまたはブロックにより非表示となっている場合、システムは閲覧者がそのカロートを開く手段を提供すること。
- **REQ-HIDE-014** もし作者が閲覧者をブロックしていることによる非表示ならば、システムは開く手段を提供しないこと。
- **REQ-HIDE-015** 閲覧者が非表示のカロートを開いた後、システムはそこから辿るカロートについても同じ扱いを引き継ぐこと。

### 堅さ

- **REQ-HIDE-016** システムは、モデルが存在を前提とする項目について、そのモデルを返す全てのエンドポイントがそれを返すという根拠を持つこと。
- **REQ-HIDE-017** システムは、画面が用いない項目をモデルに持たないこと。

### 検証

- **REQ-HIDE-018** システムは、Karotter Web のバンドルから列挙値とその出典チャンクを抽出する手段を提供すること。
- **REQ-HIDE-019** システムは、非表示のカロートを含むレスポンスを解釈できることを、実データに基づく試験で示すこと。

## 未解決

| 項目 | 内容 |
| --- | --- |
| `includeUnavailableReference` | スレッド親の取得時に併用されている。何が変わるか未確認 |
| `hiddenReason` の全値 | 観測できたのは `RELATION` と `FILTERED` のみ。既定分岐がある以上、他にもありうる |
| 非表示スタブの `parentId` / `replyToUsers` | スタブにも含まれる。表示に使うかは未定 |
| `Post` 本体がスタブで返る条件 | バンドルの判定から存在は確実。実レスポンスは未観測 |

## 非目標

- 引用の入れ子表示。Karotter Web は深さ 2 まで辿り循環も防いでいるが、karotator は 1 段も実装していない。003 では扱わない。
- R18 カロートを閲覧者側で伏せる UI。002 から持ち越している別件。
- ミュートキーワード・BOT 非表示などの**設定側**の実装。003 は「サーバーが隠した結果を正しく扱う」までとする。
- `AbstractUser` 系の同種の点検。構造は似ているが別途扱う。
