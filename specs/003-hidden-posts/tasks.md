# 003 表示できないカロート — tasks

## フェーズ 1: 落ちなくする

ここまでで実害は止まる。以降は整理なので分けて入れられる。

- [x] **T-01** `lib/enum.dart` に `HiddenReason` / `HiddenRelationDetail` / `HiddenFilterDetail` を追加 — REQ-HIDE-004
- [x] **T-02** `lib/objects/post.dart` に `sealed PostResult` / `sealed Quote` / `HiddenPost` を追加 — REQ-HIDE-001, 002, 003
- [x] **T-03** `HiddenPost.notFound` と `PostX.quote` — REQ-HIDE-006
- [x] **T-04** `QuoteConverter` を足し、`Post.quotedPost` の型を `Quote?` へ — REQ-HIDE-001
- [x] **T-05** `posts.byId` の戻り値を `PostResult` へ、`includeMutedOrBlocked` を追加 — REQ-HIDE-007, 013
- [x] **T-06** `build_runner` を回して `flutter analyze` を通す
- [x] **T-07** `test/objects/parsing_test.dart` に非表示スタブの試験を追加 — REQ-HIDE-019

## フェーズ 2: 表示する

- [x] **T-08** `lib/ui/post/hidden.dart` — 理由ごとの文言表 — REQ-HIDE-010, 012
- [x] **T-09** `HiddenPostX.canReveal` — REQ-HIDE-013, 014
- [x] **T-10** 非表示カードの widget。作者・本文・メディアを出さない — REQ-HIDE-011
- [x] **T-11** 「表示する」ボタンと再取得 — REQ-HIDE-013
- [x] **T-12** `revealMutedOrBlocked` を詳細ページ→カード→引用カードへ引き継ぐ — REQ-HIDE-015
- [x] **T-13** 取り直した結果が `HiddenPost` のとき詳細ページへ遷移させない — REQ-HIDE-008

## フェーズ 3: 型を整理する

- [x] **T-14** `AbstractPost` を廃止。`PostMedia` / `PostUserDetail` を素の値を取る形へ — REQ-HIDE-017
- [x] **T-15** `AbstractPostX` の `effectiveR18` / `effectiveHidden` を `PostX` へ移設（002 REQ-MODEL-006 は維持）
- [x] **T-16** `QuotedPost` を 30 → 6 項目に縮小 — REQ-HIDE-016, 017
- [x] **T-17** `PostPreviewCard` に引用元と固定ポストを寄せる — REQ-HIDE-009
- [x] **T-18** `response.dart` の `pinnedPost` / `pinnedPosts` を `Quote` へ
- [x] **T-19** `profile_tab.dart` の `post is QuotedPost` を明示の引数へ — REQ-HIDE-009
- [x] **T-20** `build_runner` / `flutter analyze` / テスト

## フェーズ 4: 仕様を残す

- [x] **T-21** `tool/grep_bundle.dart` — バンドルから列挙値を抽出する手段 — REQ-HIDE-018
- [x] **T-22** `specs/api/conventions.md` に §9「表示できないカロート」を追記
- [x] **T-23** `specs/002-response-models/requirements.md` の REQ-MODEL-008 に取り下げを追記

## フェーズ 5: 実データ待ち

- [ ] **T-24** `RELATION` 系の実レスポンスを観測する（ミュート済み/ブロック済みの相手を引用した投稿）
- [ ] **T-25** `Post` 本体がスタブで返る例を観測する
- [ ] **T-26** 一覧系（timeline / replies）にスタブが混ざるか確認。混ざるなら `List<PostResult>` へ
- [ ] **T-27** `includeUnavailableReference` の効果を確認
- [ ] **T-28** `QuotedPost.createdAt` の欠落を観測したら `required` を外す

## 補足

- T-04 と T-05 が本体。ここまでで「非表示の引用元が 1 件混ざるとタイムライン全体が落ちる」が止まる。
- T-14..T-16 は振る舞いを変えない整理。T-16 で消す 22 項目はどこからも読まれていない。
- T-23 は 002 の要件を 003 で無効化する記録。理由は
  [design.md §1](design.md) に書いた（サーバーが先に伏せるので再計算の余地が無い）。
