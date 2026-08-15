# 005 本文とリアクションの装飾 — tasks

## フェーズ 1: pro リアクションを名前で出す

- [x] **T-01** `tool/fetch_pro_reactions.dart` — バンドルから 89 件を抽出 — REQ-RICH-014
- [x] **T-02** 実行して `lib/objects/pro_reactions.dart` と `specs/api/pro-reactions.md` を生成 — REQ-RICH-015
- [x] **T-03** `proReactionOf` / `isProReaction`（Map で引く） — REQ-RICH-016

## フェーズ 2: プラン

- [x] **T-04** `lib/objects/subscription.dart` — `SubscriptionPlan` と実効判定 — REQ-RICH-008
- [x] **T-05** `AuthUser` / `Author` / `User` に拡張を生やす

## フェーズ 3: リアクション表示

ここでご報告の「`pro:otsukaresama` が生で出る」が消える。

- [x] **T-06** チップを画像にする。失敗したら名前 — REQ-RICH-001, 002
- [x] **T-07** ツールチップを日本語名に — REQ-RICH-003
- [x] **T-08** `canAddReaction` — PRO 以外は新規に付けられない — REQ-RICH-005, 007
- [x] **T-09** ピッカーに pro の段を足す。PRO でなければ案内だけ — REQ-RICH-004

## フェーズ 4: 本文

- [x] **T-10** トークン化を純関数に切り出す（`BuildContext` 不要） — REQ-RICH-013
- [x] **T-11** `lib/ui/rich/ruby.dart` — REQ-RICH-009
- [x] **T-12** `lib/ui/rich/spoiler.dart` — REQ-RICH-010, 011
- [x] **T-13** `TextAgent` を 2 段構えに書き直す — REQ-RICH-012
- [x] **T-14** 壊れた入力でも落ちない — REQ-RICH-017

## フェーズ 5: 仕上げ

- [x] **T-15** 試験（design §7 の 7 項目）
- [x] **T-16** `flutter analyze` / `flutter test`
- [x] **T-17** `specs/api/conventions.md` に §11「本文の記法とカスタムリアクション」
- [x] **T-18** `specs/README.md` の一覧を更新

## フェーズ 6: 実データ待ち

- [ ] **T-19** `assetUrl` が Web ホストで実際に取れるか確認
- [ ] **T-20** 伏せ字とルビが使われている実カロートで確認
- [ ] **T-21** PRO アカウントでピッカーからの付与を確認

## 補足

- ハッシュタグはトークンとして切り出すが、リンクにはしない（検索画面が無い）。
- `pro_reactions.dart` は自動生成。直したくなったら `tool/` を直す。

## フェーズ 7: 実データで判明した修正

- [x] **T-22** `RubyText` のベースライン。`Column` は先頭の子（＝読み）の
      ベースラインを申告するため本体が 1 行下にずれていた。申告値を差し替える
      `_BaselineOverride` を追加（`Baseline` widget では直せない）
- [x] **T-23** `postProvider` が autoDispose で、スクロールで画面外へ出ると
      楽観更新が捨てられ、戻ると一覧の古い `Post` で作り直されていた。
      触ったカロートだけ `ref.keepAlive()` で残す
