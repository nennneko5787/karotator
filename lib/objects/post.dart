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

abstract interface class AbstractPost {
  int get id;
  String get content;
  Author get author;

  int? get parentId;
  int? get quotedPostId;

  DateTime get createdAt;
  DateTime? get updatedAt;
  DateTime? get editedAt;

  String? get embedUrl;
  String? get embedTitle;
  String? get embedDescription;
  String? get embedImage;

  List<String> get mediaUrls;
  List<String> get mediaTypes;
  List<String> get mediaAlts;
  List<bool> get mediaSpoilerFlags;
  List<bool> get mediaR18Flags;

  List<int> get excludedMentions;
  ReplyRestriction get replyRestriction;
  PostVisibility get visibility;

  /// 年齢・センシティブ関連。引用元も同じ判定が要るのでここに置く。
  bool get isR18;
  bool get hideFromMinors;
  bool get adminForceR18;
  bool get adminForceHidden;
  int? get minimumAge;
  int? get maximumAge;
}

extension AbstractPostX on AbstractPost {
  /// 運営の強制設定を加味した最終的な R18 判定。表示前にこれで伏せる。
  bool get effectiveR18 => isR18 || adminForceR18;

  /// 運営に非表示にされている。
  bool get effectiveHidden => adminForceHidden;
}

@freezed
abstract class QuotedPost with _$QuotedPost implements AbstractPost {
  const factory QuotedPost({
    required int id,
    required String content,
    required Author author,

    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? editedAt,

    int? parentId,
    int? quotedPostId,

    @Default([]) List<String> mediaUrls,
    @Default([]) List<String> mediaTypes,
    @Default([]) List<String> mediaAlts,
    @Default([]) List<bool> mediaSpoilerFlags,
    @Default([]) List<bool> mediaR18Flags,

    String? embedUrl,
    String? embedTitle,
    String? embedDescription,
    String? embedImage,

    required int likesCount,
    required int rekarotsCount,
    required int repliesCount,
    required int viewsCount,

    @Default([]) List<int> excludedMentions,
    @JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN)
    @Default(ReplyRestriction.EVERYONE)
    ReplyRestriction replyRestriction,
    @JsonKey(unknownEnumValue: PostVisibility.UNKNOWN)
    @Default(PostVisibility.PUBLIC)
    PostVisibility visibility,

    @Default(false) bool isR18,
    @Default(false) bool hideFromMinors,
    @Default(false) bool adminForceR18,
    @Default(false) bool adminForceHidden,
    int? minimumAge,
    int? maximumAge,

    @Default(true) bool canView,
  }) = _QuotedPost;

  factory QuotedPost.fromJson(Map<String, Object?> json) =>
      _$QuotedPostFromJson(json);
}

@freezed
abstract class Post with _$Post implements AbstractPost {
  const factory Post({
    /// 運営が強制的に非表示にした。作者本人の設定より優先される。
    @Default(false) bool adminForceHidden,

    /// 運営が強制的に R18 扱いにした。作者の [isR18] より優先される。
    @Default(false) bool adminForceR18,

    required Author author,
    int? authorId,
    required bool bookmarked,
    //required List<Id> bookmarks,
    required int bookmarksCount,
    @Default(true) bool canInteract,
    @Default(true) bool canQuote,
    String? comment,
    required String content,
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
    required bool isAiGenerated,
    @Default(false) bool isBlockedByAuthor,
    @Default(false) bool isMutedByViewer,
    required bool isPromotional,

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
    required int likesCount,
    required List<String> mediaAlts,
    required List<bool> mediaR18Flags,
    required List<bool> mediaSpoilerFlags,
    required List<String> mediaTypes,
    required List<String> mediaUrls,
    @Default([]) List<MentionId> mentions,

    /// 閲覧可能な年齢の下限。null なら制限無し。
    int? minimumAge,

    int? parentId,
    Poll? poll,
    /// 引用した人数。エンドポイントによっては [quotePostsCount] で返る。
    @Default(0) int quoteUsersCount,
    @Default(0) int quotePostsCount,
    QuotedPost? quotedPost,
    int? quotedPostId,
    @Default([]) List<ReactionSummary> reactionSummary,
    @Default([]) List<Reaction> reactions,
    @Default(false) bool rekaroted,
    Author? rekarotedBy,
    // required List<Id> rekarots,
    @Default(0) int rekarotsCount,
    required int repliesCount,
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
    required int viewsCount,
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
