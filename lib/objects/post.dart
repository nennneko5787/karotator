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

@freezed
abstract class ReplyTarget with _$ReplyTarget {
  const factory ReplyTarget({
    required DateTime createdAt,
    required int id,
    required int postId,
    required String source,
    required Author user,
    required int userId,
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
  }) = _HashTags;

  factory HashTags.fromJson(Map<String, Object?> json) =>
      _$HashTagsFromJson(json);
}

abstract interface class AbstractPost {
  int get id;
  String get content;
  Author get author;

  int? get parentId;
  int? get quotedPostId;

  DateTime get createdAt;
  DateTime get updatedAt;
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

  int get likesCount;
  int get rekarotsCount;
  int get repliesCount;
  int get viewsCount;
}

@freezed
abstract class QuotedPost with _$QuotedPost implements AbstractPost {
  const factory QuotedPost({
    required int id,
    required String content,
    required int authorId,
    required Author author,

    required DateTime createdAt,
    required DateTime updatedAt,
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

    required List<int> excludedMentions,
    required ReplyRestriction replyRestriction,
    required PostVisibility visibility,

    required bool canView,
  }) = _QuotedPost;

  factory QuotedPost.fromJson(Map<String, Object?> json) =>
      _$QuotedPostFromJson(json);
}

@freezed
abstract class Post with _$Post implements AbstractPost {
  const factory Post({
    required Author author,
    required int authorId,
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
    required List<int> excludedMentions,
    @Default(true) bool hasBlockedAuthor,
    @Default([]) List<HashTags> hashtags,
    required int id,
    required bool isAiGenerated,
    @Default(false) bool isBlockedByAuthor,
    @Default(false) bool isMutedByViewer,
    required bool isPromotional,
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
    int? parentId,
    Poll? poll,
    @Default(0) int quoteUsersCount,
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
    required ReplyRestriction replyRestriction,
    @Default([]) List<ReplyTarget> replyTargets,
    @Default([]) List<Author> replyToUsers,
    // required DateTime time,
    // required String type,
    required DateTime updatedAt,
    Circle? viewerCircle,
    int? viewerCircleId,
    required int viewsCount,
    required PostVisibility visibility,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
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
