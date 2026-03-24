// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Author {

 int? get avatarFrameId; String? get avatarUrl; String get displayName; int get id; bool get isPrivate; String get officialMark; String get username;
/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorCopyWith<Author> get copyWith => _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Author&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.officialMark, officialMark) || other.officialMark == officialMark)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,officialMark,username);

@override
String toString() {
  return 'Author(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, officialMark: $officialMark, username: $username)';
}


}

/// @nodoc
abstract mixin class $AuthorCopyWith<$Res>  {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) = _$AuthorCopyWithImpl;
@useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, String officialMark, String username
});




}
/// @nodoc
class _$AuthorCopyWithImpl<$Res>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._self, this._then);

  final Author _self;
  final $Res Function(Author) _then;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? officialMark = null,Object? username = null,}) {
  return _then(_self.copyWith(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self.officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Author].
extension AuthorPatterns on Author {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Author value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Author() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Author value)  $default,){
final _that = this;
switch (_that) {
case _Author():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Author value)?  $default,){
final _that = this;
switch (_that) {
case _Author() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  String officialMark,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.officialMark,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  String officialMark,  String username)  $default,) {final _that = this;
switch (_that) {
case _Author():
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.officialMark,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  String officialMark,  String username)?  $default,) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.officialMark,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Author implements Author {
  const _Author({this.avatarFrameId, this.avatarUrl, required this.displayName, required this.id, this.isPrivate = false, this.officialMark = "NONE", required this.username});
  factory _Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

@override final  int? avatarFrameId;
@override final  String? avatarUrl;
@override final  String displayName;
@override final  int id;
@override@JsonKey() final  bool isPrivate;
@override@JsonKey() final  String officialMark;
@override final  String username;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorCopyWith<_Author> get copyWith => __$AuthorCopyWithImpl<_Author>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Author&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.officialMark, officialMark) || other.officialMark == officialMark)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,officialMark,username);

@override
String toString() {
  return 'Author(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, officialMark: $officialMark, username: $username)';
}


}

/// @nodoc
abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) = __$AuthorCopyWithImpl;
@override @useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, String officialMark, String username
});




}
/// @nodoc
class __$AuthorCopyWithImpl<$Res>
    implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(this._self, this._then);

  final _Author _self;
  final $Res Function(_Author) _then;

/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? officialMark = null,Object? username = null,}) {
  return _then(_Author(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self.officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
