# 002 レスポンスモデルの整合 — requirements

略号: `MODEL`

## 背景

`lib/objects/*.dart` の freezed モデルは、実際のレスポンスを見ながら手で書いてきたため、
Karotter 側にあってこちらに無いフィールドが溜まっている。どれが欠けているのかを
目視で追うのが難しくなった。

001 の調査で、Karotter 自身が書いた仕様がクライアントのバンドルに含まれていることが分かった。

| 情報源 | 中身 | 信頼度 |
| --- | --- | --- |
| [`specs/api/schemas/`](../api/schemas/) | Post / User / Poll / TimelineItem の完全な JSON 例 | 高（Karotter 自身の記述）。ただし**開発者 API** のもの |
| [`specs/api/developer-api.md`](../api/developer-api.md) | 85 エンドポイントのパラメータと応答 | 同上 |
| バンドル内の定数（`OfficialMarkBadge` など） | 列挙値・色・ラベル | 高（実際に画面がこれで描かれている） |
| `specs/api/observed-schemas.md` | 実際のレスポンスから起こした型 | 中（1 アカウント・1 回の観測） |

開発者 API と内部 API は一致しない箇所がある。実例として、開発者 API の `user` は
`officialMark` を文字列 1 つで返すが、内部 API は配列で返す（Web クライアントは
`Array.isArray(e) ? e : e ? [e] : []` で両方を受けている）。
**片方だけを根拠にモデルを変えない。**

## 発見済みの不整合

| # | 内容 | 影響 |
| --- | --- | --- |
| 1 | `Post` に `isR18` / `hideFromMinors` が無い | 投稿時に送っているのに、取得したカロートでは R18 判定ができない |
| 2 | `Post` に `minimumAge` / `maximumAge` が無い | 年齢制限が効かない |
| 3 | `Post` に `adminForceR18` / `adminForceHidden` が無い | 運営による強制設定を無視する |
| 4 | `OfficialMark` に 6 値（`GRAY` `PINK` `CORAL` `MAGENTA` `LIME` `BROWN`）と `NONE` が無い | **未知の値でパースが落ち、タイムライン全体が表示できなくなる** |
| 5 | `OfficialMark.RED` の色が `#EF4444`。実際は `#FF0000` | 色が違う |
| 6 | `Poll` に `isAnonymous`、`PollOption` に `imageUrl` が無い | 匿名投票・画像付き選択肢を扱えない |
| 7 | `Author` / `User` に `adminForceParody` / `adminForceBot` が無い | 同 3 |
| 8 | `PostVisibility` に `FOLLOWERS` / `PRIVATE` が無い | **フォロワー限定カロートが 1 件来ただけでタイムライン全体が落ちる** |
| 9 | `NotificationType` が 6 種類。実際は 17 種類 | **`MENTION` や `DM` の通知が 1 件来ただけで通知一覧が落ちる** |
| 10 | `AuthUser` が 6 フィールド。実際は 97 | 設定画面が作れない |
| 11 | `search/trending/topics` の応答キーは `topics` ではなく `trends` | トレンドが常に空 |
| 12 | `posts/scheduled/me` の応答キーは `posts` ではなく `scheduledPosts` | 予約投稿一覧が常に空 |
| 13 | `posts/{id}/reply-targets` の応答キーは `targets` ではなく `candidates`。中身も素のユーザー | 返信先候補が常に空 |
| 14 | `boards/following` は `boards` と `threads` の両方を返す | スレッドを取りこぼす |

`@Default(...)` は**キーが無いとき**にしか効かない。値が入っていて解釈できない場合は
`$enumDecode` が投げる。8・9 が既定値付きなのに落ちるのはそのため。

## 要件

### 堅さ

- **REQ-MODEL-001** 知らない列挙値を受け取ったとき、システムは例外を投げずにその値を無視すること。
- **REQ-MODEL-002** 列挙のフィールドが配列でも単一の値でも、システムは同じように読めること。
- **REQ-MODEL-003** レスポンスに無いフィールドがあるとき、システムは既定値を用いて解釈を続けること。
- **REQ-MODEL-004** モデルにフィールドを足すとき、システムは既存の呼び出し側を壊さないこと（新しいフィールドは既定値付きか nullable にすること）。

### 内容

- **REQ-MODEL-005** システムは、カロートについて `isR18` / `hideFromMinors` / `minimumAge` / `maximumAge` / `adminForceR18` / `adminForceHidden` を保持すること。
- **REQ-MODEL-006** システムは、作者の設定と運営の強制設定を合成した判定を 1 箇所で提供すること。
- **REQ-MODEL-007** システムは、`OfficialMark` の全 13 値と `NONE` を、Karotter Web と同じ色・表示名で保持すること。
- **REQ-MODEL-008** 引用元のカロートについても、システムは本体と同じ年齢・センシティブ判定を提供すること。

### 検証

- **REQ-MODEL-009** システムは、実際のレスポンスからフィールド名と型を観測し `specs/api/` へ書き出す手段を提供すること。
- **REQ-MODEL-010** 観測手段は、状態を変える操作（POST / PATCH / PUT / DELETE）を一切行わないこと。ログインを除く。
- **REQ-MODEL-011** 観測手段は、資格情報を環境変数からのみ読むこと。引数・ファイル・リポジトリに残さないこと。
- **REQ-MODEL-012** リポジトリに残す生成物には、トークン・メールアドレス等の秘匿値を含めないこと。

## 非目標

- R18 カロートを実際に伏せる UI。モデルに載せるところまでが 002 の範囲で、
  表示側は別途扱う（[tasks.md](tasks.md) の残タスクを参照）。
- 開発者 API（APIキー / Bot / OAuth）のクライアント実装。
- ギルド・コミュニティ等、karotator が未着手の領域のモデル。
