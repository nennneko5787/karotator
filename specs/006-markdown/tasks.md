# 006 本文の Markdown — tasks

## フェーズ 1: 解析

- [x] **T-01** `markdown` を依存に足す
- [x] **T-02** `lib/objects/post_body.dart` — `PostBlock` と `parsePostBody` — REQ-MD-001
- [x] **T-03** 自動リンクを無効にする（URL の持ち主は 005） — REQ-MD-009
- [x] **T-04** `-# ` を段落の先頭から剥がして `subtext` を立てる — REQ-MD-007
- [x] **T-05** 試験（design §9 の 10 項目）。特に `#にんじん` と `-#` — REQ-MD-010

## フェーズ 2: 段落・見出し・強調

ここでご要望の `# デカ文字` が出る。

- [x] **T-06** `lib/ui/post/body.dart` — `PostBody` と段落 — REQ-MD-001
- [x] **T-07** インラインの組み立て。テキストは 005 のトークナイザへ — REQ-MD-009
- [x] **T-08** 見出し。水準ごとの大きさ — REQ-MD-002
- [x] **T-09** 強調・打ち消し・下線 — REQ-MD-003
- [x] **T-10** Markdown のリンク — REQ-MD-006
- [x] **T-11** `subtext` を小さく出す — REQ-MD-007
- [x] **T-12** `PostContent` と `FocusedPostWidget` を差し替え。引用元は据え置き — REQ-MD-011

## フェーズ 3: 引用とリスト

- [x] **T-13** 引用。左に縦線、中身は再帰 — REQ-MD-004
- [x] **T-14** 箇条書きと番号付き。中身は再帰 — REQ-MD-005

## フェーズ 4: コード

- [x] **T-15** インラインコード。等幅 + 薄い背景。トークナイザを掛けない — REQ-MD-008
- [x] **T-16** コードブロックを等幅で。横スクロール — REQ-MD-008
- [x] **T-17** `flutter_highlighting` で色分け — REQ-MD-015
- [x] **T-18** 知らない言語・言語無しは色分けせず出す — REQ-MD-016

## フェーズ 5: 表

- [x] **T-19** 表を組む
- [x] **T-20** 表だけ横スクロール。本文は折り返す — REQ-MD-017

## フェーズ 6: 仕上げ

- [x] **T-21** 壊れた記法で落ちない — REQ-MD-012, 013
- [x] **T-22** 知らない要素は中身の文字を残す — REQ-MD-013
- [x] **T-23** `flutter analyze` / `flutter test`
- [x] **T-24** 実機で見た目を確認
- [x] **T-25** `specs/api/conventions.md` に §12「本文の記法」
- [x] **T-26** `specs/README.md` の一覧を更新

## フェーズ 7: 実データ待ち

- [x] **T-27** `flutter_highlighting` が現行 Flutter で動くか → **動いた**（Windows デバッグ実機で Dart の色分けを確認）
- [ ] **T-28** 画像記法 `![]()` が使えるか
- [ ] **T-29** 脚注が使われているか
- [ ] **T-30** `rehypePlugins` の `maxSize:10` が何の制限か

## 補足

- `TextAgent` は消さない。引用元やプレビューで使い続ける（Web の `lightweight`）。
- コードブロックの描画は 1 箇所に閉じ込める。`flutter_highlighting` が
  動かなければそこだけ等幅に落とす。
