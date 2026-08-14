# 002 レスポンスモデルの整合 — tasks

## フェーズ 1: 情報源を揃える

- [x] **T-01** `tool/src/bundle.dart` — バンドル取得を 001 のツールと共有する
- [x] **T-02** `tool/src/js_literal.dart` — ミニファイされた JS のデータリテラルを読む
- [x] **T-03** `tool/fetch_api_docs.dart` — Karotter 公式の開発者 API ドキュメントを抽出
- [x] **T-04** 実行して `specs/api/developer-api.md`（17 セクション / 85 件）と
      `specs/api/schemas/*.json`（4 件）を生成
- [x] **T-05** `tool/src/schema.dart` — JSON からスキーマを起こす
- [x] **T-06** `tool/capture_api_samples.dart` — 実レスポンスの観測 — REQ-MODEL-009..012

## フェーズ 2: 判明した分を直す

- [x] **T-07** `OfficialMark` に 6 値 + `NONE` を追加、色とラベルを Web に合わせる — REQ-MODEL-007
- [x] **T-08** `OfficialMarkListConverter` — 未知の値を捨てる / 配列と単一値の両対応 — REQ-MODEL-001, 002
- [x] **T-09** `Post` / `QuotedPost` に年齢・センシティブ関連 6 フィールドを追加 — REQ-MODEL-005, 008
- [x] **T-10** `Poll.isAnonymous` / `PollOption.imageUrl` を追加
- [x] **T-11** `Author` / `User` に `adminForceParody` / `adminForceBot` を追加
- [x] **T-12** `AbstractPostX` / `AbstractUserX` に合成判定を置く — REQ-MODEL-006
- [x] **T-13** `getUserPrimaryMark` を `effectiveBot` / `effectiveParody` に切り替え
- [x] **T-14** `build_runner` を回して `flutter analyze` を通す

## フェーズ 3: 実データで詰める

- [x] **T-15** `capture_api_samples.dart` を実行して `specs/api/observed-schemas.md` を得る（28/30 取得）
- [x] **T-16** 観測結果と現行モデルを突き合わせ、差分を洗い出す
- [x] **T-17** `AuthUser` を 6 → 97 フィールドに、`User` を 29 → 62 に、`Author` を 11 → 37 に
- [x] **T-18** `Trend` を新設、`HashTags` に `createdAt` / `updatedAt`、
      `UserResponse` に `isPostNotificationsEnabled` / `isRekarotHidden` / `pinnedPosts`
- [x] **T-19** `Post` に `effectiveMinimumAge` / `effectiveMaximumAge` /
      `adminForceMinimumAge` / `adminForceMaximumAge` / `communityId` / `expiresAt` /
      `quotePostsCount`
- [x] **T-20** `PostVisibility` に `FOLLOWERS` / `PRIVATE`、`NotificationType` を 17 種類に
- [x] **T-21** 全ての列挙フィールドに `@JsonKey(unknownEnumValue: ...)` を付ける — REQ-MODEL-001
- [x] **T-22** 通知画面を 17 種類に対応させる
- [x] **T-23** 取り違えていた応答キー 4 件を直す（`trends` / `scheduledPosts` / `candidates` / `boards`+`threads`）
- [x] **T-24** `test/objects/parsing_test.dart` — 未知の値・欠けたフィールド・合成判定の回帰テスト（14 件）
- [ ] **T-25** DM のモデル。テスト用アカウントに会話が無く観測できていない
      （`dm.group` / `dm.messages` の 2 件だけ未取得）
- [ ] **T-26** `Poll` の観測。サンプルに投票付きカロートが含まれていなかった

## フェーズ 4: 表示側（002 の範囲外・別途）

- [ ] **T-27** `effectiveR18` / `effectiveHidden` を使ってカロートを伏せる UI
- [ ] **T-28** `effectiveMinimumAge` / `effectiveMaximumAge` による表示制御
- [ ] **T-29** `mediaSpoilerFlags` をメディア表示に反映する
      （モデルには前からあるが、どこからも読まれていない）
- [ ] **T-30** `OfficialMark.label` をツールチップ / 読み上げに使う
- [ ] **T-31** `AuthUser` の 97 フィールドを設定画面に繋ぐ（`todo.md` のアカウント設定 / アプリ設定）

## 補足

- T-09..T-11 で足したフィールドは全て既定値付きか nullable。既存の呼び出し側には影響しない。
- T-07 は**バグ修正**でもある。`GRAY` などが 1 件でも含まれると
  `$enumDecode` が投げ、タイムライン全体が表示できなくなっていた。
- T-19..T-22 はモデルに載っただけで誰も読んでいないフィールドの掃除。
  データが揃った今なら着手できる。
