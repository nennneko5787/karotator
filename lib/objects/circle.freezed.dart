// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CircleCountMeta {

 int get posts; int get stories;
/// Create a copy of CircleCountMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CircleCountMetaCopyWith<CircleCountMeta> get copyWith => _$CircleCountMetaCopyWithImpl<CircleCountMeta>(this as CircleCountMeta, _$identity);

  /// Serializes this CircleCountMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CircleCountMeta&&(identical(other.posts, posts) || other.posts == posts)&&(identical(other.stories, stories) || other.stories == stories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,posts,stories);

@override
String toString() {
  return 'CircleCountMeta(posts: $posts, stories: $stories)';
}


}

/// @nodoc
abstract mixin class $CircleCountMetaCopyWith<$Res>  {
  factory $CircleCountMetaCopyWith(CircleCountMeta value, $Res Function(CircleCountMeta) _then) = _$CircleCountMetaCopyWithImpl;
@useResult
$Res call({
 int posts, int stories
});




}
/// @nodoc
class _$CircleCountMetaCopyWithImpl<$Res>
    implements $CircleCountMetaCopyWith<$Res> {
  _$CircleCountMetaCopyWithImpl(this._self, this._then);

  final CircleCountMeta _self;
  final $Res Function(CircleCountMeta) _then;

/// Create a copy of CircleCountMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,Object? stories = null,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as int,stories: null == stories ? _self.stories : stories // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CircleCountMeta].
extension CircleCountMetaPatterns on CircleCountMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CircleCountMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CircleCountMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CircleCountMeta value)  $default,){
final _that = this;
switch (_that) {
case _CircleCountMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CircleCountMeta value)?  $default,){
final _that = this;
switch (_that) {
case _CircleCountMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int posts,  int stories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CircleCountMeta() when $default != null:
return $default(_that.posts,_that.stories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int posts,  int stories)  $default,) {final _that = this;
switch (_that) {
case _CircleCountMeta():
return $default(_that.posts,_that.stories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int posts,  int stories)?  $default,) {final _that = this;
switch (_that) {
case _CircleCountMeta() when $default != null:
return $default(_that.posts,_that.stories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CircleCountMeta implements CircleCountMeta {
  const _CircleCountMeta({required this.posts, required this.stories});
  factory _CircleCountMeta.fromJson(Map<String, dynamic> json) => _$CircleCountMetaFromJson(json);

@override final  int posts;
@override final  int stories;

/// Create a copy of CircleCountMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CircleCountMetaCopyWith<_CircleCountMeta> get copyWith => __$CircleCountMetaCopyWithImpl<_CircleCountMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CircleCountMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CircleCountMeta&&(identical(other.posts, posts) || other.posts == posts)&&(identical(other.stories, stories) || other.stories == stories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,posts,stories);

@override
String toString() {
  return 'CircleCountMeta(posts: $posts, stories: $stories)';
}


}

/// @nodoc
abstract mixin class _$CircleCountMetaCopyWith<$Res> implements $CircleCountMetaCopyWith<$Res> {
  factory _$CircleCountMetaCopyWith(_CircleCountMeta value, $Res Function(_CircleCountMeta) _then) = __$CircleCountMetaCopyWithImpl;
@override @useResult
$Res call({
 int posts, int stories
});




}
/// @nodoc
class __$CircleCountMetaCopyWithImpl<$Res>
    implements _$CircleCountMetaCopyWith<$Res> {
  __$CircleCountMetaCopyWithImpl(this._self, this._then);

  final _CircleCountMeta _self;
  final $Res Function(_CircleCountMeta) _then;

/// Create a copy of CircleCountMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? stories = null,}) {
  return _then(_CircleCountMeta(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as int,stories: null == stories ? _self.stories : stories // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Circle {

 int get id; int get ownerId; DateTime get createdAt; DateTime get updatedAt; String get name; String? get description; List<Author> get members;@JsonKey(name: '_count') CircleCountMeta get meta;
/// Create a copy of Circle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CircleCopyWith<Circle> get copyWith => _$CircleCopyWithImpl<Circle>(this as Circle, _$identity);

  /// Serializes this Circle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Circle&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,createdAt,updatedAt,name,description,const DeepCollectionEquality().hash(members),meta);

@override
String toString() {
  return 'Circle(id: $id, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, description: $description, members: $members, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $CircleCopyWith<$Res>  {
  factory $CircleCopyWith(Circle value, $Res Function(Circle) _then) = _$CircleCopyWithImpl;
@useResult
$Res call({
 int id, int ownerId, DateTime createdAt, DateTime updatedAt, String name, String? description, List<Author> members,@JsonKey(name: '_count') CircleCountMeta meta
});


$CircleCountMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$CircleCopyWithImpl<$Res>
    implements $CircleCopyWith<$Res> {
  _$CircleCopyWithImpl(this._self, this._then);

  final Circle _self;
  final $Res Function(Circle) _then;

/// Create a copy of Circle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? description = freezed,Object? members = null,Object? meta = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<Author>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as CircleCountMeta,
  ));
}
/// Create a copy of Circle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CircleCountMetaCopyWith<$Res> get meta {
  
  return $CircleCountMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [Circle].
extension CirclePatterns on Circle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Circle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Circle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Circle value)  $default,){
final _that = this;
switch (_that) {
case _Circle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Circle value)?  $default,){
final _that = this;
switch (_that) {
case _Circle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int ownerId,  DateTime createdAt,  DateTime updatedAt,  String name,  String? description,  List<Author> members, @JsonKey(name: '_count')  CircleCountMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Circle() when $default != null:
return $default(_that.id,_that.ownerId,_that.createdAt,_that.updatedAt,_that.name,_that.description,_that.members,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int ownerId,  DateTime createdAt,  DateTime updatedAt,  String name,  String? description,  List<Author> members, @JsonKey(name: '_count')  CircleCountMeta meta)  $default,) {final _that = this;
switch (_that) {
case _Circle():
return $default(_that.id,_that.ownerId,_that.createdAt,_that.updatedAt,_that.name,_that.description,_that.members,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int ownerId,  DateTime createdAt,  DateTime updatedAt,  String name,  String? description,  List<Author> members, @JsonKey(name: '_count')  CircleCountMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _Circle() when $default != null:
return $default(_that.id,_that.ownerId,_that.createdAt,_that.updatedAt,_that.name,_that.description,_that.members,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Circle implements Circle {
  const _Circle({required this.id, required this.ownerId, required this.createdAt, required this.updatedAt, required this.name, this.description, required final  List<Author> members, @JsonKey(name: '_count') required this.meta}): _members = members;
  factory _Circle.fromJson(Map<String, dynamic> json) => _$CircleFromJson(json);

@override final  int id;
@override final  int ownerId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String name;
@override final  String? description;
 final  List<Author> _members;
@override List<Author> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

@override@JsonKey(name: '_count') final  CircleCountMeta meta;

/// Create a copy of Circle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CircleCopyWith<_Circle> get copyWith => __$CircleCopyWithImpl<_Circle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CircleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Circle&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,createdAt,updatedAt,name,description,const DeepCollectionEquality().hash(_members),meta);

@override
String toString() {
  return 'Circle(id: $id, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, description: $description, members: $members, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$CircleCopyWith<$Res> implements $CircleCopyWith<$Res> {
  factory _$CircleCopyWith(_Circle value, $Res Function(_Circle) _then) = __$CircleCopyWithImpl;
@override @useResult
$Res call({
 int id, int ownerId, DateTime createdAt, DateTime updatedAt, String name, String? description, List<Author> members,@JsonKey(name: '_count') CircleCountMeta meta
});


@override $CircleCountMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$CircleCopyWithImpl<$Res>
    implements _$CircleCopyWith<$Res> {
  __$CircleCopyWithImpl(this._self, this._then);

  final _Circle _self;
  final $Res Function(_Circle) _then;

/// Create a copy of Circle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,Object? description = freezed,Object? members = null,Object? meta = null,}) {
  return _then(_Circle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<Author>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as CircleCountMeta,
  ));
}

/// Create a copy of Circle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CircleCountMetaCopyWith<$Res> get meta {
  
  return $CircleCountMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
