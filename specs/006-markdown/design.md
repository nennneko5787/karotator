# 006 本文の Markdown — design

## 1. 何が変わるか

今の本文は `Text.rich` 1 つ、つまり**インライン span の並び**でしかない。
Markdown には見出し・引用・箇条書き・コード・表という**ブロック**があるので、
1 つの span には収まらない。

```
今            Text.rich( span, span, span … )
これから      Column( 段落, 見出し, 引用, リスト, コード, 表 … )
                       └ 各ブロックの中身は今までどおり span の並び
```

005 で作ったトークナイザ（URL・メンション・ハッシュタグ・ルビ・伏せ字）は
**捨てない**。Markdown を解いた後の素の文字に対して、今までどおり掛ける
(REQ-MD-009)。二段構えになる。

```
本文
 ├ ① Markdown として解く          → ブロックの並び
 │    各ブロックのインライン部分
 └ ② 各テキストにトークナイザ      → URL / メンション / ルビ / 伏せ字
```

## 2. 使うもの

| 目的 | 手段 |
| --- | --- |
| Markdown の解析 | `markdown`（dart-lang 製。AST を返す。widget は作らない） |
| コードの色分け | `flutter_highlighting`（`HighlightView`。190 言語を同梱、通信不要） |

`flutter_markdown` は使わない。非推奨になっているうえ、005 のトークナイザを
差し込む余地が無い。AST だけもらって描画は自前で持つ。

> `flutter_highlighting` は最終更新が古い（0.9.0+11.8.0）。動かなければ
> 素の等幅表示に落とせるよう、コードブロックの描画は 1 箇所に閉じ込める。

## 3. 中間表現

widget を組む前に、**試験できる形**へ落とす。`BuildContext` を要らなくする
（005 の `parseRichText` と同じ方針）。

```dart
// lib/objects/post_body.dart
sealed class PostBlock {}

class ParagraphBlock extends PostBlock {
  final List<md.Node> nodes;

  /// `-# ` で始まっていた段落。小さく出す (REQ-MD-007)。
  final bool subtext;
}

class HeadingBlock extends PostBlock {
  final int level;              // 1..6
  final List<md.Node> nodes;
}

class BlockQuoteBlock extends PostBlock { final List<PostBlock> children; }

class ListBlock extends PostBlock {
  final bool ordered;
  final List<List<PostBlock>> items;
}

class CodeBlock extends PostBlock {
  final String code;
  final String? language;       // ``` の後ろ。無ければ null
}

class TableBlock extends PostBlock {
  final List<List<md.Node>> header;
  final List<List<List<md.Node>>> rows;
}

class RuleBlock extends PostBlock {}

/// 本文をブロックに分ける。壊れていても落ちない (REQ-MD-012)。
List<PostBlock> parsePostBody(String source);
```

インラインは `md.Node` のまま持つ。ここで独自の型に写し替えても得が無く、
strong / em / del / code / link / text の 6 種を widget 側で見れば足りる。

### 解析の設定

```dart
md.Document(
  // gitHubFlavored から自動リンクだけ外したもの
  extensionSet: md.ExtensionSet(
    md.ExtensionSet.gitHubFlavored.blockSyntaxes,
    md.ExtensionSet.gitHubFlavored.inlineSyntaxes
        .where((s) => s is! md.AutolinkExtensionSyntax)
        .toList(),
  ),
  encodeHtml: false,
)
```

**自動リンクは無効にする。** GFM は裸の URL を `<a>` にするが、
karotator は 005 のトークナイザが URL を見ている。両方が拾うと二重になるし、
`www.` の扱い（表示はそのまま、開くときに `https://` を足す）も 005 側にしか
無い。**URL の持ち主は 005 に一本化する**。`[文字](URL)` は Markdown が扱う。

基底は `gitHubWeb` ではなく **`gitHubFlavored`**。Karotter Web が使っているのは
`remark-gfm` で、`gitHubWeb` はそれに無いもの（`:smile:` の絵文字置換、
`> [!NOTE]` の警告ブロック、見出しへの `id` 付与）まで足してしまう。
存在を確認できていない記法は入れない（002 design §2 の方針）。

`encodeHtml` は **`false`**。`true` にすると `R&D` が `R&amp;D` のまま
テキストノードに入り、そのまま画面に出てしまう。`false` なら生の HTML は
解釈されず**素の文字として**残る（`<b>` は `<b>` と表示される）。狙いどおり。

### `-# ` (REQ-MD-007)

Karotter の独自記法。Web は**テキストノードの先頭**を見て 3 文字を剥がす。
同じことを段落の先頭ノードに対して行う。

```dart
// 段落の最初が Text で、`-# ` で始まっていたら剥がして subtext を立てる
```

`-#` は空白を挟まないので箇条書き（`- `）にはならない。CommonMark でも
リストにならないことを試験で固定する。

### 見出しとハッシュタグ (REQ-MD-010)

ATX 見出しは `#` の後ろに空白が要る。`#にんじん` は見出しにならず、素の文字と
して②へ渡り、ハッシュタグとして拾われる。**parser の既定のままで衝突しない。**
壊れやすいので試験で固定する。

## 4. 描画

`lib/ui/post/body.dart` に `PostBody` を置く。

```dart
/// カロート本文。Markdown を解いてブロックごとに描く。
class PostBody extends StatelessWidget {
  const PostBody({required this.content, this.style});
}
```

| ブロック | 出し方 |
| --- | --- |
| 段落 | `Text.rich`。`subtext` なら一回り小さく薄く |
| 見出し | `Text.rich` + 水準ごとの大きさと太さ。h1 が最大 |
| 引用 | 左に縦線、内側に字下げ。中身は再帰 |
| 箇条書き / 番号 | 記号か番号 + 中身。中身は再帰 |
| コード | `HighlightView` を**横スクロールの中**に置く |
| 表 | `Table` を**横スクロールの中**に置く (REQ-MD-017) |
| 区切り | `Divider` |

### 横スクロールの入れ子 (REQ-MD-017)

本文は縦のリストの中にある。横に送れるのは**表とコードだけ**にする。

```dart
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: <table or code>,
)
```

本文そのものは折り返す。横に送らせない。

### インラインの組み立て (REQ-MD-009)

`md.Node` を辿って `InlineSpan` にする。

| ノード | 出し方 |
| --- | --- |
| `text` | **005 の `parseRichText` に通す**。URL・メンション・ルビ・伏せ字がここで効く |
| `strong` / `em` / `del` / `u` | 太字 / 斜体 / 打ち消し / 下線。中身は再帰 |
| `code` | 等幅 + 薄い背景。**中身にトークナイザを掛けない** |
| `a` | リンク色 + タップで開く。中身は再帰 |

`code` の中でトークナイザを掛けないのが要点。`` `#tag` `` や `` `||x||` `` が
勝手に解釈されると困る。

### 大きさ

寸法は「UI サイズ」設定に従う（005 の `PostMetrics`）。見出しは本文からの倍率
で決める。

```dart
double headingSize(int level) => metrics.fontSize * switch (level) {
  1 => 1.6, 2 => 1.4, 3 => 1.25, 4 => 1.15, 5 => 1.05, _ => 1.0,
};
```

## 5. どこで Markdown を解くか (REQ-MD-011)

**本文の本表示だけ。** 引用元やプレビューでは解かない。Karotter Web も
`lightweight` を立てて素の段落 1 つとして描いている。

| 場所 | 使うもの |
| --- | --- |
| 一覧のカロート本文 (`PostContent`) | `PostBody`（Markdown あり） |
| 詳細の主役 (`FocusedPostWidget`) | `PostBody`（Markdown あり） |
| 引用元カード (`PostPreviewCard`) | `TextAgent.generate`（今までどおり） |
| 通知やクレジットなどの短い文字 | `TextAgent.generate` |

つまり **`TextAgent` は「軽い方」として残す**。消さない。

## 6. 壊れた入力 (REQ-MD-012, 013)

- `markdown` は不正な記法で例外を投げず、素の文字として残す。
- 知らない要素に出会ったら、**中身のテキストだけ拾って段落として出す**。
  握り潰して消さない。
- コードの言語が不明・未対応なら、色分けせず等幅で出す (REQ-MD-016)。
- 本文の描画で通信しない (REQ-MD-014)。`flutter_highlighting` は同梱の
  言語定義だけを使う。

## 7. 影響範囲

| ファイル | 変更 |
| --- | --- |
| `pubspec.yaml` | `markdown` と `flutter_highlighting` を追加 |
| `lib/objects/post_body.dart` | **新規**。`PostBlock` と `parsePostBody` |
| `lib/ui/post/body.dart` | **新規**。`PostBody` とブロックの描画 |
| `lib/ui/post/content.dart` | 本文を `PostBody` に差し替え |
| `lib/ui/post/focused.dart` | 同上 |
| `lib/ui/metrics.dart` | 見出し・コードの寸法を足す |
| `lib/ui/text_agent.dart` | 変更なし。軽い方として残す |
| `specs/api/conventions.md` | §12 として本文の記法を追記 |

## 8. 移行の順序

1. 依存を足す。`markdown` だけ先に入れて `parsePostBody` と試験
2. `-# ` と、見出しがハッシュタグを食わないことを試験で固定
3. `PostBody` で段落・見出し・強調・リンクまで — **ここで `#` のデカ文字が出る**
4. 引用・箇条書き
5. コード（まず等幅）→ `flutter_highlighting` で色分け
6. 表と横スクロール
7. `PostContent` / `FocusedPostWidget` を差し替え

3 まででご要望の見出しは出る。5 と 6 は独立して足せる。

## 9. 試験

widget を組まずに `parsePostBody` だけで確かめる。

- `# 見出し` が `HeadingBlock(level: 1)` になる
- `###### ` まで水準が取れる。`####### ` は見出しにならない
- **`#にんじん` は見出しにならない**（ハッシュタグとして②へ渡る）
- `-# 小さい` が `ParagraphBlock(subtext: true)` になり、`-# ` が本文に残らない
- `- 箇条書き` は `ListBlock(ordered: false)`、`1. ` は `ordered: true`
- `-#` が箇条書きとして解釈されない
- ` ```dart ` から `CodeBlock(language: 'dart')` が取れる。言語無しは null
- 表が `TableBlock` になり、列数が揃う
- 閉じていない ``` や `**` でも例外にならず、文字が消えない
- 空文字で空のリストが返る

インラインの組み立ては widget が要るので、まず `parsePostBody` を固めてから
必要に応じて widget 試験を足す。

## 10. 未解決

| 項目 | 内容 |
| --- | --- |
| `flutter_highlighting` の生死 | 3 年更新が無い。動かなければ等幅表示に落とす |
| 画像記法 `![]()` | 使えるか未確認。使えるなら添付との関係を決める |
| 脚注 | `gitHubWeb` に含まれるが、Karotter で使われているか未観測 |
| `rehypePlugins` の `maxSize:10` | 何を制限しているか未特定。見出しの数か大きさか |
| 投稿画面 | 書ける記法の案内は 006 では扱わない（非目標） |
