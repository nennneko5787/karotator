import 'package:freezed_annotation/freezed_annotation.dart';
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
    required String name,
    required int usageCount,
    required int trendScore,
  }) = _HashTags;

  factory HashTags.fromJson(Map<String, Object?> json) =>
      _$HashTagsFromJson(json);
}

@freezed
abstract class QuotedPost with _$QuotedPost {
  const factory QuotedPost({
    required int id,
    required String content,
    required int authorId,
    required Author author,

    DateTime? createdAt,
    DateTime? updatedAt,

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

    int? likesCount,
    int? rekarotsCount,
    int? repliesCount,
    int? viewsCount,

    String? replyRestriction,
    String? visibility,

    bool? isAiGenerated,
    bool? isPromotional,
    bool? liked,
    bool? rekaroted,
    bool? bookmarked,

    bool? canInteract,
    bool? canQuote,

    // 再帰対応（ネストされた引用）
    QuotedPost? quotedPost,
  }) = _QuotedPost;

  factory QuotedPost.fromJson(Map<String, Object?> json) =>
      _$QuotedPostFromJson(json);
}

@freezed
abstract class Post with _$Post {
  const factory Post({
    required Author author,
    required int authorId,
    required bool bookmarked,
    //required List<Id> bookmarks,
    required int bookmarksCount,
    required bool canInteract,
    required bool canQuote,
    String? comment,
    required String content,
    required DateTime createdAt,
    DateTime? editedAt,
    String? embedDescription,
    String? embedImage,
    String? embedTitle,
    String? embedUrl,
    required List<int> excludedMentions,
    required bool hasBlockedAuthor,
    required List<HashTags> hashtags,
    required int id,
    required bool isAiGenerated,
    required bool isBlockedByAuthor,
    required bool isMutedByViewer,
    required bool isPromotional,
    // required String itemId,
    required bool liked,
    // required List<Id> likes,
    required int likesCount,
    required List<String> mediaAlts,
    required List<bool> mediaR18Flags,
    required List<bool> mediaSpoilerFlags,
    required List<String> mediaTypes,
    required List<String> mediaUrls,
    required List<MentionId> mentions,
    int? parentId,
    Poll? poll,
    required int quoteUsersCount,
    QuotedPost? quotedPost,
    int? quotedPostId,
    required List<ReactionSummary> reactionSummary,
    required List<Reaction> reactions,
    required bool rekaroted,
    Author? rekarotedBy,
    // required List<Id> rekarots,
    required int rekarotsCount,
    required int repliesCount,
    Circle? replyCircle,
    int? replyCircleId,
    required String replyRestriction,
    required List<ReplyTarget> replyTargets,
    required List<Author> replyToUsers,
    // required DateTime time,
    // required String type,
    required DateTime updatedAt,
    Circle? viewerCircle,
    int? viewerCircleId,
    required int viewsCount,
    required String visibility,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);

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
