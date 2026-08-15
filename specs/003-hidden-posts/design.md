# 003 表示できないカロート — design

## 1. 002 との関係

`REQ-HIDE-016` / `REQ-HIDE-017` は 002 の方針と衝突する。ここで決着させる。

| 002 の方針 | 003 での扱い |
| --- | --- |
| REQ-MODEL-003/004 欠けたフィールドは既定値付きか nullable | **維持**。今回の事故はこれを `QuotedPost` に適用し忘れたことが原因 |
| 公式スキーマだけが根拠のものは既定値付きで足してよい | **維持**。ただし「足してよい」のは `Post` のように全項目が来るモデルに限る |
| REQ-MODEL-006 作者の設定と運営の強制を合成した判定を 1 箇所に | **維持**。ただし置き場所を `AbstractPost` の拡張から `Post` の拡張へ移す |
| REQ-MODEL-008 引用元にも本体と同じ年齢・センシティブ判定 | **取り下げる**（下記） |

REQ-MODEL-008 を取り下げる理由は、サーバーが既にその判定を済ませているため。
年齢制限に触れる引用元は `MINOR_RESTRICTED`、R18 表示設定に触れるものは `R18_FILTERED` として
**本体ごと伏せて**返ってくる。クライアントが `isR18 || adminForceR18` を再計算する余地が無い。
引用元に年齢フィールドを持たせても、値が来ないか、来る時は既に伏せられている。

REQ-HIDE-017（画面が用いない項目を持たない）は 002 を全面否定するものではなく、
**`required` を付ける範囲**を縛るものと読む。運用規則としてはこうする。

> 画面が使わない項目は足さない。足すときは既定値付きか nullable にする。
> `required` にしてよいのは、そのモデルを返す全エンドポイントで存在を確認できた項目だけ。

`QuotedPost` の `required Author author` / `required DateTime createdAt` / `required int likesCount` は
どれもこの根拠を持っていなかった。

## 2. 型の構成

「見えるか見えないか」を nullable ではなく型で表す (REQ-HIDE-003)。

```
sealed PostResult          GET posts/{id} の結果
  ├ Post                   完全なカロート
  └ HiddenPost             非表示スタブ

sealed Quote               埋め込みの引用元・固定ポスト
  ├ QuotedPost             プレビュー
  └ HiddenPost             非表示スタブ
```

`HiddenPost` は両方を `implements` する。同じスタブが両方の場所に来るため。

> **制約**: `sealed` は直接のサブタイプが同じ**ライブラリ**にあることを要求する。
> `PostResult` / `Post` / `Quote` / `QuotedPost` / `HiddenPost` は
> **すべて `lib/objects/post.dart` に置く**。別ファイルに切り出すと `sealed` が壊れる。

### HiddenPost

保証するのは `id` だけ (REQ-HIDE-002)。

```dart
@freezed
abstract class HiddenPost with _$HiddenPost implements PostResult, Quote {
  const factory HiddenPost({
    required int id,
    int? authorId,
    int? parentId,
    int? quotedPostId,

    @JsonKey(unknownEnumValue: HiddenReason.UNKNOWN)
    @Default(HiddenReason.UNKNOWN)
    HiddenReason hiddenReason,

    @JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN)
    @Default(HiddenRelationDetail.UNKNOWN)
    HiddenRelationDetail hiddenRelationDetail,

    @JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN)
    @Default(HiddenFilterDetail.UNKNOWN)
    HiddenFilterDetail hiddenFilterDetail,
  }) = _HiddenPost;

  factory HiddenPost.fromJson(Map<String, Object?> json) =>
      _$HiddenPostFromJson(json);

  /// quotedPostId があるのに quotedPost が無いときに立てる (REQ-HIDE-006)。
  /// Karotter はこの値を返さない。Web クライアントが合成しているのに倣う。
  factory HiddenPost.notFound(int id) => HiddenPost(
    id: id,
    hiddenReason: HiddenReason.FILTERED,
    hiddenFilterDetail: HiddenFilterDetail.NOT_FOUND,
  );
}
```

`@Default` と `unknownEnumValue` は**両方要る**。前者はキーが無いとき、後者は
知らない値が入っていたときにしか効かない（002 requirements の脚注と同じ罠）。

### QuotedPost の縮小

画面が実際に読む項目だけにする (REQ-HIDE-017)。現行 30 項目のうち 22 が未使用だった。

```dart
@freezed
abstract class QuotedPost with _$QuotedPost implements Quote {
  const factory QuotedPost({
    required int id,
    required Author author,        // canView が false でない限り必ず来る
    required DateTime createdAt,
    @Default('') String content,
    @Default([]) List<String> mediaUrls,
    @Default([]) List<String> mediaTypes,
  }) = _QuotedPost;
}
```

`author` / `createdAt` を `required` に残す根拠は、Web が
`canView !== false && P.author` を満たすときだけ作者行を描いていること。
非表示側は `HiddenPost` に分かれるので、この分岐に入る時点で両方ある。

> ただし Web は `"createdAt" in P && P.createdAt` と存在確認してから触っている。
> 実データで欠落を観測したら `required` を外す（未解決に記載）。

R18・年齢・公開範囲・カウンタ・埋め込みカード・返信制限は**持たせない**。§1 の通り。
メディアの伏せ字（`mediaSpoilerFlags` / `mediaR18Flags`）は、伏せる UI を作る時に足す。

## 3. デコード

### 引用元

`Post.quotedPost` の型が `Quote?` になる。json_serializable が扱えないので変換器を挟む。
`OfficialMarkListConverter` と同じ形。

```dart
class QuoteConverter implements JsonConverter<Quote?, Object?> {
  const QuoteConverter();

  @override
  Quote? fromJson(Object? json) {
    if (json is! Map<String, Object?>) return null;
    return _isHidden(json) ? HiddenPost.fromJson(json) : QuotedPost.fromJson(json);
  }

  @override
  Object? toJson(Quote? value) => switch (value) {
    QuotedPost q => q.toJson(),
    HiddenPost h => h.toJson(),
    null => null,
  };
}

/// 非表示の判定。`canView` が本命で、`author` の有無は保険。
bool _isHidden(Map<String, Object?> json) =>
    json['canView'] == false || json['author'] == null;
```

### 単体取得

`GET posts/{id}` も同じ分岐が要る (REQ-HIDE-007)。こちらは変換器ではなく端点で分ける。

```dart
Future<PostResult> byId(int postId, {bool includeMutedOrBlocked = false}) async {
  final res = await http.get('posts/$postId', query: {
    if (includeMutedOrBlocked) 'includeMutedOrBlocked': 'true',
  });
  return res.object('post', postResultFromJson);
}

PostResult postResultFromJson(Map<String, Object?> json) =>
    _isHidden(json) ? HiddenPost.fromJson(json) : Post.fromJson(json);
```

一覧系（timeline / replies / user posts）は現状どおり `List<Post>` で受ける。
一覧に非表示スタブが混ざる例はまだ観測していない（未解決に記載）。

### NOT_FOUND の合成

デコード時ではなく参照時に合成する。`Post.fromJson` に項目間の条件を持ち込まない。

```dart
extension PostX on Post {
  /// 引用元。quotedPostId だけがある場合は取得失敗として扱う (REQ-HIDE-006)。
  Quote? get quote =>
      quotedPost ?? (quotedPostId != null ? HiddenPost.notFound(quotedPostId!) : null);
}
```

**画面は `quotedPost` ではなく `quote` を読む。** 直接 `quotedPost` を読むと合成が効かない。

## 4. 列挙と文言

`lib/enum.dart` に足す。`UNKNOWN` は受け皿で送信には使わない、という既存の規約どおり。

```dart
enum HiddenReason { RELATION, FILTERED, UNKNOWN }

enum HiddenRelationDetail { BLOCKED, BLOCKED_BY_AUTHOR, MUTED, UNKNOWN }

enum HiddenFilterDetail {
  PRIVATE_ACCOUNT, LIMITED_VISIBILITY, EXPIRED, ADMIN_HIDDEN, MUTED_KEYWORD,
  MINOR_RESTRICTED, R18_FILTERED, BOT_FILTERED, PARODY_FILTERED,
  NOT_FOUND,   // クライアントが合成する。サーバーは返さない
  UNKNOWN,
}
```

文言は**引用カードとスレッド親で違う**（Web も別関数を持っている）。
判定はモデル、文言は画面に置く。

| 置き場所 | 中身 |
| --- | --- |
| `lib/objects/post.dart` の `HiddenPostX` | `canReveal` — 開ける非表示かどうか |
| `lib/ui/post/hidden.dart` | 文言表と、それを描く widget |

```dart
extension HiddenPostX on HiddenPost {
  /// 閲覧者自身のミュート/ブロックによる非表示は開ける (REQ-HIDE-013, 014)。
  bool get canReveal =>
      hiddenReason == HiddenReason.RELATION &&
      (hiddenRelationDetail == HiddenRelationDetail.MUTED ||
       hiddenRelationDetail == HiddenRelationDetail.BLOCKED);
}
```

`BLOCKED_BY_AUTHOR` が入らないことがこの getter の要点。相手が隠したものを
閲覧者の操作で開けてはいけない。

文言は `switch` の網羅性に頼る。`UNKNOWN` と既定分岐で `REQ-HIDE-012` を満たす。

## 5. 復帰の流れ (REQ-HIDE-013..015)

```
引用カードが HiddenPost かつ canReveal
  → 「表示する」ボタンを出す
  → GET posts/{id}?includeMutedOrBlocked=true
  → PostResult が Post なら差し替えて描き直す
  → HiddenPost のままなら文言を更新するだけ
```

開いた後の引き継ぎ (REQ-HIDE-015) は、`revealMutedOrBlocked` という真偽値を
`PostDetailPage` → `PostWidget` → 引用カードへ順に渡す。Web も `a || $` で
同じことをしている。既定は `false`。

`PostWidget` のタップで取り直した結果が `HiddenPost` だった場合は、
詳細ページへ遷移せずに理由を出す。Web も非表示の引用カードはタップを無視している。

## 6. UI の再構成

### AbstractPost を廃止する

`AbstractPost` は `Post` と `QuotedPost` を同じ widget に流すためだけに存在していた。
引用カードを専用 widget にすれば不要になる。共有 widget は素の値を受け取る形に直す。

| 現在 | 変更後 |
| --- | --- |
| `PostContent(post: AbstractPost)` — 内部で `Post` に 4 回ダウンキャスト | `PostContent(post: Post)` |
| `PostMedia(post: AbstractPost)` | `PostMedia(urls: List<String>, types: List<String>)` |
| `PostUserDetail(post: AbstractPost)` | `PostUserDetail(author: Author, createdAt: DateTime)` |
| `PostWidget(post: AbstractPost)` | `PostWidget(post: Post)` |
| `extension AbstractPostX` の `effectiveR18` / `effectiveHidden` | `extension PostX` へ移設（REQ-MODEL-006 は維持） |

`PostContent` から `post case final Post p` の連鎖 4 つが消える。

### プレビューカードの共通化 (REQ-HIDE-009)

引用元と固定ポストは同じ `Quote` なので、カードも 1 つにする。
`profile_tab.dart` の `post is QuotedPost` は「固定ポストの印」を型で表しており、
`QuotedPost` を分解した時点で静かに壊れる。明示の引数に置き換える。

```dart
PostPreviewCard({
  required Quote quote,
  Widget? label,          // 「固定されたポスト」など
  bool revealMutedOrBlocked = false,
})
```

`QuotedPost` なら中身を、`HiddenPost` なら理由と（開けるなら）ボタンを描く。

### response.dart

`UserResponse.pinnedPost` / `pinnedPosts` の型を `QuotedPost` から `Quote` へ。
固定ポストにも非表示スタブが来うる（未確認だが型としては受けられるようにする）。

## 7. 影響範囲

| ファイル | 変更 |
| --- | --- |
| `lib/enum.dart` | 列挙 3 つ追加 |
| `lib/objects/post.dart` | `PostResult` / `Quote` / `HiddenPost` 追加、`QuotedPost` 縮小、`AbstractPost` 削除、`QuoteConverter`、`PostX.quote` |
| `lib/objects/response.dart` | `pinnedPost` / `pinnedPosts` を `Quote` へ |
| `lib/api/endpoints/posts.dart` | `byId` の戻り値を `PostResult` へ、`includeMutedOrBlocked` 追加 |
| `lib/ui/post/content.dart` | `Post` 専用化、引用カードを分離 |
| `lib/ui/post/hidden.dart` | **新規**。文言表とカード |
| `lib/ui/post/media.dart` | 引数を素の配列へ |
| `lib/ui/post/header.dart` | `PostUserDetail` の引数変更 |
| `lib/ui/post/post.dart` | `Post` 専用化、取り直し結果の分岐 |
| `lib/ui/profile_tab.dart` | 固定ポストを別枠で描く |
| `lib/pages/post_detail.dart` | `revealMutedOrBlocked` の受け渡し |
| `test/objects/parsing_test.dart` | 非表示スタブの試験を追加 |

`*.freezed.dart` / `*.g.dart` は再生成。

## 8. 試験 (REQ-HIDE-019)

`test/objects/parsing_test.dart` に足す。観測した実物をそのまま雛形にする。

- 非表示の引用元を含む `Post` が解釈できること（`author: null` で落ちない）
- その引用元が `HiddenPost` になり、理由が `FILTERED` / `MINOR_RESTRICTED` になること
- 知らない `hiddenReason` が `UNKNOWN` になり、例外にならないこと (REQ-HIDE-005)
- `hiddenReason` のキー自体が無くても `UNKNOWN` になること
- `quotedPostId` だけの `Post` で `quote` が `NOT_FOUND` になること (REQ-HIDE-006)
- `canReveal` が `MUTED` / `BLOCKED` で真、`BLOCKED_BY_AUTHOR` で偽になること (REQ-HIDE-014)

## 9. 観測ツール (REQ-HIDE-018)

`tool/grep_bundle.dart` を足す。既存の `tool/src/bundle.dart` を再利用し、
`tool/` の他のスクリプトと同じく pub 依存を持たない。

```
dart run tool/grep_bundle.dart <正規表現> [--context 400] [--origin https://karotter.com]
```

チャンク名つきで前後を出す。バンドルは 167 チャンク / 4.2MB あり、毎回取り直すと遅いので
`--cache <dir>` で落としたものを再利用できるようにする。出力先は `.gitignore` に足す。

今回の列挙値はこの方法で `KaroatCard-*.js` と `Post-*.js` から取った。
結果は `specs/api/conventions.md` に §9 として追記する。

## 10. 移行の順序

1. `enum.dart` に列挙を足す（単体で入る）
2. `post.dart` に `HiddenPost` / `Quote` / `PostResult` を足す。`QuotedPost` はまだ縮小しない
3. `QuoteConverter` と `byId` の分岐を入れる — **ここで落ちなくなる**
4. 試験を書く（2・3 の確認）
5. `AbstractPost` を外し、共有 widget の引数を直す
6. `QuotedPost` を縮小する
7. `PostPreviewCard` に寄せ、`profile_tab.dart` の型判定を潰す
8. `tool/grep_bundle.dart` と `conventions.md` §9

3 まで終えれば実害は止まる。5 以降は整理なので分けて入れられる。

## 11. 未解決

| 項目 | 判断待ちの内容 |
| --- | --- |
| 一覧系のスタブ | timeline / replies に `canView:false` が混ざるか未観測。混ざるなら `List<Post>` も `List<PostResult>` にする |
| `QuotedPost.createdAt` | Web が存在確認してから触っている。欠落を観測したら `required` を外す |
| `includeUnavailableReference` | スレッド親の取得で併用されている。何が変わるか未確認 |
| 固定ポストの操作列 | 現状プレビュー扱いなのでいいね等が出ない。完全な `Post` を取り直すかは 003 では決めない |
| メディアの伏せ字 | `mediaSpoilerFlags` / `mediaR18Flags` は伏せる UI と一緒に入れる（002 からの持ち越し） |
