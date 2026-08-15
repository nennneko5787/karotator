# 004 投稿制限の解除導線 — tasks

## フェーズ 1: 状態を 1 箇所に

- [x] **T-01** `KarotterSession` が `AuthUser` を保持して公開する（起動時の 1 回の読み出しを流用）
- [x] **T-02** `lib/providers/auth_user.dart` — `hydrate` / `patch` / `refresh` — REQ-GATE-020
- [x] **T-03** `startup.dart` で hydrate する
- [x] **T-04** `Preferences` に閉じた記憶（ユーザーごと） — REQ-GATE-003, 004

## フェーズ 2: 理由を知らせる

ここまでで「なぜ投稿できないのか」が分かるようになる。

- [x] **T-05** `lib/ui/posting_restriction.dart` — 3 状態の帯 — REQ-GATE-001, 002, 005
- [x] **T-06** 閉じる／両方済んだら記憶を消す — REQ-GATE-003, 004
- [x] **T-07** `AppLifecycleListener` で復帰時に取り直す — REQ-GATE-019
- [x] **T-08** `home.dart` に置く

## フェーズ 3: クイズ

ここまででアプリだけで制限を解除できる。

- [x] **T-09** `lib/objects/legal_quiz.dart` — `LocalizedText` / `LegalQuiz` / `LegalQuizResult` — REQ-GATE-023
- [x] **T-10** `AuthApi.legalQuiz()` / `gradeLegalQuiz()`
- [x] **T-11** `lib/pages/legal_quiz.dart` — 取得と提示 — REQ-GATE-007
- [x] **T-12** 全問埋まるまで採点させない — REQ-GATE-008
- [x] **T-13** 採点結果と解説を全選択肢に出す — REQ-GATE-009, 010
- [x] **T-14** 合格時の 3 分岐の文言と控えの更新 — REQ-GATE-011, 020
- [x] **T-15** 別の問題に挑戦 — REQ-GATE-012
- [x] **T-16** 設問から規約本文へ飛ばす — REQ-GATE-013
- [x] **T-17** 未成年向けの注意書き（ひらがな併記） — REQ-GATE-014
- [x] **T-18** 失敗しても他を止めない — REQ-GATE-022

## フェーズ 4: メール

- [x] **T-19** `AuthApi.setEmail()` / `resendVerificationEmail()`
- [x] **T-20** `lib/ui/cooldown_button.dart` — 残り秒数つきボタン — REQ-GATE-017
- [x] **T-21** `AccountSettings` にメールの節 — REQ-GATE-015, 016

## フェーズ 5: 通知

- [x] **T-22** `Notification.route` を追加
- [x] **T-23** `lib/objects/notification_target.dart` — `route` 優先、前方一致に落とす — REQ-GATE-006
- [x] **T-24** 通知一覧の遷移先に繋ぐ

## フェーズ 6: 仕上げ

- [x] **T-25** 試験（design §11 の 7 項目）
- [x] **T-26** `build_runner` / `flutter analyze` / `flutter test`
- [x] **T-27** `LegalNoticeBanner` と `AccountSettings` の `session.login()` をプロバイダへ寄せる
- [x] **T-28** `specs/api/conventions.md` に §10「投稿制限」を追記

## フェーズ 8: 実データで判明した修正

- [x] **T-33** `Notification.actor` が `required` で、SYSTEM 通知 1 件で通知一覧
      全体が落ちていた。`actor` / `actorId` を nullable に、他も既定値付きへ
- [x] **T-34** 行為者のいない通知にアイコンを出す（プロフィールへは飛ばさない）
- [x] **T-35** `communityId` / `subscriptionGiftId` / `reactionEmojis` を追加
- [x] **T-36** 実データを試験に取り込む
- [x] **T-37** クイズの `id` は設問・選択肢とも**文字列**だった。`int` から直す
- [x] **T-38** `expiresInSeconds`（900）と `requiredCorrectAnswers`（5）を追加
- [x] **T-39** `documentPath` が `legalDocuments` の `path` と一致することを試験で固定

## フェーズ 7: 実データ待ち

- [x] **T-29** `documentPath` は `legalDocuments` の `path` とそのまま一致した。対応表は不要
- [x] **T-30**（一部）SYSTEM 通知に `route` は無かった。前方一致が本経路
- [ ] **T-30b** 429 の `Retry-After` が既存の例外に載っているか確認
- [ ] **T-31** `passed` が真で `legalQuizPassed` が偽になる条件を観測
- [ ] **T-32** メール変更後に `emailVerified` が偽に戻るか確認

## 補足

- T-05..T-08 と T-11..T-18 は独立して入れられる。帯だけ先に出しても意味がある。
- 投稿画面には一切手を入れない（REQ-GATE-021）。
