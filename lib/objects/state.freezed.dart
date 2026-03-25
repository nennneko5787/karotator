// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostState {

 int get id; bool get rekaroted; int get rekarotsCount; bool get liked; int get likesCount; bool get bookmarked; int get bookmarksCount;
/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostStateCopyWith<PostState> get copyWith => _$PostStateCopyWithImpl<PostState>(this as PostState, _$identity);

  /// Serializes this PostState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostState&&(identical(other.id, id) || other.id == id)&&(identical(other.rekaroted, rekaroted) || other.rekaroted == rekaroted)&&(identical(other.rekarotsCount, rekarotsCount) || other.rekarotsCount == rekarotsCount)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&(identical(other.bookmarksCount, bookmarksCount) || other.bookmarksCount == bookmarksCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rekaroted,rekarotsCount,liked,likesCount,bookmarked,bookmarksCount);

@override
String toString() {
  return 'PostState(id: $id, rekaroted: $rekaroted, rekarotsCount: $rekarotsCount, liked: $liked, likesCount: $likesCount, bookmarked: $bookmarked, bookmarksCount: $bookmarksCount)';
}


}

/// @nodoc
abstract mixin class $PostStateCopyWith<$Res>  {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) _then) = _$PostStateCopyWithImpl;
@useResult
$Res call({
 int id, bool rekaroted, int rekarotsCount, bool liked, int likesCount, bool bookmarked, int bookmarksCount
});




}
/// @nodoc
class _$PostStateCopyWithImpl<$Res>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._self, this._then);

  final PostState _self;
  final $Res Function(PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rekaroted = null,Object? rekarotsCount = null,Object? liked = null,Object? likesCount = null,Object? bookmarked = null,Object? bookmarksCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rekaroted: null == rekaroted ? _self.rekaroted : rekaroted // ignore: cast_nullable_to_non_nullable
as bool,rekarotsCount: null == rekarotsCount ? _self.rekarotsCount : rekarotsCount // ignore: cast_nullable_to_non_nullable
as int,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,bookmarksCount: null == bookmarksCount ? _self.bookmarksCount : bookmarksCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PostState].
extension PostStatePatterns on PostState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostState value)  $default,){
final _that = this;
switch (_that) {
case _PostState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostState value)?  $default,){
final _that = this;
switch (_that) {
case _PostState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  bool rekaroted,  int rekarotsCount,  bool liked,  int likesCount,  bool bookmarked,  int bookmarksCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that.id,_that.rekaroted,_that.rekarotsCount,_that.liked,_that.likesCount,_that.bookmarked,_that.bookmarksCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  bool rekaroted,  int rekarotsCount,  bool liked,  int likesCount,  bool bookmarked,  int bookmarksCount)  $default,) {final _that = this;
switch (_that) {
case _PostState():
return $default(_that.id,_that.rekaroted,_that.rekarotsCount,_that.liked,_that.likesCount,_that.bookmarked,_that.bookmarksCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  bool rekaroted,  int rekarotsCount,  bool liked,  int likesCount,  bool bookmarked,  int bookmarksCount)?  $default,) {final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that.id,_that.rekaroted,_that.rekarotsCount,_that.liked,_that.likesCount,_that.bookmarked,_that.bookmarksCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostState implements PostState {
  const _PostState({required this.id, required this.rekaroted, required this.rekarotsCount, required this.liked, required this.likesCount, required this.bookmarked, required this.bookmarksCount});
  factory _PostState.fromJson(Map<String, dynamic> json) => _$PostStateFromJson(json);

@override final  int id;
@override final  bool rekaroted;
@override final  int rekarotsCount;
@override final  bool liked;
@override final  int likesCount;
@override final  bool bookmarked;
@override final  int bookmarksCount;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostStateCopyWith<_PostState> get copyWith => __$PostStateCopyWithImpl<_PostState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostState&&(identical(other.id, id) || other.id == id)&&(identical(other.rekaroted, rekaroted) || other.rekaroted == rekaroted)&&(identical(other.rekarotsCount, rekarotsCount) || other.rekarotsCount == rekarotsCount)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&(identical(other.bookmarksCount, bookmarksCount) || other.bookmarksCount == bookmarksCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rekaroted,rekarotsCount,liked,likesCount,bookmarked,bookmarksCount);

@override
String toString() {
  return 'PostState(id: $id, rekaroted: $rekaroted, rekarotsCount: $rekarotsCount, liked: $liked, likesCount: $likesCount, bookmarked: $bookmarked, bookmarksCount: $bookmarksCount)';
}


}

/// @nodoc
abstract mixin class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(_PostState value, $Res Function(_PostState) _then) = __$PostStateCopyWithImpl;
@override @useResult
$Res call({
 int id, bool rekaroted, int rekarotsCount, bool liked, int likesCount, bool bookmarked, int bookmarksCount
});




}
/// @nodoc
class __$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(this._self, this._then);

  final _PostState _self;
  final $Res Function(_PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rekaroted = null,Object? rekarotsCount = null,Object? liked = null,Object? likesCount = null,Object? bookmarked = null,Object? bookmarksCount = null,}) {
  return _then(_PostState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rekaroted: null == rekaroted ? _self.rekaroted : rekaroted // ignore: cast_nullable_to_non_nullable
as bool,rekarotsCount: null == rekarotsCount ? _self.rekarotsCount : rekarotsCount // ignore: cast_nullable_to_non_nullable
as int,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,bookmarksCount: null == bookmarksCount ? _self.bookmarksCount : bookmarksCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
