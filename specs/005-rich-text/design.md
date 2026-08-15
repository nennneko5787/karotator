# 005 本文とリアクションの装飾 — design

## 1. pro リアクションの一覧をどう持つか

一覧 API が無いのでバンドルから起こす。`legalDocuments` と全く同じ形にする
（`tool/fetch_legal_documents.dart` → `lib/objects/legal_documents.dart`）。

```
dart run tool/fetch_pro_reactions.dart
  → lib/objects/pro_reactions.dart   （自動生成・手で編集しない）
  → specs/api/pro-reactions.md       （一覧の記録）
```

抽出は `proReactions` チャンクから。要素はこの形で並んでいる。

```js
{code:"pro:otsukaresama",slug:"otsukaresama",label:"おつかれ様",
 labelEn:"Nice work",assetUrl:"/reactions/pro/otsukaresama.png"}
```

生成物:

```dart
class ProReaction {
  const ProReaction({required this.code, required this.slug,
    required this.label, required this.labelEn, required this.assetUrl});
  final String code;      // `pro:otsukaresama`
  final String slug;
  final String label;     // 画面に出す名前
  final String labelEn;
  final String assetUrl;  // Karotter Web ホスト基準の相対パス
}

const proReactions = <ProReaction>[ ... ];   // 89 件
```

引くのは `Map` を 1 度だけ作る。89 件を毎回線形探索しない
（リアクションはタイムラインの全カロートで描かれる）。

```dart
final _byCode = {for (final r in proReactions) r.code: r};

/// `pro:` で始まる文字列を引く。知らない識別子なら null (REQ-RICH-016)。
ProReaction? proReactionOf(String code) => _byCode[code];
```

## 2. プランの実効判定

`subscriptionPlan` を直接見てはいけない。期限切れや停止中を弾く必要がある。
`lib/objects/subscription.dart` に置く。

```dart
enum SubscriptionPlan { FREE, PLUS, PRO }

/// 契約の状態と期限を加味した実効プラン (REQ-RICH-008)。
///
/// Karotter Web の判定をそのまま写している。
SubscriptionPlan effectivePlan({
  required String plan,
  required String status,
  DateTime? activeUntil,
}) { ... }
```

`AuthUser` / `Author` / `User` の 3 つが同じ 3 フィールドを持っているので、
拡張を生やして `user.effectivePlan` で引けるようにする。

## 3. 本文の組み立て

`TextAgent.generate` を書き直す。今は URL とメンションを 1 本の正規表現で
分割しているだけ。Web と同じ 2 段構えにする。

```
本文
 ├ ① 伏せ字で分割        /(\|\|[\s\S]+?\|\|)/
 │    └ 中身を ② に通す（伏せ字の中の URL やルビも効く REQ-RICH-012）
 └ ② トークン化          空白 / URL / メンション / ルビ
      └ どれでもない塊は素のテキスト
```

### 伏せ字 (REQ-RICH-010, 011)

`InlineSpan` の中で状態を持てないので、`WidgetSpan` に切り出して
`StatefulWidget` に隠す。

```dart
/// 触れるまで中身を隠す。押すと開く。閉じ直せる。
class SpoilerText extends StatefulWidget { ... }
```

隠している間も**レイアウトを変えない**（開いた瞬間に本文が伸び縮みしないよう、
同じ文字を描いてその上に覆いを重ねる）。

> `Text.rich` の中に `WidgetSpan` を混ぜると、その部分だけ行の高さが変わる
> ことがある。`alignment: PlaceholderAlignment.baseline` と `baseline:
> TextBaseline.alphabetic` を指定して行送りを揃える。

### ルビ (REQ-RICH-009)

Flutter の `TextSpan` にルビは無いので、これも `WidgetSpan` にする。
`Column` で読みを上に載せ、ベースラインを本文に合わせる。

```dart
class RubyText extends StatelessWidget { ... }   // base の上に rt
```

読みは本文より小さく（実測の Web は `ruby-position: over` の既定）。

### トークン化 (REQ-RICH-013)

正規表現は Web の `Ss` を Dart へ移す。`\p{L}` は Dart の `RegExp` でも
`unicode: true` で使える。ハッシュタグは**取るが素のテキストのまま出す**
（検索画面が無いので飛ばせない。非目標）。

## 4. リアクション表示

`_ReactionChip` が `reaction.emoji` を `Text` で出しているところを分ける。

```dart
switch (proReactionOf(reaction.emoji)) {
  case final pro?  => Image.network(karotterUrl(pro.assetUrl), height: 18,
                        errorBuilder: (..) => Text(pro.label)),   // REQ-RICH-002
  case null        => Text(reaction.emoji),                       // 通常の絵文字
}
```

ツールチップは `pro?.label ?? reaction.emoji` (REQ-RICH-003)。

### 付けられるかどうか (REQ-RICH-005..007)

```dart
bool canAddReaction(String code, {required SubscriptionPlan plan, required bool reacted}) =>
    !isProReaction(code) || plan == SubscriptionPlan.PRO || reacted;
```

`reacted` を含めるのは、**PRO を切らした後でも自分が付けたものは外せる**ようにするため。
表示側は素通し（REQ-RICH-006 は「一覧は誰でも見える」なので分岐そのものが要らない）。

### ピッカー (REQ-RICH-004)

今の `EmojiPicker` の上に pro リアクションの段を足す。
`showModalBottomSheet` の中を `Column` にして、上段に pro、下段に既存のピッカー。

PRO でないときは段ごと出さず、代わりに一行の案内を出す。押せないものを並べても
仕方がないため。

## 5. 影響範囲

| ファイル | 変更 |
| --- | --- |
| `tool/fetch_pro_reactions.dart` | **新規**。バンドルから 89 件を抽出 |
| `lib/objects/pro_reactions.dart` | **新規・自動生成** |
| `lib/objects/subscription.dart` | **新規**。実効プラン |
| `lib/ui/text_agent.dart` | 伏せ字 → トークン化の 2 段構えに書き直す |
| `lib/ui/rich/spoiler.dart` | **新規** |
| `lib/ui/rich/ruby.dart` | **新規** |
| `lib/ui/post/reaction.dart` | pro リアクションの画像・ピッカーの段・PRO 判定 |
| `specs/api/pro-reactions.md` | **新規・自動生成** |
| `specs/api/conventions.md` | §11 として記法を追記 |

## 6. 移行の順序

1. `tool/fetch_pro_reactions.dart` と生成物 — **ここまでで `pro:xxx` が名前で出せる**
2. `subscription.dart` の実効プラン
3. リアクションチップの画像化 — **ここで見た目の不具合が消える**
4. ピッカーの段と PRO 判定
5. `text_agent.dart` の書き直し（トークン化）
6. ルビ
7. 伏せ字

3 まででご報告の症状は解消する。5〜7 は本文側で、独立して入れられる。

## 7. 試験

- `proReactionOf` が知らない識別子で null を返す (REQ-RICH-016)
- 実効プランが 期限切れ / `CANCELED` / `TRIALING` / 期限なし で正しく出る
- `canAddReaction` が FREE + 未リアクションのときだけ偽になる
- ルビの正規表現が `｜漢字《かんじ》` と `漢字《かんじ》` の両方に当たる
- `《》` が閉じていない、`||` が片方だけ、といった壊れた入力でも本文が出る (REQ-RICH-017)
- 伏せ字の中の URL がリンクとして取れる (REQ-RICH-012)
- `www.` 始まりの URL が取れる (REQ-RICH-013)

トークン化は `BuildContext` を要らない純関数に切り出し、widget を組まずに試験する。
