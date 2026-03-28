import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/user.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@unfreezed
abstract class Notification with _$Notification {
  factory Notification({
    required Author actor,
    required int actorCount,
    required int actorId,
    required List<Author> actors,
    required DateTime createdAt,
    required String groupKey,
    required int id,
    required bool isRead,
    required NotificationContext likeContext,
    String? message,
    required List<int> notificationIds,
    NotificationPost? post,
    required int postCount,
    int? postId,
    required List<NotificationPost> posts,
    required NotificationContext rekarotContext,
    required NotificationType type,
    required int userId,
  }) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json) =>
      _$NotificationFromJson(json);
}
