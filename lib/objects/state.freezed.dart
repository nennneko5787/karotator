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
mixin _$MediaState {

 File get file; set file(File value); Uint8List? get thumbnail; set thumbnail(Uint8List? value); MediaType get type; set type(MediaType value); String get alt; set alt(String value); bool get spoiler; set spoiler(bool value); bool get nsfw; set nsfw(bool value);
/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaStateCopyWith<MediaState> get copyWith => _$MediaStateCopyWithImpl<MediaState>(this as MediaState, _$identity);





@override
String toString() {
  return 'MediaState(file: $file, thumbnail: $thumbnail, type: $type, alt: $alt, spoiler: $spoiler, nsfw: $nsfw)';
}


}

/// @nodoc
abstract mixin class $MediaStateCopyWith<$Res>  {
  factory $MediaStateCopyWith(MediaState value, $Res Function(MediaState) _then) = _$MediaStateCopyWithImpl;
@useResult
$Res call({
 File file, Uint8List? thumbnail, MediaType type, String alt, bool spoiler, bool nsfw
});




}
/// @nodoc
class _$MediaStateCopyWithImpl<$Res>
    implements $MediaStateCopyWith<$Res> {
  _$MediaStateCopyWithImpl(this._self, this._then);

  final MediaState _self;
  final $Res Function(MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? file = null,Object? thumbnail = freezed,Object? type = null,Object? alt = null,Object? spoiler = null,Object? nsfw = null,}) {
  return _then(_self.copyWith(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as Uint8List?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,spoiler: null == spoiler ? _self.spoiler : spoiler // ignore: cast_nullable_to_non_nullable
as bool,nsfw: null == nsfw ? _self.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaState].
extension MediaStatePatterns on MediaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaState value)  $default,){
final _that = this;
switch (_that) {
case _MediaState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaState value)?  $default,){
final _that = this;
switch (_that) {
case _MediaState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( File file,  Uint8List? thumbnail,  MediaType type,  String alt,  bool spoiler,  bool nsfw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaState() when $default != null:
return $default(_that.file,_that.thumbnail,_that.type,_that.alt,_that.spoiler,_that.nsfw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( File file,  Uint8List? thumbnail,  MediaType type,  String alt,  bool spoiler,  bool nsfw)  $default,) {final _that = this;
switch (_that) {
case _MediaState():
return $default(_that.file,_that.thumbnail,_that.type,_that.alt,_that.spoiler,_that.nsfw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( File file,  Uint8List? thumbnail,  MediaType type,  String alt,  bool spoiler,  bool nsfw)?  $default,) {final _that = this;
switch (_that) {
case _MediaState() when $default != null:
return $default(_that.file,_that.thumbnail,_that.type,_that.alt,_that.spoiler,_that.nsfw);case _:
  return null;

}
}

}

/// @nodoc


class _MediaState implements MediaState {
   _MediaState({required this.file, this.thumbnail, required this.type, this.alt = "", this.spoiler = false, this.nsfw = false});
  

@override  File file;
@override  Uint8List? thumbnail;
@override  MediaType type;
@override@JsonKey()  String alt;
@override@JsonKey()  bool spoiler;
@override@JsonKey()  bool nsfw;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaStateCopyWith<_MediaState> get copyWith => __$MediaStateCopyWithImpl<_MediaState>(this, _$identity);





@override
String toString() {
  return 'MediaState(file: $file, thumbnail: $thumbnail, type: $type, alt: $alt, spoiler: $spoiler, nsfw: $nsfw)';
}


}

/// @nodoc
abstract mixin class _$MediaStateCopyWith<$Res> implements $MediaStateCopyWith<$Res> {
  factory _$MediaStateCopyWith(_MediaState value, $Res Function(_MediaState) _then) = __$MediaStateCopyWithImpl;
@override @useResult
$Res call({
 File file, Uint8List? thumbnail, MediaType type, String alt, bool spoiler, bool nsfw
});




}
/// @nodoc
class __$MediaStateCopyWithImpl<$Res>
    implements _$MediaStateCopyWith<$Res> {
  __$MediaStateCopyWithImpl(this._self, this._then);

  final _MediaState _self;
  final $Res Function(_MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? file = null,Object? thumbnail = freezed,Object? type = null,Object? alt = null,Object? spoiler = null,Object? nsfw = null,}) {
  return _then(_MediaState(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as Uint8List?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,spoiler: null == spoiler ? _self.spoiler : spoiler // ignore: cast_nullable_to_non_nullable
as bool,nsfw: null == nsfw ? _self.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
