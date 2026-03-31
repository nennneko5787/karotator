// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardCreator _$BoardCreatorFromJson(Map<String, dynamic> json) =>
    _BoardCreator(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$BoardCreatorToJson(_BoardCreator instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'displayName': instance.displayName,
    };

_Board _$BoardFromJson(Map<String, dynamic> json) => _Board(
  id: (json['id'] as num).toInt(),
  slug: json['slug'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  minimumAge: (json['minimumAge'] as num).toInt(),
  threadCount: (json['threadCount'] as num).toInt(),
  replyCount: (json['replyCount'] as num).toInt(),
  lastPostAt: DateTime.parse(json['lastPostAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  creator: BoardCreator.fromJson(json['creator'] as Map<String, dynamic>),
  followed: json['followed'] as bool,
);

Map<String, dynamic> _$BoardToJson(_Board instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'title': instance.title,
  'description': instance.description,
  'minimumAge': instance.minimumAge,
  'threadCount': instance.threadCount,
  'replyCount': instance.replyCount,
  'lastPostAt': instance.lastPostAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'creator': instance.creator,
  'followed': instance.followed,
};

_ThreadAuthor _$ThreadAuthorFromJson(Map<String, dynamic> json) =>
    _ThreadAuthor(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$ThreadAuthorToJson(_ThreadAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'displayName': instance.displayName,
    };

_Thread _$ThreadFromJson(Map<String, dynamic> json) => _Thread(
  id: (json['id'] as num).toInt(),
  boardId: (json['boardId'] as num).toInt(),
  authorId: (json['authorId'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String,
  imageUrls: (json['imageUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  imageTypes: (json['imageTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  replyCount: (json['replyCount'] as num).toInt(),
  lastReplyAt: DateTime.parse(json['lastReplyAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  author: ThreadAuthor.fromJson(json['author'] as Map<String, dynamic>),
  reactionSummary: (json['reactionSummary'] as List<dynamic>)
      .map((e) => ReactionSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  followed: json['followed'] as bool,
);

Map<String, dynamic> _$ThreadToJson(_Thread instance) => <String, dynamic>{
  'id': instance.id,
  'boardId': instance.boardId,
  'authorId': instance.authorId,
  'title': instance.title,
  'content': instance.content,
  'imageUrls': instance.imageUrls,
  'imageTypes': instance.imageTypes,
  'replyCount': instance.replyCount,
  'lastReplyAt': instance.lastReplyAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'author': instance.author,
  'reactionSummary': instance.reactionSummary,
  'followed': instance.followed,
};

_ThreadReply _$ThreadReplyFromJson(Map<String, dynamic> json) => _ThreadReply(
  id: (json['id'] as num).toInt(),
  boardId: (json['boardId'] as num).toInt(),
  threadId: (json['threadId'] as num).toInt(),
  authorId: (json['authorId'] as num).toInt(),
  replyNumber: (json['replyNumber'] as num).toInt(),
  content: json['content'] as String,
  imageUrls: (json['imageUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  imageTypes: (json['imageTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  replyCount: (json['replyCount'] as num?)?.toInt(),
  lastReplyAt: json['lastReplyAt'] == null
      ? null
      : DateTime.parse(json['lastReplyAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  author: ThreadAuthor.fromJson(json['author'] as Map<String, dynamic>),
  reactionSummary: (json['reactionSummary'] as List<dynamic>)
      .map((e) => ReactionSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ThreadReplyToJson(_ThreadReply instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boardId': instance.boardId,
      'threadId': instance.threadId,
      'authorId': instance.authorId,
      'replyNumber': instance.replyNumber,
      'content': instance.content,
      'imageUrls': instance.imageUrls,
      'imageTypes': instance.imageTypes,
      'replyCount': instance.replyCount,
      'lastReplyAt': instance.lastReplyAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'author': instance.author,
      'reactionSummary': instance.reactionSummary,
    };
