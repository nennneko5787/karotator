// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      actor: Author.fromJson(json['actor'] as Map<String, dynamic>),
      actorCount: (json['actorCount'] as num).toInt(),
      actorId: (json['actorId'] as num).toInt(),
      actors: (json['actors'] as List<dynamic>)
          .map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      groupKey: json['groupKey'] as String,
      id: (json['id'] as num).toInt(),
      isRead: json['isRead'] as bool,
      likeContext: $enumDecode(
        _$NotificationContextEnumMap,
        json['likeContext'],
      ),
      message: json['message'] as String?,
      notificationIds: (json['notificationIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      post: json['post'] == null
          ? null
          : NotificationPost.fromJson(json['post'] as Map<String, dynamic>),
      postCount: (json['postCount'] as num).toInt(),
      postId: (json['postId'] as num?)?.toInt(),
      posts: (json['posts'] as List<dynamic>)
          .map((e) => NotificationPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      rekarotContext: $enumDecode(
        _$NotificationContextEnumMap,
        json['rekarotContext'],
      ),
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'actor': instance.actor,
      'actorCount': instance.actorCount,
      'actorId': instance.actorId,
      'actors': instance.actors,
      'createdAt': instance.createdAt.toIso8601String(),
      'groupKey': instance.groupKey,
      'id': instance.id,
      'isRead': instance.isRead,
      'likeContext': _$NotificationContextEnumMap[instance.likeContext]!,
      'message': instance.message,
      'notificationIds': instance.notificationIds,
      'post': instance.post,
      'postCount': instance.postCount,
      'postId': instance.postId,
      'posts': instance.posts,
      'rekarotContext': _$NotificationContextEnumMap[instance.rekarotContext]!,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'userId': instance.userId,
    };

const _$NotificationContextEnumMap = {
  NotificationContext.OWN_POST: 'OWN_POST',
  NotificationContext.OTHER: 'OTHER',
};

const _$NotificationTypeEnumMap = {
  NotificationType.LIKE: 'LIKE',
  NotificationType.FOLLOW: 'FOLLOW',
  NotificationType.QUOTE: 'QUOTE',
  NotificationType.REPLY: 'REPLY',
  NotificationType.REACTION: 'REACTION',
  NotificationType.REKAROT: 'REKAROT',
};
