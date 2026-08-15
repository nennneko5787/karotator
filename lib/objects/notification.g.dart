// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      type:
          $enumDecodeNullable(
            _$NotificationTypeEnumMap,
            json['type'],
            unknownValue: NotificationType.UNKNOWN,
          ) ??
          NotificationType.UNKNOWN,
      actor: json['actor'] == null
          ? null
          : Author.fromJson(json['actor'] as Map<String, dynamic>),
      actorId: (json['actorId'] as num?)?.toInt(),
      actorCount: (json['actorCount'] as num?)?.toInt() ?? 0,
      actors:
          (json['actors'] as List<dynamic>?)
              ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      groupKey: json['groupKey'] as String? ?? '',
      isRead: json['isRead'] as bool? ?? false,
      message: json['message'] as String?,
      route: json['route'] as String?,
      notificationIds:
          (json['notificationIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      post: json['post'] == null
          ? null
          : NotificationPost.fromJson(json['post'] as Map<String, dynamic>),
      postCount: (json['postCount'] as num?)?.toInt() ?? 0,
      postId: (json['postId'] as num?)?.toInt(),
      posts:
          (json['posts'] as List<dynamic>?)
              ?.map((e) => NotificationPost.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      likeContext:
          $enumDecodeNullable(
            _$NotificationContextEnumMap,
            json['likeContext'],
            unknownValue: NotificationContext.UNKNOWN,
          ) ??
          NotificationContext.UNKNOWN,
      rekarotContext:
          $enumDecodeNullable(
            _$NotificationContextEnumMap,
            json['rekarotContext'],
            unknownValue: NotificationContext.UNKNOWN,
          ) ??
          NotificationContext.UNKNOWN,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      reactionEmojis:
          (json['reactionEmojis'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subscriptionGiftId: json['subscriptionGiftId'] as String?,
      communityId: (json['communityId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'actor': instance.actor,
      'actorId': instance.actorId,
      'actorCount': instance.actorCount,
      'actors': instance.actors,
      'groupKey': instance.groupKey,
      'isRead': instance.isRead,
      'message': instance.message,
      'route': instance.route,
      'notificationIds': instance.notificationIds,
      'post': instance.post,
      'postCount': instance.postCount,
      'postId': instance.postId,
      'posts': instance.posts,
      'likeContext': _$NotificationContextEnumMap[instance.likeContext]!,
      'rekarotContext': _$NotificationContextEnumMap[instance.rekarotContext]!,
      'userId': instance.userId,
      'reactionEmojis': instance.reactionEmojis,
      'subscriptionGiftId': instance.subscriptionGiftId,
      'communityId': instance.communityId,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.LIKE: 'LIKE',
  NotificationType.REPLY: 'REPLY',
  NotificationType.REKAROT: 'REKAROT',
  NotificationType.QUOTE: 'QUOTE',
  NotificationType.MENTION: 'MENTION',
  NotificationType.REACTION: 'REACTION',
  NotificationType.FOLLOW: 'FOLLOW',
  NotificationType.FOLLOW_REQUEST: 'FOLLOW_REQUEST',
  NotificationType.FOLLOWED_POST: 'FOLLOWED_POST',
  NotificationType.DM: 'DM',
  NotificationType.BOARD_NEW_THREAD: 'BOARD_NEW_THREAD',
  NotificationType.BOARD_THREAD_REPLY: 'BOARD_THREAD_REPLY',
  NotificationType.COMMUNITY_INVITE: 'COMMUNITY_INVITE',
  NotificationType.COMMUNITY_JOIN: 'COMMUNITY_JOIN',
  NotificationType.COMMUNITY_REMOVAL: 'COMMUNITY_REMOVAL',
  NotificationType.REPORT_UPDATE: 'REPORT_UPDATE',
  NotificationType.SYSTEM: 'SYSTEM',
  NotificationType.UNKNOWN: 'UNKNOWN',
};

const _$NotificationContextEnumMap = {
  NotificationContext.OWN_POST: 'OWN_POST',
  NotificationContext.OTHER: 'OTHER',
  NotificationContext.UNKNOWN: 'UNKNOWN',
};
