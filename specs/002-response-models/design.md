# 002 レスポンスモデルの整合 — design

## 1. 情報源の優先順位

同じフィールドについて複数の情報源が食い違ったら、次の順で採る。

1. **実際のレスポンス**（`specs/api/observed-schemas.md`）— 内部 API そのもの
2. **バンドル内の定数**（列挙値・色・ラベル）— 画面が実際にこれで描かれている
3. **公式スキーマ**（`specs/api/schemas/`）— 開発者 API のものなので内部 API とはずれうる
4. 現行のモデル

1 が無い項目については 2 → 3 の順。3 だけが根拠の場合は**既定値付きか nullable で足す**に留め、
`required` にはしない。外れていても壊れないため。

## 2. 壊れないための作り

### 未知の列挙値 (REQ-MODEL-001, 002)

`json_serializable` が生成する `$enumDecode` は知らない値で例外を投げる。
`officialMark` に新しい色が 1 つ増えるだけでタイムライン全体が表示できなくなるので、
`JsonConverter` を挟んで**知らない値を捨てる**。

```dart
class OfficialMarkListConverter
    implements JsonConverter<List<OfficialMark>, Object?> {
  List<OfficialMark> fromJson(Object? json) {
    final raw = switch (json) {
      null => const <Object?>[],
      List<Object?> list => list,
      _ => [json],          // 単一の文字列でも受ける (REQ-MODEL-002)
    };
    // 知らない値と NONE は落とす
  }
}
```

配列と単一値の両対応は Web クライアントに合わせたもの
（`Array.isArray(e) ? e : e ? [e] : []`）。

### 欠けたフィールド (REQ-MODEL-003, 004)

新しく足すフィールドは必ず `@Default(...)` か nullable にする。
`required` を足すと、そのフィールドを返さないエンドポイント（一覧の簡略版など）で
パースが落ちる。

## 3. 合成した判定 (REQ-MODEL-006, 008)

`isR18` と `adminForceR18` のような「本人の設定」と「運営の強制」の組は、
呼ぶ側が毎回 `||` するとどこかで忘れる。インターフェースの拡張に 1 箇所だけ置く。

```dart
extension AbstractPostX on AbstractPost {
  bool get effectiveR18 => isR18 || adminForceR18;
  bool get effectiveHidden => adminForceHidden;
}

extension AbstractUserX on AbstractUser {
  bool get effectiveParody => isParodyAccount || adminForceParody;
  bool get effectiveBot => isBotAccount || adminForceBot;
}
```

`AbstractPost` は `Post` と `QuotedPost` の両方が実装しているので、引用元も同じ判定になる。

> `abstract interface class` の本体に具象ゲッターを書くと、`implements` する
> freezed 生成クラスが「未実装」になる。拡張に置く理由はそれ。

## 4. 列挙の持ち方 (REQ-MODEL-007)

`OfficialMark` は値だけでなく表示名も持つ。色は Flutter 依存なので `utils.dart` に残す。

```dart
enum OfficialMark {
  BLUE("本人マーク"),
  GRAY("政府関係者マーク"),
  ...
  NONE("");
  const OfficialMark(this.label);
  final String label;
}
```

出典は `OfficialMarkBadge` チャンク。13 値 + `NONE`。
`NONE` は「マーク無し」の番兵で、コンバータが落とすのでモデルには入らない。

## 5. 観測ツール (REQ-MODEL-009..012)

`tool/capture_api_samples.dart`

```
$env:KAROTTER_IDENTIFIER = "..."
$env:KAROTTER_PASSWORD   = "..."
dart run tool/capture_api_samples.dart [--raw .karotter-samples]
```

守っていること:

| 要件 | 実装 |
| --- | --- |
| GET しかしない (REQ-MODEL-010) | `_send` が `GET` と `POST auth/login` 以外を `StateError` で弾く。`_probes` も全て GET |
| 資格情報を残さない (REQ-MODEL-011) | `Platform.environment` からのみ読む |
| 秘匿値を残さない (REQ-MODEL-012) | 既定では生レスポンスを書かない。`--raw` を付けた場合も `redact()` でトークン・メール等を伏せ、出力先は `.gitignore` 済み |

出力は**フィールド名と型だけ**で値を含まない。

```
## posts.timeline
- `pagination`: `Pagination`
  - `limit`: `int`
  - `page`: `int`
- `posts`: `List<Post>`
  - `adminForceR18`: `bool`
  - `author`: `Author`
    ...
  - `editedAt`: `DateTime?`  — 12/20 件で欠落
```

型の推測:

| 観測した値 | 推測 |
| --- | --- |
| `true` / `false` | `bool` |
| 整数 | `int` |
| 小数 | `double` |
| ISO 8601 に見える文字列 | `DateTime` |
| その他の文字列 | `String` |
| `null` だった / 一部の要素で欠けていた | nullable |
| 同じ場所で型が揺れた | `Object?`（`int`/`double` の混在だけ `double`） |

1 アカウント・1 回の観測なので、`nullable` は「今回 null だった」以上のことを意味しない。
`required` にするかの判断は公式スキーマを優先する。

## 6. 未知の ID を辿る

後続のリクエストに ID が要るものがある（`posts/{postId}/replies` など）。
先に叩いたレスポンスから拾って埋める。埋まらなければそのプローブは飛ばす。

```
auth.me        → userId, username
posts.timeline → postId
boards.list    → boardSlug
boards.threads → threadId
dm.groups      → groupId
```
