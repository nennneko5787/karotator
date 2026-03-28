// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Notification {

 Author get actor; set actor(Author value); int get actorCount; set actorCount(int value); int get actorId; set actorId(int value); List<Author> get actors; set actors(List<Author> value); DateTime get createdAt; set createdAt(DateTime value); String get groupKey; set groupKey(String value); int get id; set id(int value); bool get isRead; set isRead(bool value); NotificationContext get likeContext; set likeContext(NotificationContext value); String? get message; set message(String? value); List<int> get notificationIds; set notificationIds(List<int> value); NotificationPost? get post; set post(NotificationPost? value); int get postCount; set postCount(int value); int? get postId; set postId(int? value); List<NotificationPost> get posts; set posts(List<NotificationPost> value); NotificationContext get rekarotContext; set rekarotContext(NotificationContext value); NotificationType get type; set type(NotificationType value); int get userId; set userId(int value);
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCopyWith<Notification> get copyWith => _$NotificationCopyWithImpl<Notification>(this as Notification, _$identity);

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'Notification(actor: $actor, actorCount: $actorCount, actorId: $actorId, actors: $actors, createdAt: $createdAt, groupKey: $groupKey, id: $id, isRead: $isRead, likeContext: $likeContext, message: $message, notificationIds: $notificationIds, post: $post, postCount: $postCount, postId: $postId, posts: $posts, rekarotContext: $rekarotContext, type: $type, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $NotificationCopyWith<$Res>  {
  factory $NotificationCopyWith(Notification value, $Res Function(Notification) _then) = _$NotificationCopyWithImpl;
@useResult
$Res call({
 Author actor, int actorCount, int actorId, List<Author> actors, DateTime createdAt, String groupKey, int id, bool isRead, NotificationContext likeContext, String? message, List<int> notificationIds, NotificationPost? post, int postCount, int? postId, List<NotificationPost> posts, NotificationContext rekarotContext, NotificationType type, int userId
});


$AuthorCopyWith<$Res> get actor;$NotificationPostCopyWith<$Res>? get post;

}
/// @nodoc
class _$NotificationCopyWithImpl<$Res>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._self, this._then);

  final Notification _self;
  final $Res Function(Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? actor = null,Object? actorCount = null,Object? actorId = null,Object? actors = null,Object? createdAt = null,Object? groupKey = null,Object? id = null,Object? isRead = null,Object? likeContext = null,Object? message = freezed,Object? notificationIds = null,Object? post = freezed,Object? postCount = null,Object? postId = freezed,Object? posts = null,Object? rekarotContext = null,Object? type = null,Object? userId = null,}) {
  return _then(_self.copyWith(
actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as Author,actorCount: null == actorCount ? _self.actorCount : actorCount // ignore: cast_nullable_to_non_nullable
as int,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int,actors: null == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<Author>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,groupKey: null == groupKey ? _self.groupKey : groupKey // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,likeContext: null == likeContext ? _self.likeContext : likeContext // ignore: cast_nullable_to_non_nullable
as NotificationContext,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,notificationIds: null == notificationIds ? _self.notificationIds : notificationIds // ignore: cast_nullable_to_non_nullable
as List<int>,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as NotificationPost?,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int?,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<NotificationPost>,rekarotContext: null == rekarotContext ? _self.rekarotContext : rekarotContext // ignore: cast_nullable_to_non_nullable
as NotificationContext,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get actor {
  
  return $AuthorCopyWith<$Res>(_self.actor, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Author actor,  int actorCount,  int actorId,  List<Author> actors,  DateTime createdAt,  String groupKey,  int id,  bool isRead,  NotificationContext likeContext,  String? message,  List<int> notificationIds,  NotificationPost? post,  int postCount,  int? postId,  List<NotificationPost> posts,  NotificationContext rekarotContext,  NotificationType type,  int userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.actor,_that.actorCount,_that.actorId,_that.actors,_that.createdAt,_that.groupKey,_that.id,_that.isRead,_that.likeContext,_that.message,_that.notificationIds,_that.post,_that.postCount,_that.postId,_that.posts,_that.rekarotContext,_that.type,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Author actor,  int actorCount,  int actorId,  List<Author> actors,  DateTime createdAt,  String groupKey,  int id,  bool isRead,  NotificationContext likeContext,  String? message,  List<int> notificationIds,  NotificationPost? post,  int postCount,  int? postId,  List<NotificationPost> posts,  NotificationContext rekarotContext,  NotificationType type,  int userId)  $default,) {final _that = this;
switch (_that) {
case _Notification():
return $default(_that.actor,_that.actorCount,_that.actorId,_that.actors,_that.createdAt,_that.groupKey,_that.id,_that.isRead,_that.likeContext,_that.message,_that.notificationIds,_that.post,_that.postCount,_that.postId,_that.posts,_that.rekarotContext,_that.type,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Author actor,  int actorCount,  int actorId,  List<Author> actors,  DateTime createdAt,  String groupKey,  int id,  bool isRead,  NotificationContext likeContext,  String? message,  List<int> notificationIds,  NotificationPost? post,  int postCount,  int? postId,  List<NotificationPost> posts,  NotificationContext rekarotContext,  NotificationType type,  int userId)?  $default,) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.actor,_that.actorCount,_that.actorId,_that.actors,_that.createdAt,_that.groupKey,_that.id,_that.isRead,_that.likeContext,_that.message,_that.notificationIds,_that.post,_that.postCount,_that.postId,_that.posts,_that.rekarotContext,_that.type,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Notification implements Notification {
   _Notification({required this.actor, required this.actorCount, required this.actorId, required this.actors, required this.createdAt, required this.groupKey, required this.id, required this.isRead, required this.likeContext, this.message, required this.notificationIds, this.post, required this.postCount, this.postId, required this.posts, required this.rekarotContext, required this.type, required this.userId});
  factory _Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

@override  Author actor;
@override  int actorCount;
@override  int actorId;
@override  List<Author> actors;
@override  DateTime createdAt;
@override  String groupKey;
@override  int id;
@override  bool isRead;
@override  NotificationContext likeContext;
@override  String? message;
@override  List<int> notificationIds;
@override  NotificationPost? post;
@override  int postCount;
@override  int? postId;
@override  List<NotificationPost> posts;
@override  NotificationContext rekarotContext;
@override  NotificationType type;
@override  int userId;

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
  return 'Notification(actor: $actor, actorCount: $actorCount, actorId: $actorId, actors: $actors, createdAt: $createdAt, groupKey: $groupKey, id: $id, isRead: $isRead, likeContext: $likeContext, message: $message, notificationIds: $notificationIds, post: $post, postCount: $postCount, postId: $postId, posts: $posts, rekarotContext: $rekarotContext, type: $type, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$NotificationCopyWith<$Res> implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(_Notification value, $Res Function(_Notification) _then) = __$NotificationCopyWithImpl;
@override @useResult
$Res call({
 Author actor, int actorCount, int actorId, List<Author> actors, DateTime createdAt, String groupKey, int id, bool isRead, NotificationContext likeContext, String? message, List<int> notificationIds, NotificationPost? post, int postCount, int? postId, List<NotificationPost> posts, NotificationContext rekarotContext, NotificationType type, int userId
});


@override $AuthorCopyWith<$Res> get actor;@override $NotificationPostCopyWith<$Res>? get post;

}
/// @nodoc
class __$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(this._self, this._then);

  final _Notification _self;
  final $Res Function(_Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? actor = null,Object? actorCount = null,Object? actorId = null,Object? actors = null,Object? createdAt = null,Object? groupKey = null,Object? id = null,Object? isRead = null,Object? likeContext = null,Object? message = freezed,Object? notificationIds = null,Object? post = freezed,Object? postCount = null,Object? postId = freezed,Object? posts = null,Object? rekarotContext = null,Object? type = null,Object? userId = null,}) {
  return _then(_Notification(
actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as Author,actorCount: null == actorCount ? _self.actorCount : actorCount // ignore: cast_nullable_to_non_nullable
as int,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int,actors: null == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<Author>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,groupKey: null == groupKey ? _self.groupKey : groupKey // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,likeContext: null == likeContext ? _self.likeContext : likeContext // ignore: cast_nullable_to_non_nullable
as NotificationContext,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,notificationIds: null == notificationIds ? _self.notificationIds : notificationIds // ignore: cast_nullable_to_non_nullable
as List<int>,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as NotificationPost?,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int?,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<NotificationPost>,rekarotContext: null == rekarotContext ? _self.rekarotContext : rekarotContext // ignore: cast_nullable_to_non_nullable
as NotificationContext,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get actor {
  
  return $AuthorCopyWith<$Res>(_self.actor, (value) {
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
