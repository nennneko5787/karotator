// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardCreator {

 int get id; String get username; String get displayName;
/// Create a copy of BoardCreator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardCreatorCopyWith<BoardCreator> get copyWith => _$BoardCreatorCopyWithImpl<BoardCreator>(this as BoardCreator, _$identity);

  /// Serializes this BoardCreator to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardCreator&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName);

@override
String toString() {
  return 'BoardCreator(id: $id, username: $username, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $BoardCreatorCopyWith<$Res>  {
  factory $BoardCreatorCopyWith(BoardCreator value, $Res Function(BoardCreator) _then) = _$BoardCreatorCopyWithImpl;
@useResult
$Res call({
 int id, String username, String displayName
});




}
/// @nodoc
class _$BoardCreatorCopyWithImpl<$Res>
    implements $BoardCreatorCopyWith<$Res> {
  _$BoardCreatorCopyWithImpl(this._self, this._then);

  final BoardCreator _self;
  final $Res Function(BoardCreator) _then;

/// Create a copy of BoardCreator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? displayName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardCreator].
extension BoardCreatorPatterns on BoardCreator {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardCreator value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardCreator() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardCreator value)  $default,){
final _that = this;
switch (_that) {
case _BoardCreator():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardCreator value)?  $default,){
final _that = this;
switch (_that) {
case _BoardCreator() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardCreator() when $default != null:
return $default(_that.id,_that.username,_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String displayName)  $default,) {final _that = this;
switch (_that) {
case _BoardCreator():
return $default(_that.id,_that.username,_that.displayName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String displayName)?  $default,) {final _that = this;
switch (_that) {
case _BoardCreator() when $default != null:
return $default(_that.id,_that.username,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoardCreator implements BoardCreator {
  const _BoardCreator({required this.id, required this.username, required this.displayName});
  factory _BoardCreator.fromJson(Map<String, dynamic> json) => _$BoardCreatorFromJson(json);

@override final  int id;
@override final  String username;
@override final  String displayName;

/// Create a copy of BoardCreator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardCreatorCopyWith<_BoardCreator> get copyWith => __$BoardCreatorCopyWithImpl<_BoardCreator>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardCreatorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardCreator&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName);

@override
String toString() {
  return 'BoardCreator(id: $id, username: $username, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$BoardCreatorCopyWith<$Res> implements $BoardCreatorCopyWith<$Res> {
  factory _$BoardCreatorCopyWith(_BoardCreator value, $Res Function(_BoardCreator) _then) = __$BoardCreatorCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String displayName
});




}
/// @nodoc
class __$BoardCreatorCopyWithImpl<$Res>
    implements _$BoardCreatorCopyWith<$Res> {
  __$BoardCreatorCopyWithImpl(this._self, this._then);

  final _BoardCreator _self;
  final $Res Function(_BoardCreator) _then;

/// Create a copy of BoardCreator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? displayName = null,}) {
  return _then(_BoardCreator(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Board {

 int get id; String get slug; String get title; String? get description; int get minimumAge; int get threadCount; int get replyCount; DateTime get lastPostAt; DateTime get createdAt; BoardCreator get creator; bool get followed;
/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardCopyWith<Board> get copyWith => _$BoardCopyWithImpl<Board>(this as Board, _$identity);

  /// Serializes this Board to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Board&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.minimumAge, minimumAge) || other.minimumAge == minimumAge)&&(identical(other.threadCount, threadCount) || other.threadCount == threadCount)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.lastPostAt, lastPostAt) || other.lastPostAt == lastPostAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.followed, followed) || other.followed == followed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,minimumAge,threadCount,replyCount,lastPostAt,createdAt,creator,followed);

@override
String toString() {
  return 'Board(id: $id, slug: $slug, title: $title, description: $description, minimumAge: $minimumAge, threadCount: $threadCount, replyCount: $replyCount, lastPostAt: $lastPostAt, createdAt: $createdAt, creator: $creator, followed: $followed)';
}


}

/// @nodoc
abstract mixin class $BoardCopyWith<$Res>  {
  factory $BoardCopyWith(Board value, $Res Function(Board) _then) = _$BoardCopyWithImpl;
@useResult
$Res call({
 int id, String slug, String title, String? description, int minimumAge, int threadCount, int replyCount, DateTime lastPostAt, DateTime createdAt, BoardCreator creator, bool followed
});


$BoardCreatorCopyWith<$Res> get creator;

}
/// @nodoc
class _$BoardCopyWithImpl<$Res>
    implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._self, this._then);

  final Board _self;
  final $Res Function(Board) _then;

/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? title = null,Object? description = freezed,Object? minimumAge = null,Object? threadCount = null,Object? replyCount = null,Object? lastPostAt = null,Object? createdAt = null,Object? creator = null,Object? followed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,minimumAge: null == minimumAge ? _self.minimumAge : minimumAge // ignore: cast_nullable_to_non_nullable
as int,threadCount: null == threadCount ? _self.threadCount : threadCount // ignore: cast_nullable_to_non_nullable
as int,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,lastPostAt: null == lastPostAt ? _self.lastPostAt : lastPostAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as BoardCreator,followed: null == followed ? _self.followed : followed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCreatorCopyWith<$Res> get creator {
  
  return $BoardCreatorCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// Adds pattern-matching-related methods to [Board].
extension BoardPatterns on Board {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Board value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Board() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Board value)  $default,){
final _that = this;
switch (_that) {
case _Board():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Board value)?  $default,){
final _that = this;
switch (_that) {
case _Board() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slug,  String title,  String? description,  int minimumAge,  int threadCount,  int replyCount,  DateTime lastPostAt,  DateTime createdAt,  BoardCreator creator,  bool followed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Board() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.minimumAge,_that.threadCount,_that.replyCount,_that.lastPostAt,_that.createdAt,_that.creator,_that.followed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slug,  String title,  String? description,  int minimumAge,  int threadCount,  int replyCount,  DateTime lastPostAt,  DateTime createdAt,  BoardCreator creator,  bool followed)  $default,) {final _that = this;
switch (_that) {
case _Board():
return $default(_that.id,_that.slug,_that.title,_that.description,_that.minimumAge,_that.threadCount,_that.replyCount,_that.lastPostAt,_that.createdAt,_that.creator,_that.followed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slug,  String title,  String? description,  int minimumAge,  int threadCount,  int replyCount,  DateTime lastPostAt,  DateTime createdAt,  BoardCreator creator,  bool followed)?  $default,) {final _that = this;
switch (_that) {
case _Board() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.minimumAge,_that.threadCount,_that.replyCount,_that.lastPostAt,_that.createdAt,_that.creator,_that.followed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Board implements Board {
  const _Board({required this.id, required this.slug, required this.title, this.description, required this.minimumAge, required this.threadCount, required this.replyCount, required this.lastPostAt, required this.createdAt, required this.creator, required this.followed});
  factory _Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

@override final  int id;
@override final  String slug;
@override final  String title;
@override final  String? description;
@override final  int minimumAge;
@override final  int threadCount;
@override final  int replyCount;
@override final  DateTime lastPostAt;
@override final  DateTime createdAt;
@override final  BoardCreator creator;
@override final  bool followed;

/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardCopyWith<_Board> get copyWith => __$BoardCopyWithImpl<_Board>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Board&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.minimumAge, minimumAge) || other.minimumAge == minimumAge)&&(identical(other.threadCount, threadCount) || other.threadCount == threadCount)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.lastPostAt, lastPostAt) || other.lastPostAt == lastPostAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.followed, followed) || other.followed == followed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,minimumAge,threadCount,replyCount,lastPostAt,createdAt,creator,followed);

@override
String toString() {
  return 'Board(id: $id, slug: $slug, title: $title, description: $description, minimumAge: $minimumAge, threadCount: $threadCount, replyCount: $replyCount, lastPostAt: $lastPostAt, createdAt: $createdAt, creator: $creator, followed: $followed)';
}


}

/// @nodoc
abstract mixin class _$BoardCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$BoardCopyWith(_Board value, $Res Function(_Board) _then) = __$BoardCopyWithImpl;
@override @useResult
$Res call({
 int id, String slug, String title, String? description, int minimumAge, int threadCount, int replyCount, DateTime lastPostAt, DateTime createdAt, BoardCreator creator, bool followed
});


@override $BoardCreatorCopyWith<$Res> get creator;

}
/// @nodoc
class __$BoardCopyWithImpl<$Res>
    implements _$BoardCopyWith<$Res> {
  __$BoardCopyWithImpl(this._self, this._then);

  final _Board _self;
  final $Res Function(_Board) _then;

/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? title = null,Object? description = freezed,Object? minimumAge = null,Object? threadCount = null,Object? replyCount = null,Object? lastPostAt = null,Object? createdAt = null,Object? creator = null,Object? followed = null,}) {
  return _then(_Board(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,minimumAge: null == minimumAge ? _self.minimumAge : minimumAge // ignore: cast_nullable_to_non_nullable
as int,threadCount: null == threadCount ? _self.threadCount : threadCount // ignore: cast_nullable_to_non_nullable
as int,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,lastPostAt: null == lastPostAt ? _self.lastPostAt : lastPostAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as BoardCreator,followed: null == followed ? _self.followed : followed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCreatorCopyWith<$Res> get creator {
  
  return $BoardCreatorCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// @nodoc
mixin _$ThreadAuthor {

 int get id; String get username; String get displayName;
/// Create a copy of ThreadAuthor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadAuthorCopyWith<ThreadAuthor> get copyWith => _$ThreadAuthorCopyWithImpl<ThreadAuthor>(this as ThreadAuthor, _$identity);

  /// Serializes this ThreadAuthor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadAuthor&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName);

@override
String toString() {
  return 'ThreadAuthor(id: $id, username: $username, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $ThreadAuthorCopyWith<$Res>  {
  factory $ThreadAuthorCopyWith(ThreadAuthor value, $Res Function(ThreadAuthor) _then) = _$ThreadAuthorCopyWithImpl;
@useResult
$Res call({
 int id, String username, String displayName
});




}
/// @nodoc
class _$ThreadAuthorCopyWithImpl<$Res>
    implements $ThreadAuthorCopyWith<$Res> {
  _$ThreadAuthorCopyWithImpl(this._self, this._then);

  final ThreadAuthor _self;
  final $Res Function(ThreadAuthor) _then;

/// Create a copy of ThreadAuthor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? displayName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ThreadAuthor].
extension ThreadAuthorPatterns on ThreadAuthor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadAuthor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadAuthor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadAuthor value)  $default,){
final _that = this;
switch (_that) {
case _ThreadAuthor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadAuthor value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadAuthor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadAuthor() when $default != null:
return $default(_that.id,_that.username,_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String displayName)  $default,) {final _that = this;
switch (_that) {
case _ThreadAuthor():
return $default(_that.id,_that.username,_that.displayName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String displayName)?  $default,) {final _that = this;
switch (_that) {
case _ThreadAuthor() when $default != null:
return $default(_that.id,_that.username,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThreadAuthor implements ThreadAuthor {
  const _ThreadAuthor({required this.id, required this.username, required this.displayName});
  factory _ThreadAuthor.fromJson(Map<String, dynamic> json) => _$ThreadAuthorFromJson(json);

@override final  int id;
@override final  String username;
@override final  String displayName;

/// Create a copy of ThreadAuthor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadAuthorCopyWith<_ThreadAuthor> get copyWith => __$ThreadAuthorCopyWithImpl<_ThreadAuthor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreadAuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadAuthor&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName);

@override
String toString() {
  return 'ThreadAuthor(id: $id, username: $username, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$ThreadAuthorCopyWith<$Res> implements $ThreadAuthorCopyWith<$Res> {
  factory _$ThreadAuthorCopyWith(_ThreadAuthor value, $Res Function(_ThreadAuthor) _then) = __$ThreadAuthorCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String displayName
});




}
/// @nodoc
class __$ThreadAuthorCopyWithImpl<$Res>
    implements _$ThreadAuthorCopyWith<$Res> {
  __$ThreadAuthorCopyWithImpl(this._self, this._then);

  final _ThreadAuthor _self;
  final $Res Function(_ThreadAuthor) _then;

/// Create a copy of ThreadAuthor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? displayName = null,}) {
  return _then(_ThreadAuthor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Thread {

 int get id; int get boardId; int get authorId; String get title; String get content; List<String> get imageUrls; List<String> get imageTypes; int get replyCount; DateTime get lastReplyAt; DateTime get createdAt; DateTime get updatedAt; ThreadAuthor get author; List<ReactionSummary> get reactionSummary; bool get followed;
/// Create a copy of Thread
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadCopyWith<Thread> get copyWith => _$ThreadCopyWithImpl<Thread>(this as Thread, _$identity);

  /// Serializes this Thread to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Thread&&(identical(other.id, id) || other.id == id)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&const DeepCollectionEquality().equals(other.imageTypes, imageTypes)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.lastReplyAt, lastReplyAt) || other.lastReplyAt == lastReplyAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other.reactionSummary, reactionSummary)&&(identical(other.followed, followed) || other.followed == followed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,boardId,authorId,title,content,const DeepCollectionEquality().hash(imageUrls),const DeepCollectionEquality().hash(imageTypes),replyCount,lastReplyAt,createdAt,updatedAt,author,const DeepCollectionEquality().hash(reactionSummary),followed);

@override
String toString() {
  return 'Thread(id: $id, boardId: $boardId, authorId: $authorId, title: $title, content: $content, imageUrls: $imageUrls, imageTypes: $imageTypes, replyCount: $replyCount, lastReplyAt: $lastReplyAt, createdAt: $createdAt, updatedAt: $updatedAt, author: $author, reactionSummary: $reactionSummary, followed: $followed)';
}


}

/// @nodoc
abstract mixin class $ThreadCopyWith<$Res>  {
  factory $ThreadCopyWith(Thread value, $Res Function(Thread) _then) = _$ThreadCopyWithImpl;
@useResult
$Res call({
 int id, int boardId, int authorId, String title, String content, List<String> imageUrls, List<String> imageTypes, int replyCount, DateTime lastReplyAt, DateTime createdAt, DateTime updatedAt, ThreadAuthor author, List<ReactionSummary> reactionSummary, bool followed
});


$ThreadAuthorCopyWith<$Res> get author;

}
/// @nodoc
class _$ThreadCopyWithImpl<$Res>
    implements $ThreadCopyWith<$Res> {
  _$ThreadCopyWithImpl(this._self, this._then);

  final Thread _self;
  final $Res Function(Thread) _then;

/// Create a copy of Thread
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? boardId = null,Object? authorId = null,Object? title = null,Object? content = null,Object? imageUrls = null,Object? imageTypes = null,Object? replyCount = null,Object? lastReplyAt = null,Object? createdAt = null,Object? updatedAt = null,Object? author = null,Object? reactionSummary = null,Object? followed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,imageTypes: null == imageTypes ? _self.imageTypes : imageTypes // ignore: cast_nullable_to_non_nullable
as List<String>,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,lastReplyAt: null == lastReplyAt ? _self.lastReplyAt : lastReplyAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ThreadAuthor,reactionSummary: null == reactionSummary ? _self.reactionSummary : reactionSummary // ignore: cast_nullable_to_non_nullable
as List<ReactionSummary>,followed: null == followed ? _self.followed : followed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Thread
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadAuthorCopyWith<$Res> get author {
  
  return $ThreadAuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [Thread].
extension ThreadPatterns on Thread {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Thread value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Thread() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Thread value)  $default,){
final _that = this;
switch (_that) {
case _Thread():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Thread value)?  $default,){
final _that = this;
switch (_that) {
case _Thread() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int boardId,  int authorId,  String title,  String content,  List<String> imageUrls,  List<String> imageTypes,  int replyCount,  DateTime lastReplyAt,  DateTime createdAt,  DateTime updatedAt,  ThreadAuthor author,  List<ReactionSummary> reactionSummary,  bool followed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Thread() when $default != null:
return $default(_that.id,_that.boardId,_that.authorId,_that.title,_that.content,_that.imageUrls,_that.imageTypes,_that.replyCount,_that.lastReplyAt,_that.createdAt,_that.updatedAt,_that.author,_that.reactionSummary,_that.followed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int boardId,  int authorId,  String title,  String content,  List<String> imageUrls,  List<String> imageTypes,  int replyCount,  DateTime lastReplyAt,  DateTime createdAt,  DateTime updatedAt,  ThreadAuthor author,  List<ReactionSummary> reactionSummary,  bool followed)  $default,) {final _that = this;
switch (_that) {
case _Thread():
return $default(_that.id,_that.boardId,_that.authorId,_that.title,_that.content,_that.imageUrls,_that.imageTypes,_that.replyCount,_that.lastReplyAt,_that.createdAt,_that.updatedAt,_that.author,_that.reactionSummary,_that.followed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int boardId,  int authorId,  String title,  String content,  List<String> imageUrls,  List<String> imageTypes,  int replyCount,  DateTime lastReplyAt,  DateTime createdAt,  DateTime updatedAt,  ThreadAuthor author,  List<ReactionSummary> reactionSummary,  bool followed)?  $default,) {final _that = this;
switch (_that) {
case _Thread() when $default != null:
return $default(_that.id,_that.boardId,_that.authorId,_that.title,_that.content,_that.imageUrls,_that.imageTypes,_that.replyCount,_that.lastReplyAt,_that.createdAt,_that.updatedAt,_that.author,_that.reactionSummary,_that.followed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Thread implements Thread {
  const _Thread({required this.id, required this.boardId, required this.authorId, required this.title, required this.content, required final  List<String> imageUrls, required final  List<String> imageTypes, required this.replyCount, required this.lastReplyAt, required this.createdAt, required this.updatedAt, required this.author, required final  List<ReactionSummary> reactionSummary, required this.followed}): _imageUrls = imageUrls,_imageTypes = imageTypes,_reactionSummary = reactionSummary;
  factory _Thread.fromJson(Map<String, dynamic> json) => _$ThreadFromJson(json);

@override final  int id;
@override final  int boardId;
@override final  int authorId;
@override final  String title;
@override final  String content;
 final  List<String> _imageUrls;
@override List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

 final  List<String> _imageTypes;
@override List<String> get imageTypes {
  if (_imageTypes is EqualUnmodifiableListView) return _imageTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageTypes);
}

@override final  int replyCount;
@override final  DateTime lastReplyAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  ThreadAuthor author;
 final  List<ReactionSummary> _reactionSummary;
@override List<ReactionSummary> get reactionSummary {
  if (_reactionSummary is EqualUnmodifiableListView) return _reactionSummary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reactionSummary);
}

@override final  bool followed;

/// Create a copy of Thread
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadCopyWith<_Thread> get copyWith => __$ThreadCopyWithImpl<_Thread>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Thread&&(identical(other.id, id) || other.id == id)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&const DeepCollectionEquality().equals(other._imageTypes, _imageTypes)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.lastReplyAt, lastReplyAt) || other.lastReplyAt == lastReplyAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other._reactionSummary, _reactionSummary)&&(identical(other.followed, followed) || other.followed == followed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,boardId,authorId,title,content,const DeepCollectionEquality().hash(_imageUrls),const DeepCollectionEquality().hash(_imageTypes),replyCount,lastReplyAt,createdAt,updatedAt,author,const DeepCollectionEquality().hash(_reactionSummary),followed);

@override
String toString() {
  return 'Thread(id: $id, boardId: $boardId, authorId: $authorId, title: $title, content: $content, imageUrls: $imageUrls, imageTypes: $imageTypes, replyCount: $replyCount, lastReplyAt: $lastReplyAt, createdAt: $createdAt, updatedAt: $updatedAt, author: $author, reactionSummary: $reactionSummary, followed: $followed)';
}


}

/// @nodoc
abstract mixin class _$ThreadCopyWith<$Res> implements $ThreadCopyWith<$Res> {
  factory _$ThreadCopyWith(_Thread value, $Res Function(_Thread) _then) = __$ThreadCopyWithImpl;
@override @useResult
$Res call({
 int id, int boardId, int authorId, String title, String content, List<String> imageUrls, List<String> imageTypes, int replyCount, DateTime lastReplyAt, DateTime createdAt, DateTime updatedAt, ThreadAuthor author, List<ReactionSummary> reactionSummary, bool followed
});


@override $ThreadAuthorCopyWith<$Res> get author;

}
/// @nodoc
class __$ThreadCopyWithImpl<$Res>
    implements _$ThreadCopyWith<$Res> {
  __$ThreadCopyWithImpl(this._self, this._then);

  final _Thread _self;
  final $Res Function(_Thread) _then;

/// Create a copy of Thread
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? boardId = null,Object? authorId = null,Object? title = null,Object? content = null,Object? imageUrls = null,Object? imageTypes = null,Object? replyCount = null,Object? lastReplyAt = null,Object? createdAt = null,Object? updatedAt = null,Object? author = null,Object? reactionSummary = null,Object? followed = null,}) {
  return _then(_Thread(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,imageTypes: null == imageTypes ? _self._imageTypes : imageTypes // ignore: cast_nullable_to_non_nullable
as List<String>,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,lastReplyAt: null == lastReplyAt ? _self.lastReplyAt : lastReplyAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ThreadAuthor,reactionSummary: null == reactionSummary ? _self._reactionSummary : reactionSummary // ignore: cast_nullable_to_non_nullable
as List<ReactionSummary>,followed: null == followed ? _self.followed : followed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Thread
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadAuthorCopyWith<$Res> get author {
  
  return $ThreadAuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// @nodoc
mixin _$ReplyAuthor {

 int get id; String get username; String get displayName; String? get avatarUrl;
/// Create a copy of ReplyAuthor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyAuthorCopyWith<ReplyAuthor> get copyWith => _$ReplyAuthorCopyWithImpl<ReplyAuthor>(this as ReplyAuthor, _$identity);

  /// Serializes this ReplyAuthor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyAuthor&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName,avatarUrl);

@override
String toString() {
  return 'ReplyAuthor(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ReplyAuthorCopyWith<$Res>  {
  factory $ReplyAuthorCopyWith(ReplyAuthor value, $Res Function(ReplyAuthor) _then) = _$ReplyAuthorCopyWithImpl;
@useResult
$Res call({
 int id, String username, String displayName, String? avatarUrl
});




}
/// @nodoc
class _$ReplyAuthorCopyWithImpl<$Res>
    implements $ReplyAuthorCopyWith<$Res> {
  _$ReplyAuthorCopyWithImpl(this._self, this._then);

  final ReplyAuthor _self;
  final $Res Function(ReplyAuthor) _then;

/// Create a copy of ReplyAuthor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? displayName = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReplyAuthor].
extension ReplyAuthorPatterns on ReplyAuthor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReplyAuthor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReplyAuthor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReplyAuthor value)  $default,){
final _that = this;
switch (_that) {
case _ReplyAuthor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReplyAuthor value)?  $default,){
final _that = this;
switch (_that) {
case _ReplyAuthor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String displayName,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReplyAuthor() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String displayName,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ReplyAuthor():
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String displayName,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ReplyAuthor() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReplyAuthor implements ReplyAuthor {
  const _ReplyAuthor({required this.id, required this.username, required this.displayName, this.avatarUrl});
  factory _ReplyAuthor.fromJson(Map<String, dynamic> json) => _$ReplyAuthorFromJson(json);

@override final  int id;
@override final  String username;
@override final  String displayName;
@override final  String? avatarUrl;

/// Create a copy of ReplyAuthor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyAuthorCopyWith<_ReplyAuthor> get copyWith => __$ReplyAuthorCopyWithImpl<_ReplyAuthor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReplyAuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyAuthor&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,displayName,avatarUrl);

@override
String toString() {
  return 'ReplyAuthor(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ReplyAuthorCopyWith<$Res> implements $ReplyAuthorCopyWith<$Res> {
  factory _$ReplyAuthorCopyWith(_ReplyAuthor value, $Res Function(_ReplyAuthor) _then) = __$ReplyAuthorCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String displayName, String? avatarUrl
});




}
/// @nodoc
class __$ReplyAuthorCopyWithImpl<$Res>
    implements _$ReplyAuthorCopyWith<$Res> {
  __$ReplyAuthorCopyWithImpl(this._self, this._then);

  final _ReplyAuthor _self;
  final $Res Function(_ReplyAuthor) _then;

/// Create a copy of ReplyAuthor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? displayName = null,Object? avatarUrl = freezed,}) {
  return _then(_ReplyAuthor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ThreadReply {

 int get id; int get boardId; int get threadId; int get authorId; int get replyNumber; String get content; List<String> get imageUrls; List<String> get imageTypes; int? get replyCount; DateTime? get lastReplyAt; DateTime get createdAt; DateTime get updatedAt; ReplyAuthor get author; List<ReactionSummary> get reactionSummary;
/// Create a copy of ThreadReply
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadReplyCopyWith<ThreadReply> get copyWith => _$ThreadReplyCopyWithImpl<ThreadReply>(this as ThreadReply, _$identity);

  /// Serializes this ThreadReply to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadReply&&(identical(other.id, id) || other.id == id)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.replyNumber, replyNumber) || other.replyNumber == replyNumber)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&const DeepCollectionEquality().equals(other.imageTypes, imageTypes)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.lastReplyAt, lastReplyAt) || other.lastReplyAt == lastReplyAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other.reactionSummary, reactionSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,boardId,threadId,authorId,replyNumber,content,const DeepCollectionEquality().hash(imageUrls),const DeepCollectionEquality().hash(imageTypes),replyCount,lastReplyAt,createdAt,updatedAt,author,const DeepCollectionEquality().hash(reactionSummary));

@override
String toString() {
  return 'ThreadReply(id: $id, boardId: $boardId, threadId: $threadId, authorId: $authorId, replyNumber: $replyNumber, content: $content, imageUrls: $imageUrls, imageTypes: $imageTypes, replyCount: $replyCount, lastReplyAt: $lastReplyAt, createdAt: $createdAt, updatedAt: $updatedAt, author: $author, reactionSummary: $reactionSummary)';
}


}

/// @nodoc
abstract mixin class $ThreadReplyCopyWith<$Res>  {
  factory $ThreadReplyCopyWith(ThreadReply value, $Res Function(ThreadReply) _then) = _$ThreadReplyCopyWithImpl;
@useResult
$Res call({
 int id, int boardId, int threadId, int authorId, int replyNumber, String content, List<String> imageUrls, List<String> imageTypes, int? replyCount, DateTime? lastReplyAt, DateTime createdAt, DateTime updatedAt, ReplyAuthor author, List<ReactionSummary> reactionSummary
});


$ReplyAuthorCopyWith<$Res> get author;

}
/// @nodoc
class _$ThreadReplyCopyWithImpl<$Res>
    implements $ThreadReplyCopyWith<$Res> {
  _$ThreadReplyCopyWithImpl(this._self, this._then);

  final ThreadReply _self;
  final $Res Function(ThreadReply) _then;

/// Create a copy of ThreadReply
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? boardId = null,Object? threadId = null,Object? authorId = null,Object? replyNumber = null,Object? content = null,Object? imageUrls = null,Object? imageTypes = null,Object? replyCount = freezed,Object? lastReplyAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? author = null,Object? reactionSummary = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as int,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,replyNumber: null == replyNumber ? _self.replyNumber : replyNumber // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,imageTypes: null == imageTypes ? _self.imageTypes : imageTypes // ignore: cast_nullable_to_non_nullable
as List<String>,replyCount: freezed == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int?,lastReplyAt: freezed == lastReplyAt ? _self.lastReplyAt : lastReplyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ReplyAuthor,reactionSummary: null == reactionSummary ? _self.reactionSummary : reactionSummary // ignore: cast_nullable_to_non_nullable
as List<ReactionSummary>,
  ));
}
/// Create a copy of ThreadReply
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyAuthorCopyWith<$Res> get author {
  
  return $ReplyAuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThreadReply].
extension ThreadReplyPatterns on ThreadReply {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadReply value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadReply() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadReply value)  $default,){
final _that = this;
switch (_that) {
case _ThreadReply():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadReply value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadReply() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int boardId,  int threadId,  int authorId,  int replyNumber,  String content,  List<String> imageUrls,  List<String> imageTypes,  int? replyCount,  DateTime? lastReplyAt,  DateTime createdAt,  DateTime updatedAt,  ReplyAuthor author,  List<ReactionSummary> reactionSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadReply() when $default != null:
return $default(_that.id,_that.boardId,_that.threadId,_that.authorId,_that.replyNumber,_that.content,_that.imageUrls,_that.imageTypes,_that.replyCount,_that.lastReplyAt,_that.createdAt,_that.updatedAt,_that.author,_that.reactionSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int boardId,  int threadId,  int authorId,  int replyNumber,  String content,  List<String> imageUrls,  List<String> imageTypes,  int? replyCount,  DateTime? lastReplyAt,  DateTime createdAt,  DateTime updatedAt,  ReplyAuthor author,  List<ReactionSummary> reactionSummary)  $default,) {final _that = this;
switch (_that) {
case _ThreadReply():
return $default(_that.id,_that.boardId,_that.threadId,_that.authorId,_that.replyNumber,_that.content,_that.imageUrls,_that.imageTypes,_that.replyCount,_that.lastReplyAt,_that.createdAt,_that.updatedAt,_that.author,_that.reactionSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int boardId,  int threadId,  int authorId,  int replyNumber,  String content,  List<String> imageUrls,  List<String> imageTypes,  int? replyCount,  DateTime? lastReplyAt,  DateTime createdAt,  DateTime updatedAt,  ReplyAuthor author,  List<ReactionSummary> reactionSummary)?  $default,) {final _that = this;
switch (_that) {
case _ThreadReply() when $default != null:
return $default(_that.id,_that.boardId,_that.threadId,_that.authorId,_that.replyNumber,_that.content,_that.imageUrls,_that.imageTypes,_that.replyCount,_that.lastReplyAt,_that.createdAt,_that.updatedAt,_that.author,_that.reactionSummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThreadReply implements ThreadReply {
  const _ThreadReply({required this.id, required this.boardId, required this.threadId, required this.authorId, required this.replyNumber, required this.content, required final  List<String> imageUrls, required final  List<String> imageTypes, this.replyCount, this.lastReplyAt, required this.createdAt, required this.updatedAt, required this.author, required final  List<ReactionSummary> reactionSummary}): _imageUrls = imageUrls,_imageTypes = imageTypes,_reactionSummary = reactionSummary;
  factory _ThreadReply.fromJson(Map<String, dynamic> json) => _$ThreadReplyFromJson(json);

@override final  int id;
@override final  int boardId;
@override final  int threadId;
@override final  int authorId;
@override final  int replyNumber;
@override final  String content;
 final  List<String> _imageUrls;
@override List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

 final  List<String> _imageTypes;
@override List<String> get imageTypes {
  if (_imageTypes is EqualUnmodifiableListView) return _imageTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageTypes);
}

@override final  int? replyCount;
@override final  DateTime? lastReplyAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  ReplyAuthor author;
 final  List<ReactionSummary> _reactionSummary;
@override List<ReactionSummary> get reactionSummary {
  if (_reactionSummary is EqualUnmodifiableListView) return _reactionSummary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reactionSummary);
}


/// Create a copy of ThreadReply
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadReplyCopyWith<_ThreadReply> get copyWith => __$ThreadReplyCopyWithImpl<_ThreadReply>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreadReplyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadReply&&(identical(other.id, id) || other.id == id)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.replyNumber, replyNumber) || other.replyNumber == replyNumber)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&const DeepCollectionEquality().equals(other._imageTypes, _imageTypes)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.lastReplyAt, lastReplyAt) || other.lastReplyAt == lastReplyAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other._reactionSummary, _reactionSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,boardId,threadId,authorId,replyNumber,content,const DeepCollectionEquality().hash(_imageUrls),const DeepCollectionEquality().hash(_imageTypes),replyCount,lastReplyAt,createdAt,updatedAt,author,const DeepCollectionEquality().hash(_reactionSummary));

@override
String toString() {
  return 'ThreadReply(id: $id, boardId: $boardId, threadId: $threadId, authorId: $authorId, replyNumber: $replyNumber, content: $content, imageUrls: $imageUrls, imageTypes: $imageTypes, replyCount: $replyCount, lastReplyAt: $lastReplyAt, createdAt: $createdAt, updatedAt: $updatedAt, author: $author, reactionSummary: $reactionSummary)';
}


}

/// @nodoc
abstract mixin class _$ThreadReplyCopyWith<$Res> implements $ThreadReplyCopyWith<$Res> {
  factory _$ThreadReplyCopyWith(_ThreadReply value, $Res Function(_ThreadReply) _then) = __$ThreadReplyCopyWithImpl;
@override @useResult
$Res call({
 int id, int boardId, int threadId, int authorId, int replyNumber, String content, List<String> imageUrls, List<String> imageTypes, int? replyCount, DateTime? lastReplyAt, DateTime createdAt, DateTime updatedAt, ReplyAuthor author, List<ReactionSummary> reactionSummary
});


@override $ReplyAuthorCopyWith<$Res> get author;

}
/// @nodoc
class __$ThreadReplyCopyWithImpl<$Res>
    implements _$ThreadReplyCopyWith<$Res> {
  __$ThreadReplyCopyWithImpl(this._self, this._then);

  final _ThreadReply _self;
  final $Res Function(_ThreadReply) _then;

/// Create a copy of ThreadReply
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? boardId = null,Object? threadId = null,Object? authorId = null,Object? replyNumber = null,Object? content = null,Object? imageUrls = null,Object? imageTypes = null,Object? replyCount = freezed,Object? lastReplyAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? author = null,Object? reactionSummary = null,}) {
  return _then(_ThreadReply(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as int,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,replyNumber: null == replyNumber ? _self.replyNumber : replyNumber // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,imageTypes: null == imageTypes ? _self._imageTypes : imageTypes // ignore: cast_nullable_to_non_nullable
as List<String>,replyCount: freezed == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int?,lastReplyAt: freezed == lastReplyAt ? _self.lastReplyAt : lastReplyAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ReplyAuthor,reactionSummary: null == reactionSummary ? _self._reactionSummary : reactionSummary // ignore: cast_nullable_to_non_nullable
as List<ReactionSummary>,
  ));
}

/// Create a copy of ThreadReply
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplyAuthorCopyWith<$Res> get author {
  
  return $ReplyAuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}

// dart format on
