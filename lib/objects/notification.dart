import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/user.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

/// 通知 1 件。
///
/// **`SYSTEM` 通知には行為者がいない。** `actor` / `actorId` は null で来る。
/// 実際に観測した例:
///
/// ```jsonc
/// {"id": 6288341, "type": "SYSTEM", "groupKey": "SYSTEM:none:...",
///  "message": "まだメール認証が完了していないため投稿できません。...",
///  "actorId": null, "actor": null, "actors": [], "actorCount": 0,
///  "postId": null, "post": null, "posts": [], "postCount": 0}
/// ```
///
/// ここを `required` にしていたせいで、SYSTEM 通知が 1 件混ざるだけで
/// 通知一覧のレスポンス全体が読めなくなっていた（002 design §2 の規則違反）。
/// 存在を確認できていない項目は既定値付きか nullable にすること。
@unfreezed
abstract class Notification with _$Notification {
  factory Notification({
    required int id,
    required DateTime createdAt,
    @JsonKey(unknownEnumValue: NotificationType.UNKNOWN)
    @Default(NotificationType.UNKNOWN)
    NotificationType type,

    /// 行為者。SYSTEM 通知では null。
    Author? actor,
    int? actorId,
    @Default(0) int actorCount,
    @Default([]) List<Author> actors,

    @Default('') String groupKey,
    @Default(false) bool isRead,
    String? message,

    /// サーバーが指定する遷移先。`/legal-quiz` のような Web のパス。
    ///
    /// 観測した SYSTEM 通知には**含まれていなかった**。付く通知があるかは
    /// 未確認だが、Web が最初に見ているので受けられるようにしておく
    /// （[systemNotificationTarget] は無ければ本文の前方一致に落とす）。
    String? route,

    @Default([]) List<int> notificationIds,
    NotificationPost? post,
    @Default(0) int postCount,
    int? postId,
    @Default([]) List<NotificationPost> posts,

    @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)
    @Default(NotificationContext.UNKNOWN)
    NotificationContext likeContext,
    @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)
    @Default(NotificationContext.UNKNOWN)
    NotificationContext rekarotContext,

    @Default(0) int userId,

    /// リアクション通知で届いた絵文字。
    @Default([]) List<String> reactionEmojis,

    /// サブスクリプションギフトの通知に載る。karotator はまだ画面を持たない。
    String? subscriptionGiftId,

    /// コミュニティ関連の通知に載る。同上。
    int? communityId,
  }) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json) =>
      _$NotificationFromJson(json);
}
