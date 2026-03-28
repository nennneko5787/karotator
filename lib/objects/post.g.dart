// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Id _$IdFromJson(Map<String, dynamic> json) =>
    _Id(id: (json['id'] as num).toInt());

Map<String, dynamic> _$IdToJson(_Id instance) => <String, dynamic>{
  'id': instance.id,
};

_MentionId _$MentionIdFromJson(Map<String, dynamic> json) =>
    _MentionId(mentionedId: (json['mentionedId'] as num).toInt());

Map<String, dynamic> _$MentionIdToJson(_MentionId instance) =>
    <String, dynamic>{'mentionedId': instance.mentionedId};

_PollOption _$PollOptionFromJson(Map<String, dynamic> json) => _PollOption(
  id: (json['id'] as num).toInt(),
  text: json['text'] as String,
  position: (json['position'] as num).toInt(),
  votesCount: (json['votesCount'] as num).toInt(),
  percentage: (json['percentage'] as num).toInt(),
  votedByMe: json['votedByMe'] as bool,
);

Map<String, dynamic> _$PollOptionToJson(_PollOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'position': instance.position,
      'votesCount': instance.votesCount,
      'percentage': instance.percentage,
      'votedByMe': instance.votedByMe,
    };

_Poll _$PollFromJson(Map<String, dynamic> json) => _Poll(
  id: (json['id'] as num).toInt(),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  isExpired: json['isExpired'] as bool,
  totalVotes: (json['totalVotes'] as num).toInt(),
  ownVoteOptionId: (json['ownVoteOptionId'] as num?)?.toInt(),
  options: (json['options'] as List<dynamic>)
      .map((e) => PollOption.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PollToJson(_Poll instance) => <String, dynamic>{
  'id': instance.id,
  'expiresAt': instance.expiresAt.toIso8601String(),
  'isExpired': instance.isExpired,
  'totalVotes': instance.totalVotes,
  'ownVoteOptionId': instance.ownVoteOptionId,
  'options': instance.options,
};

_ReactionSummary _$ReactionSummaryFromJson(Map<String, dynamic> json) =>
    _ReactionSummary(
      count: (json['count'] as num).toInt(),
      emoji: json['emoji'] as String,
      reacted: json['reacted'] as bool,
    );

Map<String, dynamic> _$ReactionSummaryToJson(_ReactionSummary instance) =>
    <String, dynamic>{
      'count': instance.count,
      'emoji': instance.emoji,
      'reacted': instance.reacted,
    };

_Reaction _$ReactionFromJson(Map<String, dynamic> json) => _Reaction(
  emoji: json['emoji'] as String,
  userId: (json['userId'] as num).toInt(),
);

Map<String, dynamic> _$ReactionToJson(_Reaction instance) => <String, dynamic>{
  'emoji': instance.emoji,
  'userId': instance.userId,
};

_ReplyTarget _$ReplyTargetFromJson(Map<String, dynamic> json) => _ReplyTarget(
  createdAt: DateTime.parse(json['createdAt'] as String),
  id: (json['id'] as num).toInt(),
  postId: (json['postId'] as num).toInt(),
  source: json['source'] as String,
  user: Author.fromJson(json['user'] as Map<String, dynamic>),
  userId: (json['userId'] as num).toInt(),
);

Map<String, dynamic> _$ReplyTargetToJson(_ReplyTarget instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'postId': instance.postId,
      'source': instance.source,
      'user': instance.user,
      'userId': instance.userId,
    };

_HashTags _$HashTagsFromJson(Map<String, dynamic> json) => _HashTags(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  usageCount: (json['usageCount'] as num?)?.toInt(),
  trendScore: (json['trendScore'] as num?)?.toInt(),
);

Map<String, dynamic> _$HashTagsToJson(_HashTags instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'usageCount': instance.usageCount,
  'trendScore': instance.trendScore,
};

_QuotedPost _$QuotedPostFromJson(Map<String, dynamic> json) => _QuotedPost(
  id: (json['id'] as num).toInt(),
  content: json['content'] as String,
  author: Author.fromJson(json['author'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
  parentId: (json['parentId'] as num?)?.toInt(),
  quotedPostId: (json['quotedPostId'] as num?)?.toInt(),
  mediaUrls:
      (json['mediaUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  mediaTypes:
      (json['mediaTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  mediaAlts:
      (json['mediaAlts'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  mediaSpoilerFlags:
      (json['mediaSpoilerFlags'] as List<dynamic>?)
          ?.map((e) => e as bool)
          .toList() ??
      const [],
  mediaR18Flags:
      (json['mediaR18Flags'] as List<dynamic>?)
          ?.map((e) => e as bool)
          .toList() ??
      const [],
  embedUrl: json['embedUrl'] as String?,
  embedTitle: json['embedTitle'] as String?,
  embedDescription: json['embedDescription'] as String?,
  embedImage: json['embedImage'] as String?,
  likesCount: (json['likesCount'] as num).toInt(),
  rekarotsCount: (json['rekarotsCount'] as num).toInt(),
  repliesCount: (json['repliesCount'] as num).toInt(),
  viewsCount: (json['viewsCount'] as num).toInt(),
  excludedMentions:
      (json['excludedMentions'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  replyRestriction:
      $enumDecodeNullable(
        _$ReplyRestrictionEnumMap,
        json['replyRestriction'],
      ) ??
      ReplyRestriction.EVERYONE,
  visibility:
      $enumDecodeNullable(_$PostVisibilityEnumMap, json['visibility']) ??
      PostVisibility.PUBLIC,
  canView: json['canView'] as bool? ?? true,
);

Map<String, dynamic> _$QuotedPostToJson(_QuotedPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'author': instance.author,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'editedAt': instance.editedAt?.toIso8601String(),
      'parentId': instance.parentId,
      'quotedPostId': instance.quotedPostId,
      'mediaUrls': instance.mediaUrls,
      'mediaTypes': instance.mediaTypes,
      'mediaAlts': instance.mediaAlts,
      'mediaSpoilerFlags': instance.mediaSpoilerFlags,
      'mediaR18Flags': instance.mediaR18Flags,
      'embedUrl': instance.embedUrl,
      'embedTitle': instance.embedTitle,
      'embedDescription': instance.embedDescription,
      'embedImage': instance.embedImage,
      'likesCount': instance.likesCount,
      'rekarotsCount': instance.rekarotsCount,
      'repliesCount': instance.repliesCount,
      'viewsCount': instance.viewsCount,
      'excludedMentions': instance.excludedMentions,
      'replyRestriction': _$ReplyRestrictionEnumMap[instance.replyRestriction]!,
      'visibility': _$PostVisibilityEnumMap[instance.visibility]!,
      'canView': instance.canView,
    };

const _$ReplyRestrictionEnumMap = {
  ReplyRestriction.EVERYONE: 'EVERYONE',
  ReplyRestriction.FOLLOWING: 'FOLLOWING',
  ReplyRestriction.MENTIONED: 'MENTIONED',
  ReplyRestriction.CIRCLE: 'CIRCLE',
};

const _$PostVisibilityEnumMap = {
  PostVisibility.PUBLIC: 'PUBLIC',
  PostVisibility.CIRCLE: 'CIRCLE',
};

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
  author: Author.fromJson(json['author'] as Map<String, dynamic>),
  authorId: (json['authorId'] as num).toInt(),
  bookmarked: json['bookmarked'] as bool,
  bookmarksCount: (json['bookmarksCount'] as num).toInt(),
  canInteract: json['canInteract'] as bool? ?? true,
  canQuote: json['canQuote'] as bool? ?? true,
  comment: json['comment'] as String?,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
  embedDescription: json['embedDescription'] as String?,
  embedImage: json['embedImage'] as String?,
  embedTitle: json['embedTitle'] as String?,
  embedUrl: json['embedUrl'] as String?,
  excludedMentions: (json['excludedMentions'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  hasBlockedAuthor: json['hasBlockedAuthor'] as bool? ?? true,
  hashtags:
      (json['hashtags'] as List<dynamic>?)
          ?.map((e) => HashTags.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  id: (json['id'] as num).toInt(),
  isAiGenerated: json['isAiGenerated'] as bool,
  isBlockedByAuthor: json['isBlockedByAuthor'] as bool? ?? false,
  isMutedByViewer: json['isMutedByViewer'] as bool? ?? false,
  isPromotional: json['isPromotional'] as bool,
  liked: json['liked'] as bool? ?? false,
  likesCount: (json['likesCount'] as num).toInt(),
  mediaAlts: (json['mediaAlts'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  mediaR18Flags: (json['mediaR18Flags'] as List<dynamic>)
      .map((e) => e as bool)
      .toList(),
  mediaSpoilerFlags: (json['mediaSpoilerFlags'] as List<dynamic>)
      .map((e) => e as bool)
      .toList(),
  mediaTypes: (json['mediaTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  mediaUrls: (json['mediaUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  mentions:
      (json['mentions'] as List<dynamic>?)
          ?.map((e) => MentionId.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  parentId: (json['parentId'] as num?)?.toInt(),
  poll: json['poll'] == null
      ? null
      : Poll.fromJson(json['poll'] as Map<String, dynamic>),
  quoteUsersCount: (json['quoteUsersCount'] as num?)?.toInt() ?? 0,
  quotedPost: json['quotedPost'] == null
      ? null
      : QuotedPost.fromJson(json['quotedPost'] as Map<String, dynamic>),
  quotedPostId: (json['quotedPostId'] as num?)?.toInt(),
  reactionSummary:
      (json['reactionSummary'] as List<dynamic>?)
          ?.map((e) => ReactionSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  reactions:
      (json['reactions'] as List<dynamic>?)
          ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  rekaroted: json['rekaroted'] as bool? ?? false,
  rekarotedBy: json['rekarotedBy'] == null
      ? null
      : Author.fromJson(json['rekarotedBy'] as Map<String, dynamic>),
  rekarotsCount: (json['rekarotsCount'] as num?)?.toInt() ?? 0,
  repliesCount: (json['repliesCount'] as num).toInt(),
  replyCircle: json['replyCircle'] == null
      ? null
      : Circle.fromJson(json['replyCircle'] as Map<String, dynamic>),
  replyCircleId: (json['replyCircleId'] as num?)?.toInt(),
  replyRestriction: $enumDecode(
    _$ReplyRestrictionEnumMap,
    json['replyRestriction'],
  ),
  replyTargets:
      (json['replyTargets'] as List<dynamic>?)
          ?.map((e) => ReplyTarget.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  replyToUsers:
      (json['replyToUsers'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  viewerCircle: json['viewerCircle'] == null
      ? null
      : Circle.fromJson(json['viewerCircle'] as Map<String, dynamic>),
  viewerCircleId: (json['viewerCircleId'] as num?)?.toInt(),
  viewsCount: (json['viewsCount'] as num).toInt(),
  visibility: $enumDecode(_$PostVisibilityEnumMap, json['visibility']),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'author': instance.author,
  'authorId': instance.authorId,
  'bookmarked': instance.bookmarked,
  'bookmarksCount': instance.bookmarksCount,
  'canInteract': instance.canInteract,
  'canQuote': instance.canQuote,
  'comment': instance.comment,
  'content': instance.content,
  'createdAt': instance.createdAt.toIso8601String(),
  'editedAt': instance.editedAt?.toIso8601String(),
  'embedDescription': instance.embedDescription,
  'embedImage': instance.embedImage,
  'embedTitle': instance.embedTitle,
  'embedUrl': instance.embedUrl,
  'excludedMentions': instance.excludedMentions,
  'hasBlockedAuthor': instance.hasBlockedAuthor,
  'hashtags': instance.hashtags,
  'id': instance.id,
  'isAiGenerated': instance.isAiGenerated,
  'isBlockedByAuthor': instance.isBlockedByAuthor,
  'isMutedByViewer': instance.isMutedByViewer,
  'isPromotional': instance.isPromotional,
  'liked': instance.liked,
  'likesCount': instance.likesCount,
  'mediaAlts': instance.mediaAlts,
  'mediaR18Flags': instance.mediaR18Flags,
  'mediaSpoilerFlags': instance.mediaSpoilerFlags,
  'mediaTypes': instance.mediaTypes,
  'mediaUrls': instance.mediaUrls,
  'mentions': instance.mentions,
  'parentId': instance.parentId,
  'poll': instance.poll,
  'quoteUsersCount': instance.quoteUsersCount,
  'quotedPost': instance.quotedPost,
  'quotedPostId': instance.quotedPostId,
  'reactionSummary': instance.reactionSummary,
  'reactions': instance.reactions,
  'rekaroted': instance.rekaroted,
  'rekarotedBy': instance.rekarotedBy,
  'rekarotsCount': instance.rekarotsCount,
  'repliesCount': instance.repliesCount,
  'replyCircle': instance.replyCircle,
  'replyCircleId': instance.replyCircleId,
  'replyRestriction': _$ReplyRestrictionEnumMap[instance.replyRestriction]!,
  'replyTargets': instance.replyTargets,
  'replyToUsers': instance.replyToUsers,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'viewerCircle': instance.viewerCircle,
  'viewerCircleId': instance.viewerCircleId,
  'viewsCount': instance.viewsCount,
  'visibility': _$PostVisibilityEnumMap[instance.visibility]!,
};
