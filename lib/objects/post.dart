import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/circle.dart';
import 'package:karotator/objects/user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Id with _$Id {
  const factory Id({required int id}) = _Id;

  factory Id.fromJson(Map<String, Object?> json) => _$IdFromJson(json);
}

@freezed
abstract class MentionId with _$MentionId {
  const factory MentionId({required int mentionedId}) = _MentionId;

  factory MentionId.fromJson(Map<String, Object?> json) =>
      _$MentionIdFromJson(json);
}

@freezed
abstract class PollOption with _$PollOption {
  const factory PollOption({
    required int id,
    required String text,
    String? imageUrl,
    required int position,
    required int votesCount,
    required int percentage,
    required bool votedByMe,
  }) = _PollOption;

  factory PollOption.fromJson(Map<String, Object?> json) =>
      _$PollOptionFromJson(json);
}

@freezed
abstract class Poll with _$Poll {
  const factory Poll({
    required int id,
    required DateTime expiresAt,
    required bool isExpired,

    /// 誰が何に入れたかを見せない投票。
    @Default(false) bool isAnonymous,

    required int totalVotes,
    int? ownVoteOptionId,
    required List<PollOption> options,
  }) = _Poll;

  factory Poll.fromJson(Map<String, Object?> json) => _$PollFromJson(json);
}

@freezed
abstract class ReactionSummary with _$ReactionSummary {
  const factory ReactionSummary({
    required int count,
    required String emoji,
    required bool reacted,
  }) = _ReactionSummary;

  factory ReactionSummary.fromJson(Map<String, Object?> json) =>
      _$ReactionSummaryFromJson(json);
}

@freezed
abstract class Reaction with _$Reaction {
  const factory Reaction({required String emoji, required int userId}) =
      _Reaction;

  factory Reaction.fromJson(Map<String, Object?> json) =>
      _$ReactionFromJson(json);
}

/// カロートに埋め込まれる返信先。
///
/// `user` 以外は返ってこないことがある（開発者 API の例がそう）。
/// `posts/{id}/reply-targets` が返す `candidates` はこれとは別物で、
/// 素の [Author] が並ぶ。
@freezed
abstract class ReplyTarget with _$ReplyTarget {
  const factory ReplyTarget({
    required Author user,

    /// `PARENT_AUTHOR` / `THREAD_PARTICIPANT` など。
    @Default('') String source,

    int? id,
    int? postId,
    int? userId,
    DateTime? createdAt,
  }) = _ReplyTarget;

  factory ReplyTarget.fromJson(Map<String, Object?> json) =>
      _$ReplyTargetFromJson(json);
}

@freezed
abstract class HashTags with _$HashTags {
  const factory HashTags({
    required int id,
    required String? name,
    required int? usageCount,
    required int? trendScore,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _HashTags;

  factory HashTags.fromJson(Map<String, Object?> json) =>
      _$HashTagsFromJson(json);
}

/// トレンド 1 件。`GET search/trending/topics` の `trends`。
///
/// ハッシュタグ以外（単語など）も混ざるので [type] で分かれる。
@freezed
abstract class Trend with _$Trend {
  const factory Trend({
    /// 検索に投げる文字列。ハッシュタグなら `#` を含まない。
    @Default('') String token,

    /// 画面に出す文字列。
    @Default('') String label,

    /// `HASHTAG` / `KEYWORD` など。
    @Default('') String type,

    @Default(0) int postCount,
    @Default(0) int authorCount,
    @Default(0) int usageCount,
    @Default(0) double trendScore,
  }) = _Trend;

  factory Trend.fromJson(Map<String, Object?> json) => _$TrendFromJson(json);
}

@freezed
abstract class NotificationPost with _$NotificationPost {
  const factory NotificationPost({
    required int id,
    required String content,
    required Author author,
    required DateTime createdAt,

    @Default([]) List<String> mediaUrls,
    @Default([]) List<String> mediaTypes,
  }) = _NotificationPost;

  factory NotificationPost.fromJson(Map<String, Object?> json) =>
      _$NotificationPostFromJson(json);
}

/// `GET posts/{id}` の結果。見えるとは限らない。
///
/// 仕様: [specs/003-hidden-posts](../../specs/003-hidden-posts/design.md) §2
sealed class PostResult {
  int get id;
}

/// 埋め込みの引用元、および固定ポスト。
///
/// タップ時に必ず [KarotterApi.posts.byId] で取り直すので、ここに来るのは
/// カード 1 枚を描くのに要る分だけ。完全なカロートではない。
sealed class Quote {
  int get id;
}

/// 表示できないカロート。`canView: false` のとき本体の代わりに来る。
///
/// **[id] 以外は来ないことがある。** Karotter は伏せたカロートについて
/// `author` すら `null` で返す。理由コードだけが確実に入っている。
///
/// 引用元にも単体取得にも同じ形で来るので [PostResult] と [Quote] の両方を実装する。
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

  /// 引用元を取得できなかった場合。
  ///
  /// `quotedPostId` があるのに `quotedPost` が無いときに立てる。Karotter は
  /// この値を返さないが、Web クライアントが同じものを合成しているので倣う。
  factory HiddenPost.notFound(int id) => HiddenPost(
    id: id,
    hiddenReason: HiddenReason.FILTERED,
    hiddenFilterDetail: HiddenFilterDetail.NOT_FOUND,
  );
}

extension HiddenPostX on HiddenPost {
  /// 閲覧者自身が隠したものかどうか。真なら「表示する」で開ける。
  ///
  /// `BLOCKED_BY_AUTHOR`（相手が閲覧者をブロックしている）は**含めない**。
  /// 相手が隠したものを閲覧者の操作で開けてはいけない。
  bool get canReveal =>
      hiddenReason == HiddenReason.RELATION &&
      (hiddenRelationDetail == HiddenRelationDetail.MUTED ||
          hiddenRelationDetail == HiddenRelationDetail.BLOCKED);
}

/// 引用元・固定ポストのプレビュー。
///
/// 画面が読む分だけを持つ。カウンタ・公開範囲・年齢制限などは持たない
/// （年齢と R18 はサーバーが先に判定して [HiddenPost] にして返すため）。
@freezed
abstract class QuotedPost with _$QuotedPost implements Quote {
  const factory QuotedPost({
    required int id,

    /// `canView` が false でない限り必ず来る。Web も
    /// `canView !== false && author` を満たすときだけ作者行を描いている。
    required Author author,
    required DateTime createdAt,

    @Default('') String content,
    @Default([]) List<String> mediaUrls,
    @Default([]) List<String> mediaTypes,
  }) = _QuotedPost;

  factory QuotedPost.fromJson(Map<String, Object?> json) =>
      _$QuotedPostFromJson(json);
}

/// 非表示スタブかどうか。`canView` が本命で、`author` の有無は保険。
bool isHiddenPostJson(Map<String, Object?> json) =>
    json['canView'] == false || json['author'] == null;

/// `GET posts/{id}` の `post` を読む。
PostResult postResultFromJson(Map<String, Object?> json) =>
    isHiddenPostJson(json) ? HiddenPost.fromJson(json) : Post.fromJson(json);

/// 埋め込みの引用元を [QuotedPost] と [HiddenPost] に振り分ける。
///
/// json_serializable は sealed 型を扱えないので変換器を挟む。
class QuoteConverter implements JsonConverter<Quote?, Object?> {
  const QuoteConverter();

  @override
  Quote? fromJson(Object? json) {
    if (json is! Map<String, Object?>) return null;
    return isHiddenPostJson(json)
        ? HiddenPost.fromJson(json)
        : QuotedPost.fromJson(json);
  }

  @override
  Object? toJson(Quote? value) => switch (value) {
    QuotedPost q => q.toJson(),
    HiddenPost h => h.toJson(),
    null => null,
  };
}

/// [QuoteConverter] の配列版。固定ポストの一覧に使う。
class QuoteListConverter implements JsonConverter<List<Quote>, Object?> {
  const QuoteListConverter();

  @override
  List<Quote> fromJson(Object? json) {
    if (json is! List) return const [];
    return [for (final e in json) ?const QuoteConverter().fromJson(e)];
  }

  @override
  Object? toJson(List<Quote> value) =>
      [for (final q in value) const QuoteConverter().toJson(q)];
}

@freezed
abstract class Post with _$Post implements PostResult {
  const factory Post({
    /// 運営が強制的に非表示にした。作者本人の設定より優先される。
    @Default(false) bool adminForceHidden,

    /// 運営が強制的に R18 扱いにした。作者の [isR18] より優先される。
    @Default(false) bool adminForceR18,

    required Author author,
    int? authorId,
    /// 一覧の種類によっては返らない。`/users/{id}/media` がそう。
    @Default(false) bool bookmarked,
    //required List<Id> bookmarks,
    @Default(0) int bookmarksCount,
    @Default(true) bool canInteract,
    @Default(true) bool canQuote,
    String? comment,
    @Default("") String content,
    required DateTime createdAt,
    DateTime? editedAt,
    String? embedDescription,
    String? embedImage,
    String? embedTitle,
    String? embedUrl,
    @Default([]) List<int> excludedMentions,
    @Default(true) bool hasBlockedAuthor,
    @Default([]) List<HashTags> hashtags,

    /// 未成年に見せない。
    @Default(false) bool hideFromMinors,

    required int id,
    @Default(false) bool isAiGenerated,
    @Default(false) bool isBlockedByAuthor,
    @Default(false) bool isMutedByViewer,
    @Default(false) bool isPromotional,

    /// 作者が R18 として投稿した。表示前に伏せること。
    @Default(false) bool isR18,

    /// 閲覧可能な年齢の上限。null なら制限無し。
    int? maximumAge,

    /// 運営が上書きした年齢制限。
    int? adminForceMinimumAge,
    int? adminForceMaximumAge,

    /// 作者の設定と運営の上書きをサーバー側で合成した結果。
    /// 年齢制限の判定はこちらを使う（[effectiveR18] と違い自前で計算しない）。
    int? effectiveMinimumAge,
    int? effectiveMaximumAge,

    /// コミュニティに投稿されたカロート。karotator はまだ画面を持たない。
    int? communityId,

    /// 期限付きカロートの消滅時刻。
    DateTime? expiresAt,
    // required String itemId,
    @Default(false) bool liked,
    // required List<Id> likes,
    @Default(0) int likesCount,
    @Default([]) List<String> mediaAlts,
    @Default([]) List<bool> mediaR18Flags,
    @Default([]) List<bool> mediaSpoilerFlags,
    @Default([]) List<String> mediaTypes,
    @Default([]) List<String> mediaUrls,
    @Default([]) List<MentionId> mentions,

    /// 閲覧可能な年齢の下限。null なら制限無し。
    int? minimumAge,

    int? parentId,
    Poll? poll,
    /// 引用した人数。エンドポイントによっては [quotePostsCount] で返る。
    @Default(0) int quoteUsersCount,
    @Default(0) int quotePostsCount,

    /// 引用元。**画面からは [PostX.quote] を読むこと。**
    /// こちらを直接読むと `quotedPostId` だけがある場合の合成が効かない。
    @QuoteConverter() Quote? quotedPost,
    int? quotedPostId,
    @Default([]) List<ReactionSummary> reactionSummary,
    @Default([]) List<Reaction> reactions,
    @Default(false) bool rekaroted,
    Author? rekarotedBy,
    // required List<Id> rekarots,
    @Default(0) int rekarotsCount,
    @Default(0) int repliesCount,
    Circle? replyCircle,
    int? replyCircleId,
    @JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN)
    @Default(ReplyRestriction.EVERYONE)
    ReplyRestriction replyRestriction,
    @Default([]) List<ReplyTarget> replyTargets,
    @Default([]) List<Author> replyToUsers,
    // required DateTime time,
    // required String type,
    DateTime? updatedAt,
    Circle? viewerCircle,
    int? viewerCircleId,
    @Default(0) int viewsCount,
    @JsonKey(unknownEnumValue: PostVisibility.UNKNOWN)
    @Default(PostVisibility.PUBLIC)
    PostVisibility visibility,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);

  factory Post.empty() => Post(
    author: Author.empty(),
    bookmarked: false,
    bookmarksCount: 0,
    content: "",
    createdAt: DateTime(0),
    id: 0,
    isAiGenerated: false,
    isPromotional: false,
    likesCount: 0,
    mediaAlts: [],
    mediaR18Flags: [],
    mediaSpoilerFlags: [],
    mediaTypes: [],
    mediaUrls: [],
    repliesCount: 0,
    viewsCount: 0,
  );
}

extension PostX on Post {
  /// 運営の強制設定を加味した最終的な R18 判定。表示前にこれで伏せる。
  bool get effectiveR18 => isR18 || adminForceR18;

  /// 運営に非表示にされている。
  bool get effectiveHidden => adminForceHidden;

  /// 引用元。`quotedPostId` だけがある場合は「取得できなかった」として扱う。
  ///
  /// Web クライアントも同じ合成をしている。[Post.quotedPost] を直接読むと
  /// 引用の存在自体が画面から消えるので、必ずこちらを使う。
  Quote? get quote =>
      quotedPost ??
      (quotedPostId != null ? HiddenPost.notFound(quotedPostId!) : null);

  Author? getThreadParentAuthor() {
    for (var target in replyTargets) {
      // PARENT_AUTHOR or THREAD_PARTICIPANT and more
      if (target.source == "PARENT_AUTHOR") {
        return target.user;
      }
    }
    return null;
  }
}
