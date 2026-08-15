// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Notification {

 int get id; set id(int value); DateTime get createdAt; set createdAt(DateTime value);@JsonKey(unknownEnumValue: NotificationType.UNKNOWN) NotificationType get type;@JsonKey(unknownEnumValue: NotificationType.UNKNOWN) set type(NotificationType value);/// 行為者。SYSTEM 通知では null。
 Author? get actor;/// 行為者。SYSTEM 通知では null。
 set actor(Author? value); int? get actorId; set actorId(int? value); int get actorCount; set actorCount(int value); List<Author> get actors; set actors(List<Author> value); String get groupKey; set groupKey(String value); bool get isRead; set isRead(bool value); String? get message; set message(String? value);/// サーバーが指定する遷移先。`/legal-quiz` のような Web のパス。
///
/// 観測した SYSTEM 通知には**含まれていなかった**。付く通知があるかは
/// 未確認だが、Web が最初に見ているので受けられるようにしておく
/// （[systemNotificationTarget] は無ければ本文の前方一致に落とす）。
 String? get route;/// サーバーが指定する遷移先。`/legal-quiz` のような Web のパス。
///
/// 観測した SYSTEM 通知には**含まれていなかった**。付く通知があるかは
/// 未確認だが、Web が最初に見ているので受けられるようにしておく
/// （[systemNotificationTarget] は無ければ本文の前方一致に落とす）。
 set route(String? value); List<int> get notificationIds; set notificationIds(List<int> value); NotificationPost? get post; set post(NotificationPost? value); int get postCount; set postCount(int value); int? get postId; set postId(int? value); List<NotificationPost> get posts; set posts(List<NotificationPost> value);@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) NotificationContext get likeContext;@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) set likeContext(NotificationContext value);@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) NotificationContext get rekarotContext;@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) set rekarotContext(NotificationContext value); int get userId; set userId(int value);/// リアクション通知で届いた絵文字。
 List<String> get reactionEmojis;/// リアクション通知で届いた絵文字。
 set reactionEmojis(List<String> value);/// サブスクリプションギフトの通知に載る。karotator はまだ画面を持たない。
 String? get subscriptionGiftId;/// サブスクリプションギフトの通知に載る。karotator はまだ画面を持たない。
 set subscriptionGiftId(String? value);/// コミュニティ関連の通知に載る。同上。
 int? get communityId;/// コミュニティ関連の通知に載る。同上。
 set communityId(int? value);
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCopyWith<Notification> get copyWith => _$NotificationCopyWithImpl<Notification>(this as Notification, _$identity);

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'Notification(id: $id, createdAt: $createdAt, type: $type, actor: $actor, actorId: $actorId, actorCount: $actorCount, actors: $actors, groupKey: $groupKey, isRead: $isRead, message: $message, route: $route, notificationIds: $notificationIds, post: $post, postCount: $postCount, postId: $postId, posts: $posts, likeContext: $likeContext, rekarotContext: $rekarotContext, userId: $userId, reactionEmojis: $reactionEmojis, subscriptionGiftId: $subscriptionGiftId, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class $NotificationCopyWith<$Res>  {
  factory $NotificationCopyWith(Notification value, $Res Function(Notification) _then) = _$NotificationCopyWithImpl;
@useResult
$Res call({
 int id, DateTime createdAt,@JsonKey(unknownEnumValue: NotificationType.UNKNOWN) NotificationType type, Author? actor, int? actorId, int actorCount, List<Author> actors, String groupKey, bool isRead, String? message, String? route, List<int> notificationIds, NotificationPost? post, int postCount, int? postId, List<NotificationPost> posts,@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) NotificationContext likeContext,@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) NotificationContext rekarotContext, int userId, List<String> reactionEmojis, String? subscriptionGiftId, int? communityId
});


$AuthorCopyWith<$Res>? get actor;$NotificationPostCopyWith<$Res>? get post;

}
/// @nodoc
class _$NotificationCopyWithImpl<$Res>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._self, this._then);

  final Notification _self;
  final $Res Function(Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? type = null,Object? actor = freezed,Object? actorId = freezed,Object? actorCount = null,Object? actors = null,Object? groupKey = null,Object? isRead = null,Object? message = freezed,Object? route = freezed,Object? notificationIds = null,Object? post = freezed,Object? postCount = null,Object? postId = freezed,Object? posts = null,Object? likeContext = null,Object? rekarotContext = null,Object? userId = null,Object? reactionEmojis = null,Object? subscriptionGiftId = freezed,Object? communityId = freezed,}) {
  return _then(Notification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as Author?,actorId: freezed == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int?,actorCount: null == actorCount ? _self.actorCount : actorCount // ignore: cast_nullable_to_non_nullable
as int,actors: null == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<Author>,groupKey: null == groupKey ? _self.groupKey : groupKey // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,route: freezed == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String?,notificationIds: null == notificationIds ? _self.notificationIds : notificationIds // ignore: cast_nullable_to_non_nullable
as List<int>,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as NotificationPost?,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int?,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<NotificationPost>,likeContext: null == likeContext ? _self.likeContext : likeContext // ignore: cast_nullable_to_non_nullable
as NotificationContext,rekarotContext: null == rekarotContext ? _self.rekarotContext : rekarotContext // ignore: cast_nullable_to_non_nullable
as NotificationContext,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,reactionEmojis: null == reactionEmojis ? _self.reactionEmojis : reactionEmojis // ignore: cast_nullable_to_non_nullable
as List<String>,subscriptionGiftId: freezed == subscriptionGiftId ? _self.subscriptionGiftId : subscriptionGiftId // ignore: cast_nullable_to_non_nullable
as String?,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res>? get actor {
    if (_self.actor == null) {
    return null;
  }

  return $AuthorCopyWith<$Res>(_self.actor!, (value) {
    return _then(_self.copyWith(actor: value));
  });
}/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationPostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $NotificationPostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// Adds pattern-matching-related methods to [Notification].
extension NotificationPatterns on Notification {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Notification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Notification value)  $default,){
final _that = this;
switch (_that) {
case _Notification():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Notification value)?  $default,){
final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime createdAt, @JsonKey(unknownEnumValue: NotificationType.UNKNOWN)  NotificationType type,  Author? actor,  int? actorId,  int actorCount,  List<Author> actors,  String groupKey,  bool isRead,  String? message,  String? route,  List<int> notificationIds,  NotificationPost? post,  int postCount,  int? postId,  List<NotificationPost> posts, @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)  NotificationContext likeContext, @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)  NotificationContext rekarotContext,  int userId,  List<String> reactionEmojis,  String? subscriptionGiftId,  int? communityId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.id,_that.createdAt,_that.type,_that.actor,_that.actorId,_that.actorCount,_that.actors,_that.groupKey,_that.isRead,_that.message,_that.route,_that.notificationIds,_that.post,_that.postCount,_that.postId,_that.posts,_that.likeContext,_that.rekarotContext,_that.userId,_that.reactionEmojis,_that.subscriptionGiftId,_that.communityId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime createdAt, @JsonKey(unknownEnumValue: NotificationType.UNKNOWN)  NotificationType type,  Author? actor,  int? actorId,  int actorCount,  List<Author> actors,  String groupKey,  bool isRead,  String? message,  String? route,  List<int> notificationIds,  NotificationPost? post,  int postCount,  int? postId,  List<NotificationPost> posts, @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)  NotificationContext likeContext, @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)  NotificationContext rekarotContext,  int userId,  List<String> reactionEmojis,  String? subscriptionGiftId,  int? communityId)  $default,) {final _that = this;
switch (_that) {
case _Notification():
return $default(_that.id,_that.createdAt,_that.type,_that.actor,_that.actorId,_that.actorCount,_that.actors,_that.groupKey,_that.isRead,_that.message,_that.route,_that.notificationIds,_that.post,_that.postCount,_that.postId,_that.posts,_that.likeContext,_that.rekarotContext,_that.userId,_that.reactionEmojis,_that.subscriptionGiftId,_that.communityId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime createdAt, @JsonKey(unknownEnumValue: NotificationType.UNKNOWN)  NotificationType type,  Author? actor,  int? actorId,  int actorCount,  List<Author> actors,  String groupKey,  bool isRead,  String? message,  String? route,  List<int> notificationIds,  NotificationPost? post,  int postCount,  int? postId,  List<NotificationPost> posts, @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)  NotificationContext likeContext, @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)  NotificationContext rekarotContext,  int userId,  List<String> reactionEmojis,  String? subscriptionGiftId,  int? communityId)?  $default,) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.id,_that.createdAt,_that.type,_that.actor,_that.actorId,_that.actorCount,_that.actors,_that.groupKey,_that.isRead,_that.message,_that.route,_that.notificationIds,_that.post,_that.postCount,_that.postId,_that.posts,_that.likeContext,_that.rekarotContext,_that.userId,_that.reactionEmojis,_that.subscriptionGiftId,_that.communityId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Notification implements Notification {
   _Notification({required this.id, required this.createdAt, @JsonKey(unknownEnumValue: NotificationType.UNKNOWN) this.type = NotificationType.UNKNOWN, this.actor, this.actorId, this.actorCount = 0, this.actors = const [], this.groupKey = '', this.isRead = false, this.message, this.route, this.notificationIds = const [], this.post, this.postCount = 0, this.postId, this.posts = const [], @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) this.likeContext = NotificationContext.UNKNOWN, @JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) this.rekarotContext = NotificationContext.UNKNOWN, this.userId = 0, this.reactionEmojis = const [], this.subscriptionGiftId, this.communityId});
  factory _Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

@override  int id;
@override  DateTime createdAt;
@override@JsonKey(unknownEnumValue: NotificationType.UNKNOWN)  NotificationType type;
/// 行為者。SYSTEM 通知では null。
@override  Author? actor;
@override  int? actorId;
@override@JsonKey()  int actorCount;
@override@JsonKey()  List<Author> actors;
@override@JsonKey()  String groupKey;
@override@JsonKey()  bool isRead;
@override  String? message;
/// サーバーが指定する遷移先。`/legal-quiz` のような Web のパス。
///
/// 観測した SYSTEM 通知には**含まれていなかった**。付く通知があるかは
/// 未確認だが、Web が最初に見ているので受けられるようにしておく
/// （[systemNotificationTarget] は無ければ本文の前方一致に落とす）。
@override  String? route;
@override@JsonKey()  List<int> notificationIds;
@override  NotificationPost? post;
@override@JsonKey()  int postCount;
@override  int? postId;
@override@JsonKey()  List<NotificationPost> posts;
@override@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)  NotificationContext likeContext;
@override@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN)  NotificationContext rekarotContext;
@override@JsonKey()  int userId;
/// リアクション通知で届いた絵文字。
@override@JsonKey()  List<String> reactionEmojis;
/// サブスクリプションギフトの通知に載る。karotator はまだ画面を持たない。
@override  String? subscriptionGiftId;
/// コミュニティ関連の通知に載る。同上。
@override  int? communityId;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationCopyWith<_Notification> get copyWith => __$NotificationCopyWithImpl<_Notification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationToJson(this, );
}



@override
String toString() {
  return 'Notification(id: $id, createdAt: $createdAt, type: $type, actor: $actor, actorId: $actorId, actorCount: $actorCount, actors: $actors, groupKey: $groupKey, isRead: $isRead, message: $message, route: $route, notificationIds: $notificationIds, post: $post, postCount: $postCount, postId: $postId, posts: $posts, likeContext: $likeContext, rekarotContext: $rekarotContext, userId: $userId, reactionEmojis: $reactionEmojis, subscriptionGiftId: $subscriptionGiftId, communityId: $communityId)';
}


}

/// @nodoc
abstract mixin class _$NotificationCopyWith<$Res> implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(_Notification value, $Res Function(_Notification) _then) = __$NotificationCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime createdAt,@JsonKey(unknownEnumValue: NotificationType.UNKNOWN) NotificationType type, Author? actor, int? actorId, int actorCount, List<Author> actors, String groupKey, bool isRead, String? message, String? route, List<int> notificationIds, NotificationPost? post, int postCount, int? postId, List<NotificationPost> posts,@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) NotificationContext likeContext,@JsonKey(unknownEnumValue: NotificationContext.UNKNOWN) NotificationContext rekarotContext, int userId, List<String> reactionEmojis, String? subscriptionGiftId, int? communityId
});


@override $AuthorCopyWith<$Res>? get actor;@override $NotificationPostCopyWith<$Res>? get post;

}
/// @nodoc
class __$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(this._self, this._then);

  final _Notification _self;
  final $Res Function(_Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? type = null,Object? actor = freezed,Object? actorId = freezed,Object? actorCount = null,Object? actors = null,Object? groupKey = null,Object? isRead = null,Object? message = freezed,Object? route = freezed,Object? notificationIds = null,Object? post = freezed,Object? postCount = null,Object? postId = freezed,Object? posts = null,Object? likeContext = null,Object? rekarotContext = null,Object? userId = null,Object? reactionEmojis = null,Object? subscriptionGiftId = freezed,Object? communityId = freezed,}) {
  return _then(_Notification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as Author?,actorId: freezed == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int?,actorCount: null == actorCount ? _self.actorCount : actorCount // ignore: cast_nullable_to_non_nullable
as int,actors: null == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<Author>,groupKey: null == groupKey ? _self.groupKey : groupKey // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,route: freezed == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String?,notificationIds: null == notificationIds ? _self.notificationIds : notificationIds // ignore: cast_nullable_to_non_nullable
as List<int>,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as NotificationPost?,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int?,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<NotificationPost>,likeContext: null == likeContext ? _self.likeContext : likeContext // ignore: cast_nullable_to_non_nullable
as NotificationContext,rekarotContext: null == rekarotContext ? _self.rekarotContext : rekarotContext // ignore: cast_nullable_to_non_nullable
as NotificationContext,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,reactionEmojis: null == reactionEmojis ? _self.reactionEmojis : reactionEmojis // ignore: cast_nullable_to_non_nullable
as List<String>,subscriptionGiftId: freezed == subscriptionGiftId ? _self.subscriptionGiftId : subscriptionGiftId // ignore: cast_nullable_to_non_nullable
as String?,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res>? get actor {
    if (_self.actor == null) {
    return null;
  }

  return $AuthorCopyWith<$Res>(_self.actor!, (value) {
    return _then(_self.copyWith(actor: value));
  });
}/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationPostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $NotificationPostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
