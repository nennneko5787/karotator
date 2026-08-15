// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Id {

 int get id;
/// Create a copy of Id
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdCopyWith<Id> get copyWith => _$IdCopyWithImpl<Id>(this as Id, _$identity);

  /// Serializes this Id to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Id&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'Id(id: $id)';
}


}

/// @nodoc
abstract mixin class $IdCopyWith<$Res>  {
  factory $IdCopyWith(Id value, $Res Function(Id) _then) = _$IdCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$IdCopyWithImpl<$Res>
    implements $IdCopyWith<$Res> {
  _$IdCopyWithImpl(this._self, this._then);

  final Id _self;
  final $Res Function(Id) _then;

/// Create a copy of Id
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(Id(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Id].
extension IdPatterns on Id {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Id value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Id() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Id value)  $default,){
final _that = this;
switch (_that) {
case _Id():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Id value)?  $default,){
final _that = this;
switch (_that) {
case _Id() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Id() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id)  $default,) {final _that = this;
switch (_that) {
case _Id():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id)?  $default,) {final _that = this;
switch (_that) {
case _Id() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Id implements Id {
  const _Id({required this.id});
  factory _Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

@override final  int id;

/// Create a copy of Id
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdCopyWith<_Id> get copyWith => __$IdCopyWithImpl<_Id>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Id&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'Id(id: $id)';
}


}

/// @nodoc
abstract mixin class _$IdCopyWith<$Res> implements $IdCopyWith<$Res> {
  factory _$IdCopyWith(_Id value, $Res Function(_Id) _then) = __$IdCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$IdCopyWithImpl<$Res>
    implements _$IdCopyWith<$Res> {
  __$IdCopyWithImpl(this._self, this._then);

  final _Id _self;
  final $Res Function(_Id) _then;

/// Create a copy of Id
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Id(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MentionId {

 int get mentionedId;
/// Create a copy of MentionId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MentionIdCopyWith<MentionId> get copyWith => _$MentionIdCopyWithImpl<MentionId>(this as MentionId, _$identity);

  /// Serializes this MentionId to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MentionId&&(identical(other.mentionedId, mentionedId) || other.mentionedId == mentionedId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mentionedId);

@override
String toString() {
  return 'MentionId(mentionedId: $mentionedId)';
}


}

/// @nodoc
abstract mixin class $MentionIdCopyWith<$Res>  {
  factory $MentionIdCopyWith(MentionId value, $Res Function(MentionId) _then) = _$MentionIdCopyWithImpl;
@useResult
$Res call({
 int mentionedId
});




}
/// @nodoc
class _$MentionIdCopyWithImpl<$Res>
    implements $MentionIdCopyWith<$Res> {
  _$MentionIdCopyWithImpl(this._self, this._then);

  final MentionId _self;
  final $Res Function(MentionId) _then;

/// Create a copy of MentionId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mentionedId = null,}) {
  return _then(MentionId(
mentionedId: null == mentionedId ? _self.mentionedId : mentionedId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MentionId].
extension MentionIdPatterns on MentionId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MentionId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MentionId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MentionId value)  $default,){
final _that = this;
switch (_that) {
case _MentionId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MentionId value)?  $default,){
final _that = this;
switch (_that) {
case _MentionId() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int mentionedId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MentionId() when $default != null:
return $default(_that.mentionedId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int mentionedId)  $default,) {final _that = this;
switch (_that) {
case _MentionId():
return $default(_that.mentionedId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int mentionedId)?  $default,) {final _that = this;
switch (_that) {
case _MentionId() when $default != null:
return $default(_that.mentionedId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MentionId implements MentionId {
  const _MentionId({required this.mentionedId});
  factory _MentionId.fromJson(Map<String, dynamic> json) => _$MentionIdFromJson(json);

@override final  int mentionedId;

/// Create a copy of MentionId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MentionIdCopyWith<_MentionId> get copyWith => __$MentionIdCopyWithImpl<_MentionId>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MentionIdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MentionId&&(identical(other.mentionedId, mentionedId) || other.mentionedId == mentionedId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mentionedId);

@override
String toString() {
  return 'MentionId(mentionedId: $mentionedId)';
}


}

/// @nodoc
abstract mixin class _$MentionIdCopyWith<$Res> implements $MentionIdCopyWith<$Res> {
  factory _$MentionIdCopyWith(_MentionId value, $Res Function(_MentionId) _then) = __$MentionIdCopyWithImpl;
@override @useResult
$Res call({
 int mentionedId
});




}
/// @nodoc
class __$MentionIdCopyWithImpl<$Res>
    implements _$MentionIdCopyWith<$Res> {
  __$MentionIdCopyWithImpl(this._self, this._then);

  final _MentionId _self;
  final $Res Function(_MentionId) _then;

/// Create a copy of MentionId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mentionedId = null,}) {
  return _then(_MentionId(
mentionedId: null == mentionedId ? _self.mentionedId : mentionedId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PollOption {

 int get id; String get text; String? get imageUrl; int get position; int get votesCount; int get percentage; bool get votedByMe;
/// Create a copy of PollOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollOptionCopyWith<PollOption> get copyWith => _$PollOptionCopyWithImpl<PollOption>(this as PollOption, _$identity);

  /// Serializes this PollOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollOption&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.position, position) || other.position == position)&&(identical(other.votesCount, votesCount) || other.votesCount == votesCount)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.votedByMe, votedByMe) || other.votedByMe == votedByMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,imageUrl,position,votesCount,percentage,votedByMe);

@override
String toString() {
  return 'PollOption(id: $id, text: $text, imageUrl: $imageUrl, position: $position, votesCount: $votesCount, percentage: $percentage, votedByMe: $votedByMe)';
}


}

/// @nodoc
abstract mixin class $PollOptionCopyWith<$Res>  {
  factory $PollOptionCopyWith(PollOption value, $Res Function(PollOption) _then) = _$PollOptionCopyWithImpl;
@useResult
$Res call({
 int id, String text, String? imageUrl, int position, int votesCount, int percentage, bool votedByMe
});




}
/// @nodoc
class _$PollOptionCopyWithImpl<$Res>
    implements $PollOptionCopyWith<$Res> {
  _$PollOptionCopyWithImpl(this._self, this._then);

  final PollOption _self;
  final $Res Function(PollOption) _then;

/// Create a copy of PollOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? imageUrl = freezed,Object? position = null,Object? votesCount = null,Object? percentage = null,Object? votedByMe = null,}) {
  return _then(PollOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,votesCount: null == votesCount ? _self.votesCount : votesCount // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,votedByMe: null == votedByMe ? _self.votedByMe : votedByMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PollOption].
extension PollOptionPatterns on PollOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PollOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PollOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PollOption value)  $default,){
final _that = this;
switch (_that) {
case _PollOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PollOption value)?  $default,){
final _that = this;
switch (_that) {
case _PollOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String text,  String? imageUrl,  int position,  int votesCount,  int percentage,  bool votedByMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PollOption() when $default != null:
return $default(_that.id,_that.text,_that.imageUrl,_that.position,_that.votesCount,_that.percentage,_that.votedByMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String text,  String? imageUrl,  int position,  int votesCount,  int percentage,  bool votedByMe)  $default,) {final _that = this;
switch (_that) {
case _PollOption():
return $default(_that.id,_that.text,_that.imageUrl,_that.position,_that.votesCount,_that.percentage,_that.votedByMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String text,  String? imageUrl,  int position,  int votesCount,  int percentage,  bool votedByMe)?  $default,) {final _that = this;
switch (_that) {
case _PollOption() when $default != null:
return $default(_that.id,_that.text,_that.imageUrl,_that.position,_that.votesCount,_that.percentage,_that.votedByMe);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PollOption implements PollOption {
  const _PollOption({required this.id, required this.text, this.imageUrl, required this.position, required this.votesCount, required this.percentage, required this.votedByMe});
  factory _PollOption.fromJson(Map<String, dynamic> json) => _$PollOptionFromJson(json);

@override final  int id;
@override final  String text;
@override final  String? imageUrl;
@override final  int position;
@override final  int votesCount;
@override final  int percentage;
@override final  bool votedByMe;

/// Create a copy of PollOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PollOptionCopyWith<_PollOption> get copyWith => __$PollOptionCopyWithImpl<_PollOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PollOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PollOption&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.position, position) || other.position == position)&&(identical(other.votesCount, votesCount) || other.votesCount == votesCount)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.votedByMe, votedByMe) || other.votedByMe == votedByMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,imageUrl,position,votesCount,percentage,votedByMe);

@override
String toString() {
  return 'PollOption(id: $id, text: $text, imageUrl: $imageUrl, position: $position, votesCount: $votesCount, percentage: $percentage, votedByMe: $votedByMe)';
}


}

/// @nodoc
abstract mixin class _$PollOptionCopyWith<$Res> implements $PollOptionCopyWith<$Res> {
  factory _$PollOptionCopyWith(_PollOption value, $Res Function(_PollOption) _then) = __$PollOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String text, String? imageUrl, int position, int votesCount, int percentage, bool votedByMe
});




}
/// @nodoc
class __$PollOptionCopyWithImpl<$Res>
    implements _$PollOptionCopyWith<$Res> {
  __$PollOptionCopyWithImpl(this._self, this._then);

  final _PollOption _self;
  final $Res Function(_PollOption) _then;

/// Create a copy of PollOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? imageUrl = freezed,Object? position = null,Object? votesCount = null,Object? percentage = null,Object? votedByMe = null,}) {
  return _then(_PollOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,votesCount: null == votesCount ? _self.votesCount : votesCount // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,votedByMe: null == votedByMe ? _self.votedByMe : votedByMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Poll {

 int get id; DateTime get expiresAt; bool get isExpired;/// 誰が何に入れたかを見せない投票。
 bool get isAnonymous; int get totalVotes; int? get ownVoteOptionId; List<PollOption> get options;
/// Create a copy of Poll
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollCopyWith<Poll> get copyWith => _$PollCopyWithImpl<Poll>(this as Poll, _$identity);

  /// Serializes this Poll to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Poll&&(identical(other.id, id) || other.id == id)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.isAnonymous, isAnonymous) || other.isAnonymous == isAnonymous)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&(identical(other.ownVoteOptionId, ownVoteOptionId) || other.ownVoteOptionId == ownVoteOptionId)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expiresAt,isExpired,isAnonymous,totalVotes,ownVoteOptionId,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'Poll(id: $id, expiresAt: $expiresAt, isExpired: $isExpired, isAnonymous: $isAnonymous, totalVotes: $totalVotes, ownVoteOptionId: $ownVoteOptionId, options: $options)';
}


}

/// @nodoc
abstract mixin class $PollCopyWith<$Res>  {
  factory $PollCopyWith(Poll value, $Res Function(Poll) _then) = _$PollCopyWithImpl;
@useResult
$Res call({
 int id, DateTime expiresAt, bool isExpired, bool isAnonymous, int totalVotes, int? ownVoteOptionId, List<PollOption> options
});




}
/// @nodoc
class _$PollCopyWithImpl<$Res>
    implements $PollCopyWith<$Res> {
  _$PollCopyWithImpl(this._self, this._then);

  final Poll _self;
  final $Res Function(Poll) _then;

/// Create a copy of Poll
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expiresAt = null,Object? isExpired = null,Object? isAnonymous = null,Object? totalVotes = null,Object? ownVoteOptionId = freezed,Object? options = null,}) {
  return _then(Poll(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool,isAnonymous: null == isAnonymous ? _self.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,totalVotes: null == totalVotes ? _self.totalVotes : totalVotes // ignore: cast_nullable_to_non_nullable
as int,ownVoteOptionId: freezed == ownVoteOptionId ? _self.ownVoteOptionId : ownVoteOptionId // ignore: cast_nullable_to_non_nullable
as int?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<PollOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [Poll].
extension PollPatterns on Poll {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Poll value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Poll() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Poll value)  $default,){
final _that = this;
switch (_that) {
case _Poll():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Poll value)?  $default,){
final _that = this;
switch (_that) {
case _Poll() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime expiresAt,  bool isExpired,  bool isAnonymous,  int totalVotes,  int? ownVoteOptionId,  List<PollOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Poll() when $default != null:
return $default(_that.id,_that.expiresAt,_that.isExpired,_that.isAnonymous,_that.totalVotes,_that.ownVoteOptionId,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime expiresAt,  bool isExpired,  bool isAnonymous,  int totalVotes,  int? ownVoteOptionId,  List<PollOption> options)  $default,) {final _that = this;
switch (_that) {
case _Poll():
return $default(_that.id,_that.expiresAt,_that.isExpired,_that.isAnonymous,_that.totalVotes,_that.ownVoteOptionId,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime expiresAt,  bool isExpired,  bool isAnonymous,  int totalVotes,  int? ownVoteOptionId,  List<PollOption> options)?  $default,) {final _that = this;
switch (_that) {
case _Poll() when $default != null:
return $default(_that.id,_that.expiresAt,_that.isExpired,_that.isAnonymous,_that.totalVotes,_that.ownVoteOptionId,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Poll implements Poll {
  const _Poll({required this.id, required this.expiresAt, required this.isExpired, this.isAnonymous = false, required this.totalVotes, this.ownVoteOptionId, required  List<PollOption> options}): _options = options;
  factory _Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

@override final  int id;
@override final  DateTime expiresAt;
@override final  bool isExpired;
/// 誰が何に入れたかを見せない投票。
@override@JsonKey() final  bool isAnonymous;
@override final  int totalVotes;
@override final  int? ownVoteOptionId;
 final  List<PollOption> _options;
@override List<PollOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of Poll
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PollCopyWith<_Poll> get copyWith => __$PollCopyWithImpl<_Poll>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PollToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Poll&&(identical(other.id, id) || other.id == id)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.isAnonymous, isAnonymous) || other.isAnonymous == isAnonymous)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&(identical(other.ownVoteOptionId, ownVoteOptionId) || other.ownVoteOptionId == ownVoteOptionId)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expiresAt,isExpired,isAnonymous,totalVotes,ownVoteOptionId,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'Poll(id: $id, expiresAt: $expiresAt, isExpired: $isExpired, isAnonymous: $isAnonymous, totalVotes: $totalVotes, ownVoteOptionId: $ownVoteOptionId, options: $options)';
}


}

/// @nodoc
abstract mixin class _$PollCopyWith<$Res> implements $PollCopyWith<$Res> {
  factory _$PollCopyWith(_Poll value, $Res Function(_Poll) _then) = __$PollCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime expiresAt, bool isExpired, bool isAnonymous, int totalVotes, int? ownVoteOptionId, List<PollOption> options
});




}
/// @nodoc
class __$PollCopyWithImpl<$Res>
    implements _$PollCopyWith<$Res> {
  __$PollCopyWithImpl(this._self, this._then);

  final _Poll _self;
  final $Res Function(_Poll) _then;

/// Create a copy of Poll
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expiresAt = null,Object? isExpired = null,Object? isAnonymous = null,Object? totalVotes = null,Object? ownVoteOptionId = freezed,Object? options = null,}) {
  return _then(_Poll(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool,isAnonymous: null == isAnonymous ? _self.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,totalVotes: null == totalVotes ? _self.totalVotes : totalVotes // ignore: cast_nullable_to_non_nullable
as int,ownVoteOptionId: freezed == ownVoteOptionId ? _self.ownVoteOptionId : ownVoteOptionId // ignore: cast_nullable_to_non_nullable
as int?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<PollOption>,
  ));
}


}


/// @nodoc
mixin _$ReactionSummary {

 int get count; String get emoji; bool get reacted;
/// Create a copy of ReactionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReactionSummaryCopyWith<ReactionSummary> get copyWith => _$ReactionSummaryCopyWithImpl<ReactionSummary>(this as ReactionSummary, _$identity);

  /// Serializes this ReactionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactionSummary&&(identical(other.count, count) || other.count == count)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.reacted, reacted) || other.reacted == reacted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,emoji,reacted);

@override
String toString() {
  return 'ReactionSummary(count: $count, emoji: $emoji, reacted: $reacted)';
}


}

/// @nodoc
abstract mixin class $ReactionSummaryCopyWith<$Res>  {
  factory $ReactionSummaryCopyWith(ReactionSummary value, $Res Function(ReactionSummary) _then) = _$ReactionSummaryCopyWithImpl;
@useResult
$Res call({
 int count, String emoji, bool reacted
});




}
/// @nodoc
class _$ReactionSummaryCopyWithImpl<$Res>
    implements $ReactionSummaryCopyWith<$Res> {
  _$ReactionSummaryCopyWithImpl(this._self, this._then);

  final ReactionSummary _self;
  final $Res Function(ReactionSummary) _then;

/// Create a copy of ReactionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? emoji = null,Object? reacted = null,}) {
  return _then(ReactionSummary(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,reacted: null == reacted ? _self.reacted : reacted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReactionSummary].
extension ReactionSummaryPatterns on ReactionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReactionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReactionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReactionSummary value)  $default,){
final _that = this;
switch (_that) {
case _ReactionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReactionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ReactionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String emoji,  bool reacted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReactionSummary() when $default != null:
return $default(_that.count,_that.emoji,_that.reacted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String emoji,  bool reacted)  $default,) {final _that = this;
switch (_that) {
case _ReactionSummary():
return $default(_that.count,_that.emoji,_that.reacted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String emoji,  bool reacted)?  $default,) {final _that = this;
switch (_that) {
case _ReactionSummary() when $default != null:
return $default(_that.count,_that.emoji,_that.reacted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReactionSummary implements ReactionSummary {
  const _ReactionSummary({required this.count, required this.emoji, required this.reacted});
  factory _ReactionSummary.fromJson(Map<String, dynamic> json) => _$ReactionSummaryFromJson(json);

@override final  int count;
@override final  String emoji;
@override final  bool reacted;

/// Create a copy of ReactionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactionSummaryCopyWith<_ReactionSummary> get copyWith => __$ReactionSummaryCopyWithImpl<_ReactionSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReactionSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReactionSummary&&(identical(other.count, count) || other.count == count)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.reacted, reacted) || other.reacted == reacted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,emoji,reacted);

@override
String toString() {
  return 'ReactionSummary(count: $count, emoji: $emoji, reacted: $reacted)';
}


}

/// @nodoc
abstract mixin class _$ReactionSummaryCopyWith<$Res> implements $ReactionSummaryCopyWith<$Res> {
  factory _$ReactionSummaryCopyWith(_ReactionSummary value, $Res Function(_ReactionSummary) _then) = __$ReactionSummaryCopyWithImpl;
@override @useResult
$Res call({
 int count, String emoji, bool reacted
});




}
/// @nodoc
class __$ReactionSummaryCopyWithImpl<$Res>
    implements _$ReactionSummaryCopyWith<$Res> {
  __$ReactionSummaryCopyWithImpl(this._self, this._then);

  final _ReactionSummary _self;
  final $Res Function(_ReactionSummary) _then;

/// Create a copy of ReactionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? emoji = null,Object? reacted = null,}) {
  return _then(_ReactionSummary(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,reacted: null == reacted ? _self.reacted : reacted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Reaction {

 String get emoji; int get userId;
/// Create a copy of Reaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReactionCopyWith<Reaction> get copyWith => _$ReactionCopyWithImpl<Reaction>(this as Reaction, _$identity);

  /// Serializes this Reaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reaction&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emoji,userId);

@override
String toString() {
  return 'Reaction(emoji: $emoji, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ReactionCopyWith<$Res>  {
  factory $ReactionCopyWith(Reaction value, $Res Function(Reaction) _then) = _$ReactionCopyWithImpl;
@useResult
$Res call({
 String emoji, int userId
});




}
/// @nodoc
class _$ReactionCopyWithImpl<$Res>
    implements $ReactionCopyWith<$Res> {
  _$ReactionCopyWithImpl(this._self, this._then);

  final Reaction _self;
  final $Res Function(Reaction) _then;

/// Create a copy of Reaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emoji = null,Object? userId = null,}) {
  return _then(Reaction(
emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Reaction].
extension ReactionPatterns on Reaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reaction value)  $default,){
final _that = this;
switch (_that) {
case _Reaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reaction value)?  $default,){
final _that = this;
switch (_that) {
case _Reaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String emoji,  int userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reaction() when $default != null:
return $default(_that.emoji,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String emoji,  int userId)  $default,) {final _that = this;
switch (_that) {
case _Reaction():
return $default(_that.emoji,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String emoji,  int userId)?  $default,) {final _that = this;
switch (_that) {
case _Reaction() when $default != null:
return $default(_that.emoji,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reaction implements Reaction {
  const _Reaction({required this.emoji, required this.userId});
  factory _Reaction.fromJson(Map<String, dynamic> json) => _$ReactionFromJson(json);

@override final  String emoji;
@override final  int userId;

/// Create a copy of Reaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactionCopyWith<_Reaction> get copyWith => __$ReactionCopyWithImpl<_Reaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reaction&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emoji,userId);

@override
String toString() {
  return 'Reaction(emoji: $emoji, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ReactionCopyWith<$Res> implements $ReactionCopyWith<$Res> {
  factory _$ReactionCopyWith(_Reaction value, $Res Function(_Reaction) _then) = __$ReactionCopyWithImpl;
@override @useResult
$Res call({
 String emoji, int userId
});




}
/// @nodoc
class __$ReactionCopyWithImpl<$Res>
    implements _$ReactionCopyWith<$Res> {
  __$ReactionCopyWithImpl(this._self, this._then);

  final _Reaction _self;
  final $Res Function(_Reaction) _then;

/// Create a copy of Reaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emoji = null,Object? userId = null,}) {
  return _then(_Reaction(
emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ReplyTarget {

 Author get user;/// `PARENT_AUTHOR` / `THREAD_PARTICIPANT` など。
 String get source; int? get id; int? get postId; int? get userId; DateTime? get createdAt;
/// Create a copy of ReplyTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyTargetCopyWith<ReplyTarget> get copyWith => _$ReplyTargetCopyWithImpl<ReplyTarget>(this as ReplyTarget, _$identity);

  /// Serializes this ReplyTarget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyTarget&&(identical(other.user, user) || other.user == user)&&(identical(other.source, source) || other.source == source)&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,source,id,postId,userId,createdAt);

@override
String toString() {
  return 'ReplyTarget(user: $user, source: $source, id: $id, postId: $postId, userId: $userId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReplyTargetCopyWith<$Res>  {
  factory $ReplyTargetCopyWith(ReplyTarget value, $Res Function(ReplyTarget) _then) = _$ReplyTargetCopyWithImpl;
@useResult
$Res call({
 Author user, String source, int? id, int? postId, int? userId, DateTime? createdAt
});


$AuthorCopyWith<$Res> get user;

}
/// @nodoc
class _$ReplyTargetCopyWithImpl<$Res>
    implements $ReplyTargetCopyWith<$Res> {
  _$ReplyTargetCopyWithImpl(this._self, this._then);

  final ReplyTarget _self;
  final $Res Function(ReplyTarget) _then;

/// Create a copy of ReplyTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? source = null,Object? id = freezed,Object? postId = freezed,Object? userId = freezed,Object? createdAt = freezed,}) {
  return _then(ReplyTarget(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Author,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ReplyTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get user {
  
  return $AuthorCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReplyTarget].
extension ReplyTargetPatterns on ReplyTarget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReplyTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReplyTarget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReplyTarget value)  $default,){
final _that = this;
switch (_that) {
case _ReplyTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReplyTarget value)?  $default,){
final _that = this;
switch (_that) {
case _ReplyTarget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Author user,  String source,  int? id,  int? postId,  int? userId,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReplyTarget() when $default != null:
return $default(_that.user,_that.source,_that.id,_that.postId,_that.userId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Author user,  String source,  int? id,  int? postId,  int? userId,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ReplyTarget():
return $default(_that.user,_that.source,_that.id,_that.postId,_that.userId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Author user,  String source,  int? id,  int? postId,  int? userId,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ReplyTarget() when $default != null:
return $default(_that.user,_that.source,_that.id,_that.postId,_that.userId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReplyTarget implements ReplyTarget {
  const _ReplyTarget({required this.user, this.source = '', this.id, this.postId, this.userId, this.createdAt});
  factory _ReplyTarget.fromJson(Map<String, dynamic> json) => _$ReplyTargetFromJson(json);

@override final  Author user;
/// `PARENT_AUTHOR` / `THREAD_PARTICIPANT` など。
@override@JsonKey() final  String source;
@override final  int? id;
@override final  int? postId;
@override final  int? userId;
@override final  DateTime? createdAt;

/// Create a copy of ReplyTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplyTargetCopyWith<_ReplyTarget> get copyWith => __$ReplyTargetCopyWithImpl<_ReplyTarget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReplyTargetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyTarget&&(identical(other.user, user) || other.user == user)&&(identical(other.source, source) || other.source == source)&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,source,id,postId,userId,createdAt);

@override
String toString() {
  return 'ReplyTarget(user: $user, source: $source, id: $id, postId: $postId, userId: $userId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReplyTargetCopyWith<$Res> implements $ReplyTargetCopyWith<$Res> {
  factory _$ReplyTargetCopyWith(_ReplyTarget value, $Res Function(_ReplyTarget) _then) = __$ReplyTargetCopyWithImpl;
@override @useResult
$Res call({
 Author user, String source, int? id, int? postId, int? userId, DateTime? createdAt
});


@override $AuthorCopyWith<$Res> get user;

}
/// @nodoc
class __$ReplyTargetCopyWithImpl<$Res>
    implements _$ReplyTargetCopyWith<$Res> {
  __$ReplyTargetCopyWithImpl(this._self, this._then);

  final _ReplyTarget _self;
  final $Res Function(_ReplyTarget) _then;

/// Create a copy of ReplyTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? source = null,Object? id = freezed,Object? postId = freezed,Object? userId = freezed,Object? createdAt = freezed,}) {
  return _then(_ReplyTarget(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Author,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ReplyTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get user {
  
  return $AuthorCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$HashTags {

 int get id; String? get name; int? get usageCount; int? get trendScore; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of HashTags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HashTagsCopyWith<HashTags> get copyWith => _$HashTagsCopyWithImpl<HashTags>(this as HashTags, _$identity);

  /// Serializes this HashTags to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HashTags&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.trendScore, trendScore) || other.trendScore == trendScore)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,usageCount,trendScore,createdAt,updatedAt);

@override
String toString() {
  return 'HashTags(id: $id, name: $name, usageCount: $usageCount, trendScore: $trendScore, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HashTagsCopyWith<$Res>  {
  factory $HashTagsCopyWith(HashTags value, $Res Function(HashTags) _then) = _$HashTagsCopyWithImpl;
@useResult
$Res call({
 int id, String? name, int? usageCount, int? trendScore, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$HashTagsCopyWithImpl<$Res>
    implements $HashTagsCopyWith<$Res> {
  _$HashTagsCopyWithImpl(this._self, this._then);

  final HashTags _self;
  final $Res Function(HashTags) _then;

/// Create a copy of HashTags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? usageCount = freezed,Object? trendScore = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(HashTags(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,usageCount: freezed == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int?,trendScore: freezed == trendScore ? _self.trendScore : trendScore // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HashTags].
extension HashTagsPatterns on HashTags {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HashTags value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HashTags() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HashTags value)  $default,){
final _that = this;
switch (_that) {
case _HashTags():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HashTags value)?  $default,){
final _that = this;
switch (_that) {
case _HashTags() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? name,  int? usageCount,  int? trendScore,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HashTags() when $default != null:
return $default(_that.id,_that.name,_that.usageCount,_that.trendScore,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? name,  int? usageCount,  int? trendScore,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _HashTags():
return $default(_that.id,_that.name,_that.usageCount,_that.trendScore,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? name,  int? usageCount,  int? trendScore,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HashTags() when $default != null:
return $default(_that.id,_that.name,_that.usageCount,_that.trendScore,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HashTags implements HashTags {
  const _HashTags({required this.id, required this.name, required this.usageCount, required this.trendScore, this.createdAt, this.updatedAt});
  factory _HashTags.fromJson(Map<String, dynamic> json) => _$HashTagsFromJson(json);

@override final  int id;
@override final  String? name;
@override final  int? usageCount;
@override final  int? trendScore;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of HashTags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HashTagsCopyWith<_HashTags> get copyWith => __$HashTagsCopyWithImpl<_HashTags>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HashTagsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HashTags&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.trendScore, trendScore) || other.trendScore == trendScore)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,usageCount,trendScore,createdAt,updatedAt);

@override
String toString() {
  return 'HashTags(id: $id, name: $name, usageCount: $usageCount, trendScore: $trendScore, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HashTagsCopyWith<$Res> implements $HashTagsCopyWith<$Res> {
  factory _$HashTagsCopyWith(_HashTags value, $Res Function(_HashTags) _then) = __$HashTagsCopyWithImpl;
@override @useResult
$Res call({
 int id, String? name, int? usageCount, int? trendScore, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$HashTagsCopyWithImpl<$Res>
    implements _$HashTagsCopyWith<$Res> {
  __$HashTagsCopyWithImpl(this._self, this._then);

  final _HashTags _self;
  final $Res Function(_HashTags) _then;

/// Create a copy of HashTags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? usageCount = freezed,Object? trendScore = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_HashTags(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,usageCount: freezed == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int?,trendScore: freezed == trendScore ? _self.trendScore : trendScore // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Trend {

/// 検索に投げる文字列。ハッシュタグなら `#` を含まない。
 String get token;/// 画面に出す文字列。
 String get label;/// `HASHTAG` / `KEYWORD` など。
 String get type; int get postCount; int get authorCount; int get usageCount; double get trendScore;
/// Create a copy of Trend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendCopyWith<Trend> get copyWith => _$TrendCopyWithImpl<Trend>(this as Trend, _$identity);

  /// Serializes this Trend to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trend&&(identical(other.token, token) || other.token == token)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.authorCount, authorCount) || other.authorCount == authorCount)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.trendScore, trendScore) || other.trendScore == trendScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,label,type,postCount,authorCount,usageCount,trendScore);

@override
String toString() {
  return 'Trend(token: $token, label: $label, type: $type, postCount: $postCount, authorCount: $authorCount, usageCount: $usageCount, trendScore: $trendScore)';
}


}

/// @nodoc
abstract mixin class $TrendCopyWith<$Res>  {
  factory $TrendCopyWith(Trend value, $Res Function(Trend) _then) = _$TrendCopyWithImpl;
@useResult
$Res call({
 String token, String label, String type, int postCount, int authorCount, int usageCount, double trendScore
});




}
/// @nodoc
class _$TrendCopyWithImpl<$Res>
    implements $TrendCopyWith<$Res> {
  _$TrendCopyWithImpl(this._self, this._then);

  final Trend _self;
  final $Res Function(Trend) _then;

/// Create a copy of Trend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? label = null,Object? type = null,Object? postCount = null,Object? authorCount = null,Object? usageCount = null,Object? trendScore = null,}) {
  return _then(Trend(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,authorCount: null == authorCount ? _self.authorCount : authorCount // ignore: cast_nullable_to_non_nullable
as int,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,trendScore: null == trendScore ? _self.trendScore : trendScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Trend].
extension TrendPatterns on Trend {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trend value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trend() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trend value)  $default,){
final _that = this;
switch (_that) {
case _Trend():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trend value)?  $default,){
final _that = this;
switch (_that) {
case _Trend() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String label,  String type,  int postCount,  int authorCount,  int usageCount,  double trendScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trend() when $default != null:
return $default(_that.token,_that.label,_that.type,_that.postCount,_that.authorCount,_that.usageCount,_that.trendScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String label,  String type,  int postCount,  int authorCount,  int usageCount,  double trendScore)  $default,) {final _that = this;
switch (_that) {
case _Trend():
return $default(_that.token,_that.label,_that.type,_that.postCount,_that.authorCount,_that.usageCount,_that.trendScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String label,  String type,  int postCount,  int authorCount,  int usageCount,  double trendScore)?  $default,) {final _that = this;
switch (_that) {
case _Trend() when $default != null:
return $default(_that.token,_that.label,_that.type,_that.postCount,_that.authorCount,_that.usageCount,_that.trendScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trend implements Trend {
  const _Trend({this.token = '', this.label = '', this.type = '', this.postCount = 0, this.authorCount = 0, this.usageCount = 0, this.trendScore = 0});
  factory _Trend.fromJson(Map<String, dynamic> json) => _$TrendFromJson(json);

/// 検索に投げる文字列。ハッシュタグなら `#` を含まない。
@override@JsonKey() final  String token;
/// 画面に出す文字列。
@override@JsonKey() final  String label;
/// `HASHTAG` / `KEYWORD` など。
@override@JsonKey() final  String type;
@override@JsonKey() final  int postCount;
@override@JsonKey() final  int authorCount;
@override@JsonKey() final  int usageCount;
@override@JsonKey() final  double trendScore;

/// Create a copy of Trend
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendCopyWith<_Trend> get copyWith => __$TrendCopyWithImpl<_Trend>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrendToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trend&&(identical(other.token, token) || other.token == token)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.authorCount, authorCount) || other.authorCount == authorCount)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.trendScore, trendScore) || other.trendScore == trendScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,label,type,postCount,authorCount,usageCount,trendScore);

@override
String toString() {
  return 'Trend(token: $token, label: $label, type: $type, postCount: $postCount, authorCount: $authorCount, usageCount: $usageCount, trendScore: $trendScore)';
}


}

/// @nodoc
abstract mixin class _$TrendCopyWith<$Res> implements $TrendCopyWith<$Res> {
  factory _$TrendCopyWith(_Trend value, $Res Function(_Trend) _then) = __$TrendCopyWithImpl;
@override @useResult
$Res call({
 String token, String label, String type, int postCount, int authorCount, int usageCount, double trendScore
});




}
/// @nodoc
class __$TrendCopyWithImpl<$Res>
    implements _$TrendCopyWith<$Res> {
  __$TrendCopyWithImpl(this._self, this._then);

  final _Trend _self;
  final $Res Function(_Trend) _then;

/// Create a copy of Trend
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? label = null,Object? type = null,Object? postCount = null,Object? authorCount = null,Object? usageCount = null,Object? trendScore = null,}) {
  return _then(_Trend(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,authorCount: null == authorCount ? _self.authorCount : authorCount // ignore: cast_nullable_to_non_nullable
as int,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,trendScore: null == trendScore ? _self.trendScore : trendScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$NotificationPost {

 int get id; String get content; Author get author; DateTime get createdAt; List<String> get mediaUrls; List<String> get mediaTypes;
/// Create a copy of NotificationPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPostCopyWith<NotificationPost> get copyWith => _$NotificationPostCopyWithImpl<NotificationPost>(this as NotificationPost, _$identity);

  /// Serializes this NotificationPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPost&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.author, author) || other.author == author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&const DeepCollectionEquality().equals(other.mediaTypes, mediaTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,author,createdAt,const DeepCollectionEquality().hash(mediaUrls),const DeepCollectionEquality().hash(mediaTypes));

@override
String toString() {
  return 'NotificationPost(id: $id, content: $content, author: $author, createdAt: $createdAt, mediaUrls: $mediaUrls, mediaTypes: $mediaTypes)';
}


}

/// @nodoc
abstract mixin class $NotificationPostCopyWith<$Res>  {
  factory $NotificationPostCopyWith(NotificationPost value, $Res Function(NotificationPost) _then) = _$NotificationPostCopyWithImpl;
@useResult
$Res call({
 int id, String content, Author author, DateTime createdAt, List<String> mediaUrls, List<String> mediaTypes
});


$AuthorCopyWith<$Res> get author;

}
/// @nodoc
class _$NotificationPostCopyWithImpl<$Res>
    implements $NotificationPostCopyWith<$Res> {
  _$NotificationPostCopyWithImpl(this._self, this._then);

  final NotificationPost _self;
  final $Res Function(NotificationPost) _then;

/// Create a copy of NotificationPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? author = null,Object? createdAt = null,Object? mediaUrls = null,Object? mediaTypes = null,}) {
  return _then(NotificationPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mediaTypes: null == mediaTypes ? _self.mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of NotificationPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationPost].
extension NotificationPostPatterns on NotificationPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPost value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPost value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String content,  Author author,  DateTime createdAt,  List<String> mediaUrls,  List<String> mediaTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPost() when $default != null:
return $default(_that.id,_that.content,_that.author,_that.createdAt,_that.mediaUrls,_that.mediaTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String content,  Author author,  DateTime createdAt,  List<String> mediaUrls,  List<String> mediaTypes)  $default,) {final _that = this;
switch (_that) {
case _NotificationPost():
return $default(_that.id,_that.content,_that.author,_that.createdAt,_that.mediaUrls,_that.mediaTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String content,  Author author,  DateTime createdAt,  List<String> mediaUrls,  List<String> mediaTypes)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPost() when $default != null:
return $default(_that.id,_that.content,_that.author,_that.createdAt,_that.mediaUrls,_that.mediaTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPost implements NotificationPost {
  const _NotificationPost({required this.id, required this.content, required this.author, required this.createdAt,  List<String> mediaUrls = const [],  List<String> mediaTypes = const []}): _mediaUrls = mediaUrls,_mediaTypes = mediaTypes;
  factory _NotificationPost.fromJson(Map<String, dynamic> json) => _$NotificationPostFromJson(json);

@override final  int id;
@override final  String content;
@override final  Author author;
@override final  DateTime createdAt;
 final  List<String> _mediaUrls;
@override@JsonKey() List<String> get mediaUrls {
  if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaUrls);
}

 final  List<String> _mediaTypes;
@override@JsonKey() List<String> get mediaTypes {
  if (_mediaTypes is EqualUnmodifiableListView) return _mediaTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaTypes);
}


/// Create a copy of NotificationPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPostCopyWith<_NotificationPost> get copyWith => __$NotificationPostCopyWithImpl<_NotificationPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPost&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.author, author) || other.author == author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&const DeepCollectionEquality().equals(other._mediaTypes, _mediaTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,author,createdAt,const DeepCollectionEquality().hash(_mediaUrls),const DeepCollectionEquality().hash(_mediaTypes));

@override
String toString() {
  return 'NotificationPost(id: $id, content: $content, author: $author, createdAt: $createdAt, mediaUrls: $mediaUrls, mediaTypes: $mediaTypes)';
}


}

/// @nodoc
abstract mixin class _$NotificationPostCopyWith<$Res> implements $NotificationPostCopyWith<$Res> {
  factory _$NotificationPostCopyWith(_NotificationPost value, $Res Function(_NotificationPost) _then) = __$NotificationPostCopyWithImpl;
@override @useResult
$Res call({
 int id, String content, Author author, DateTime createdAt, List<String> mediaUrls, List<String> mediaTypes
});


@override $AuthorCopyWith<$Res> get author;

}
/// @nodoc
class __$NotificationPostCopyWithImpl<$Res>
    implements _$NotificationPostCopyWith<$Res> {
  __$NotificationPostCopyWithImpl(this._self, this._then);

  final _NotificationPost _self;
  final $Res Function(_NotificationPost) _then;

/// Create a copy of NotificationPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? author = null,Object? createdAt = null,Object? mediaUrls = null,Object? mediaTypes = null,}) {
  return _then(_NotificationPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mediaTypes: null == mediaTypes ? _self._mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of NotificationPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// @nodoc
mixin _$HiddenPost {

 int get id; int? get authorId; int? get parentId; int? get quotedPostId;@JsonKey(unknownEnumValue: HiddenReason.UNKNOWN) HiddenReason get hiddenReason;@JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN) HiddenRelationDetail get hiddenRelationDetail;@JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN) HiddenFilterDetail get hiddenFilterDetail;
/// Create a copy of HiddenPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HiddenPostCopyWith<HiddenPost> get copyWith => _$HiddenPostCopyWithImpl<HiddenPost>(this as HiddenPost, _$identity);

  /// Serializes this HiddenPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HiddenPost&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.quotedPostId, quotedPostId) || other.quotedPostId == quotedPostId)&&(identical(other.hiddenReason, hiddenReason) || other.hiddenReason == hiddenReason)&&(identical(other.hiddenRelationDetail, hiddenRelationDetail) || other.hiddenRelationDetail == hiddenRelationDetail)&&(identical(other.hiddenFilterDetail, hiddenFilterDetail) || other.hiddenFilterDetail == hiddenFilterDetail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorId,parentId,quotedPostId,hiddenReason,hiddenRelationDetail,hiddenFilterDetail);

@override
String toString() {
  return 'HiddenPost(id: $id, authorId: $authorId, parentId: $parentId, quotedPostId: $quotedPostId, hiddenReason: $hiddenReason, hiddenRelationDetail: $hiddenRelationDetail, hiddenFilterDetail: $hiddenFilterDetail)';
}


}

/// @nodoc
abstract mixin class $HiddenPostCopyWith<$Res>  {
  factory $HiddenPostCopyWith(HiddenPost value, $Res Function(HiddenPost) _then) = _$HiddenPostCopyWithImpl;
@useResult
$Res call({
 int id, int? authorId, int? parentId, int? quotedPostId,@JsonKey(unknownEnumValue: HiddenReason.UNKNOWN) HiddenReason hiddenReason,@JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN) HiddenRelationDetail hiddenRelationDetail,@JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN) HiddenFilterDetail hiddenFilterDetail
});




}
/// @nodoc
class _$HiddenPostCopyWithImpl<$Res>
    implements $HiddenPostCopyWith<$Res> {
  _$HiddenPostCopyWithImpl(this._self, this._then);

  final HiddenPost _self;
  final $Res Function(HiddenPost) _then;

/// Create a copy of HiddenPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorId = freezed,Object? parentId = freezed,Object? quotedPostId = freezed,Object? hiddenReason = null,Object? hiddenRelationDetail = null,Object? hiddenFilterDetail = null,}) {
  return _then(HiddenPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,quotedPostId: freezed == quotedPostId ? _self.quotedPostId : quotedPostId // ignore: cast_nullable_to_non_nullable
as int?,hiddenReason: null == hiddenReason ? _self.hiddenReason : hiddenReason // ignore: cast_nullable_to_non_nullable
as HiddenReason,hiddenRelationDetail: null == hiddenRelationDetail ? _self.hiddenRelationDetail : hiddenRelationDetail // ignore: cast_nullable_to_non_nullable
as HiddenRelationDetail,hiddenFilterDetail: null == hiddenFilterDetail ? _self.hiddenFilterDetail : hiddenFilterDetail // ignore: cast_nullable_to_non_nullable
as HiddenFilterDetail,
  ));
}

}


/// Adds pattern-matching-related methods to [HiddenPost].
extension HiddenPostPatterns on HiddenPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HiddenPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HiddenPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HiddenPost value)  $default,){
final _that = this;
switch (_that) {
case _HiddenPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HiddenPost value)?  $default,){
final _that = this;
switch (_that) {
case _HiddenPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? authorId,  int? parentId,  int? quotedPostId, @JsonKey(unknownEnumValue: HiddenReason.UNKNOWN)  HiddenReason hiddenReason, @JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN)  HiddenRelationDetail hiddenRelationDetail, @JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN)  HiddenFilterDetail hiddenFilterDetail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HiddenPost() when $default != null:
return $default(_that.id,_that.authorId,_that.parentId,_that.quotedPostId,_that.hiddenReason,_that.hiddenRelationDetail,_that.hiddenFilterDetail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? authorId,  int? parentId,  int? quotedPostId, @JsonKey(unknownEnumValue: HiddenReason.UNKNOWN)  HiddenReason hiddenReason, @JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN)  HiddenRelationDetail hiddenRelationDetail, @JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN)  HiddenFilterDetail hiddenFilterDetail)  $default,) {final _that = this;
switch (_that) {
case _HiddenPost():
return $default(_that.id,_that.authorId,_that.parentId,_that.quotedPostId,_that.hiddenReason,_that.hiddenRelationDetail,_that.hiddenFilterDetail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? authorId,  int? parentId,  int? quotedPostId, @JsonKey(unknownEnumValue: HiddenReason.UNKNOWN)  HiddenReason hiddenReason, @JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN)  HiddenRelationDetail hiddenRelationDetail, @JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN)  HiddenFilterDetail hiddenFilterDetail)?  $default,) {final _that = this;
switch (_that) {
case _HiddenPost() when $default != null:
return $default(_that.id,_that.authorId,_that.parentId,_that.quotedPostId,_that.hiddenReason,_that.hiddenRelationDetail,_that.hiddenFilterDetail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HiddenPost implements HiddenPost {
  const _HiddenPost({required this.id, this.authorId, this.parentId, this.quotedPostId, @JsonKey(unknownEnumValue: HiddenReason.UNKNOWN) this.hiddenReason = HiddenReason.UNKNOWN, @JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN) this.hiddenRelationDetail = HiddenRelationDetail.UNKNOWN, @JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN) this.hiddenFilterDetail = HiddenFilterDetail.UNKNOWN});
  factory _HiddenPost.fromJson(Map<String, dynamic> json) => _$HiddenPostFromJson(json);

@override final  int id;
@override final  int? authorId;
@override final  int? parentId;
@override final  int? quotedPostId;
@override@JsonKey(unknownEnumValue: HiddenReason.UNKNOWN) final  HiddenReason hiddenReason;
@override@JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN) final  HiddenRelationDetail hiddenRelationDetail;
@override@JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN) final  HiddenFilterDetail hiddenFilterDetail;

/// Create a copy of HiddenPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HiddenPostCopyWith<_HiddenPost> get copyWith => __$HiddenPostCopyWithImpl<_HiddenPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HiddenPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HiddenPost&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.quotedPostId, quotedPostId) || other.quotedPostId == quotedPostId)&&(identical(other.hiddenReason, hiddenReason) || other.hiddenReason == hiddenReason)&&(identical(other.hiddenRelationDetail, hiddenRelationDetail) || other.hiddenRelationDetail == hiddenRelationDetail)&&(identical(other.hiddenFilterDetail, hiddenFilterDetail) || other.hiddenFilterDetail == hiddenFilterDetail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorId,parentId,quotedPostId,hiddenReason,hiddenRelationDetail,hiddenFilterDetail);

@override
String toString() {
  return 'HiddenPost(id: $id, authorId: $authorId, parentId: $parentId, quotedPostId: $quotedPostId, hiddenReason: $hiddenReason, hiddenRelationDetail: $hiddenRelationDetail, hiddenFilterDetail: $hiddenFilterDetail)';
}


}

/// @nodoc
abstract mixin class _$HiddenPostCopyWith<$Res> implements $HiddenPostCopyWith<$Res> {
  factory _$HiddenPostCopyWith(_HiddenPost value, $Res Function(_HiddenPost) _then) = __$HiddenPostCopyWithImpl;
@override @useResult
$Res call({
 int id, int? authorId, int? parentId, int? quotedPostId,@JsonKey(unknownEnumValue: HiddenReason.UNKNOWN) HiddenReason hiddenReason,@JsonKey(unknownEnumValue: HiddenRelationDetail.UNKNOWN) HiddenRelationDetail hiddenRelationDetail,@JsonKey(unknownEnumValue: HiddenFilterDetail.UNKNOWN) HiddenFilterDetail hiddenFilterDetail
});




}
/// @nodoc
class __$HiddenPostCopyWithImpl<$Res>
    implements _$HiddenPostCopyWith<$Res> {
  __$HiddenPostCopyWithImpl(this._self, this._then);

  final _HiddenPost _self;
  final $Res Function(_HiddenPost) _then;

/// Create a copy of HiddenPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorId = freezed,Object? parentId = freezed,Object? quotedPostId = freezed,Object? hiddenReason = null,Object? hiddenRelationDetail = null,Object? hiddenFilterDetail = null,}) {
  return _then(_HiddenPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,quotedPostId: freezed == quotedPostId ? _self.quotedPostId : quotedPostId // ignore: cast_nullable_to_non_nullable
as int?,hiddenReason: null == hiddenReason ? _self.hiddenReason : hiddenReason // ignore: cast_nullable_to_non_nullable
as HiddenReason,hiddenRelationDetail: null == hiddenRelationDetail ? _self.hiddenRelationDetail : hiddenRelationDetail // ignore: cast_nullable_to_non_nullable
as HiddenRelationDetail,hiddenFilterDetail: null == hiddenFilterDetail ? _self.hiddenFilterDetail : hiddenFilterDetail // ignore: cast_nullable_to_non_nullable
as HiddenFilterDetail,
  ));
}


}


/// @nodoc
mixin _$QuotedPost {

 int get id;/// `canView` が false でない限り必ず来る。Web も
/// `canView !== false && author` を満たすときだけ作者行を描いている。
 Author get author; DateTime get createdAt; String get content; List<String> get mediaUrls; List<String> get mediaTypes;
/// Create a copy of QuotedPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotedPostCopyWith<QuotedPost> get copyWith => _$QuotedPostCopyWithImpl<QuotedPost>(this as QuotedPost, _$identity);

  /// Serializes this QuotedPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotedPost&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&const DeepCollectionEquality().equals(other.mediaTypes, mediaTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,author,createdAt,content,const DeepCollectionEquality().hash(mediaUrls),const DeepCollectionEquality().hash(mediaTypes));

@override
String toString() {
  return 'QuotedPost(id: $id, author: $author, createdAt: $createdAt, content: $content, mediaUrls: $mediaUrls, mediaTypes: $mediaTypes)';
}


}

/// @nodoc
abstract mixin class $QuotedPostCopyWith<$Res>  {
  factory $QuotedPostCopyWith(QuotedPost value, $Res Function(QuotedPost) _then) = _$QuotedPostCopyWithImpl;
@useResult
$Res call({
 int id, Author author, DateTime createdAt, String content, List<String> mediaUrls, List<String> mediaTypes
});


$AuthorCopyWith<$Res> get author;

}
/// @nodoc
class _$QuotedPostCopyWithImpl<$Res>
    implements $QuotedPostCopyWith<$Res> {
  _$QuotedPostCopyWithImpl(this._self, this._then);

  final QuotedPost _self;
  final $Res Function(QuotedPost) _then;

/// Create a copy of QuotedPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? author = null,Object? createdAt = null,Object? content = null,Object? mediaUrls = null,Object? mediaTypes = null,}) {
  return _then(QuotedPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mediaTypes: null == mediaTypes ? _self.mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of QuotedPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuotedPost].
extension QuotedPostPatterns on QuotedPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuotedPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuotedPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuotedPost value)  $default,){
final _that = this;
switch (_that) {
case _QuotedPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuotedPost value)?  $default,){
final _that = this;
switch (_that) {
case _QuotedPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Author author,  DateTime createdAt,  String content,  List<String> mediaUrls,  List<String> mediaTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuotedPost() when $default != null:
return $default(_that.id,_that.author,_that.createdAt,_that.content,_that.mediaUrls,_that.mediaTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Author author,  DateTime createdAt,  String content,  List<String> mediaUrls,  List<String> mediaTypes)  $default,) {final _that = this;
switch (_that) {
case _QuotedPost():
return $default(_that.id,_that.author,_that.createdAt,_that.content,_that.mediaUrls,_that.mediaTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Author author,  DateTime createdAt,  String content,  List<String> mediaUrls,  List<String> mediaTypes)?  $default,) {final _that = this;
switch (_that) {
case _QuotedPost() when $default != null:
return $default(_that.id,_that.author,_that.createdAt,_that.content,_that.mediaUrls,_that.mediaTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuotedPost implements QuotedPost {
  const _QuotedPost({required this.id, required this.author, required this.createdAt, this.content = '',  List<String> mediaUrls = const [],  List<String> mediaTypes = const []}): _mediaUrls = mediaUrls,_mediaTypes = mediaTypes;
  factory _QuotedPost.fromJson(Map<String, dynamic> json) => _$QuotedPostFromJson(json);

@override final  int id;
/// `canView` が false でない限り必ず来る。Web も
/// `canView !== false && author` を満たすときだけ作者行を描いている。
@override final  Author author;
@override final  DateTime createdAt;
@override@JsonKey() final  String content;
 final  List<String> _mediaUrls;
@override@JsonKey() List<String> get mediaUrls {
  if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaUrls);
}

 final  List<String> _mediaTypes;
@override@JsonKey() List<String> get mediaTypes {
  if (_mediaTypes is EqualUnmodifiableListView) return _mediaTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaTypes);
}


/// Create a copy of QuotedPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuotedPostCopyWith<_QuotedPost> get copyWith => __$QuotedPostCopyWithImpl<_QuotedPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuotedPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuotedPost&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&const DeepCollectionEquality().equals(other._mediaTypes, _mediaTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,author,createdAt,content,const DeepCollectionEquality().hash(_mediaUrls),const DeepCollectionEquality().hash(_mediaTypes));

@override
String toString() {
  return 'QuotedPost(id: $id, author: $author, createdAt: $createdAt, content: $content, mediaUrls: $mediaUrls, mediaTypes: $mediaTypes)';
}


}

/// @nodoc
abstract mixin class _$QuotedPostCopyWith<$Res> implements $QuotedPostCopyWith<$Res> {
  factory _$QuotedPostCopyWith(_QuotedPost value, $Res Function(_QuotedPost) _then) = __$QuotedPostCopyWithImpl;
@override @useResult
$Res call({
 int id, Author author, DateTime createdAt, String content, List<String> mediaUrls, List<String> mediaTypes
});


@override $AuthorCopyWith<$Res> get author;

}
/// @nodoc
class __$QuotedPostCopyWithImpl<$Res>
    implements _$QuotedPostCopyWith<$Res> {
  __$QuotedPostCopyWithImpl(this._self, this._then);

  final _QuotedPost _self;
  final $Res Function(_QuotedPost) _then;

/// Create a copy of QuotedPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? author = null,Object? createdAt = null,Object? content = null,Object? mediaUrls = null,Object? mediaTypes = null,}) {
  return _then(_QuotedPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mediaTypes: null == mediaTypes ? _self._mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of QuotedPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// @nodoc
mixin _$Post {

/// 運営が強制的に非表示にした。作者本人の設定より優先される。
 bool get adminForceHidden;/// 運営が強制的に R18 扱いにした。作者の [isR18] より優先される。
 bool get adminForceR18; Author get author; int? get authorId;/// 一覧の種類によっては返らない。`/users/{id}/media` がそう。
 bool get bookmarked; int get bookmarksCount; bool get canInteract; bool get canQuote; String? get comment; String get content; DateTime get createdAt; DateTime? get editedAt; String? get embedDescription; String? get embedImage; String? get embedTitle; String? get embedUrl; List<int> get excludedMentions; bool get hasBlockedAuthor; List<HashTags> get hashtags;/// 未成年に見せない。
 bool get hideFromMinors; int get id; bool get isAiGenerated; bool get isBlockedByAuthor; bool get isMutedByViewer; bool get isPromotional;/// 作者が R18 として投稿した。表示前に伏せること。
 bool get isR18;/// 閲覧可能な年齢の上限。null なら制限無し。
 int? get maximumAge;/// 運営が上書きした年齢制限。
 int? get adminForceMinimumAge; int? get adminForceMaximumAge;/// 作者の設定と運営の上書きをサーバー側で合成した結果。
/// 年齢制限の判定はこちらを使う（[effectiveR18] と違い自前で計算しない）。
 int? get effectiveMinimumAge; int? get effectiveMaximumAge;/// コミュニティに投稿されたカロート。karotator はまだ画面を持たない。
 int? get communityId;/// 期限付きカロートの消滅時刻。
 DateTime? get expiresAt; bool get liked; int get likesCount; List<String> get mediaAlts; List<bool> get mediaR18Flags; List<bool> get mediaSpoilerFlags; List<String> get mediaTypes; List<String> get mediaUrls; List<MentionId> get mentions;/// 閲覧可能な年齢の下限。null なら制限無し。
 int? get minimumAge; int? get parentId; Poll? get poll;/// 引用した人数。エンドポイントによっては [quotePostsCount] で返る。
 int get quoteUsersCount; int get quotePostsCount;/// 引用元。**画面からは [PostX.quote] を読むこと。**
/// こちらを直接読むと `quotedPostId` だけがある場合の合成が効かない。
@QuoteConverter() Quote? get quotedPost; int? get quotedPostId; List<ReactionSummary> get reactionSummary; List<Reaction> get reactions; bool get rekaroted; Author? get rekarotedBy; int get rekarotsCount; int get repliesCount; Circle? get replyCircle; int? get replyCircleId;@JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN) ReplyRestriction get replyRestriction; List<ReplyTarget> get replyTargets; List<Author> get replyToUsers; DateTime? get updatedAt; Circle? get viewerCircle; int? get viewerCircleId; int get viewsCount;@JsonKey(unknownEnumValue: PostVisibility.UNKNOWN) PostVisibility get visibility;
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCopyWith<Post> get copyWith => _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Post&&(identical(other.adminForceHidden, adminForceHidden) || other.adminForceHidden == adminForceHidden)&&(identical(other.adminForceR18, adminForceR18) || other.adminForceR18 == adminForceR18)&&(identical(other.author, author) || other.author == author)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&(identical(other.bookmarksCount, bookmarksCount) || other.bookmarksCount == bookmarksCount)&&(identical(other.canInteract, canInteract) || other.canInteract == canInteract)&&(identical(other.canQuote, canQuote) || other.canQuote == canQuote)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.embedDescription, embedDescription) || other.embedDescription == embedDescription)&&(identical(other.embedImage, embedImage) || other.embedImage == embedImage)&&(identical(other.embedTitle, embedTitle) || other.embedTitle == embedTitle)&&(identical(other.embedUrl, embedUrl) || other.embedUrl == embedUrl)&&const DeepCollectionEquality().equals(other.excludedMentions, excludedMentions)&&(identical(other.hasBlockedAuthor, hasBlockedAuthor) || other.hasBlockedAuthor == hasBlockedAuthor)&&const DeepCollectionEquality().equals(other.hashtags, hashtags)&&(identical(other.hideFromMinors, hideFromMinors) || other.hideFromMinors == hideFromMinors)&&(identical(other.id, id) || other.id == id)&&(identical(other.isAiGenerated, isAiGenerated) || other.isAiGenerated == isAiGenerated)&&(identical(other.isBlockedByAuthor, isBlockedByAuthor) || other.isBlockedByAuthor == isBlockedByAuthor)&&(identical(other.isMutedByViewer, isMutedByViewer) || other.isMutedByViewer == isMutedByViewer)&&(identical(other.isPromotional, isPromotional) || other.isPromotional == isPromotional)&&(identical(other.isR18, isR18) || other.isR18 == isR18)&&(identical(other.maximumAge, maximumAge) || other.maximumAge == maximumAge)&&(identical(other.adminForceMinimumAge, adminForceMinimumAge) || other.adminForceMinimumAge == adminForceMinimumAge)&&(identical(other.adminForceMaximumAge, adminForceMaximumAge) || other.adminForceMaximumAge == adminForceMaximumAge)&&(identical(other.effectiveMinimumAge, effectiveMinimumAge) || other.effectiveMinimumAge == effectiveMinimumAge)&&(identical(other.effectiveMaximumAge, effectiveMaximumAge) || other.effectiveMaximumAge == effectiveMaximumAge)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&const DeepCollectionEquality().equals(other.mediaAlts, mediaAlts)&&const DeepCollectionEquality().equals(other.mediaR18Flags, mediaR18Flags)&&const DeepCollectionEquality().equals(other.mediaSpoilerFlags, mediaSpoilerFlags)&&const DeepCollectionEquality().equals(other.mediaTypes, mediaTypes)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&const DeepCollectionEquality().equals(other.mentions, mentions)&&(identical(other.minimumAge, minimumAge) || other.minimumAge == minimumAge)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.quoteUsersCount, quoteUsersCount) || other.quoteUsersCount == quoteUsersCount)&&(identical(other.quotePostsCount, quotePostsCount) || other.quotePostsCount == quotePostsCount)&&(identical(other.quotedPost, quotedPost) || other.quotedPost == quotedPost)&&(identical(other.quotedPostId, quotedPostId) || other.quotedPostId == quotedPostId)&&const DeepCollectionEquality().equals(other.reactionSummary, reactionSummary)&&const DeepCollectionEquality().equals(other.reactions, reactions)&&(identical(other.rekaroted, rekaroted) || other.rekaroted == rekaroted)&&(identical(other.rekarotedBy, rekarotedBy) || other.rekarotedBy == rekarotedBy)&&(identical(other.rekarotsCount, rekarotsCount) || other.rekarotsCount == rekarotsCount)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.replyCircle, replyCircle) || other.replyCircle == replyCircle)&&(identical(other.replyCircleId, replyCircleId) || other.replyCircleId == replyCircleId)&&(identical(other.replyRestriction, replyRestriction) || other.replyRestriction == replyRestriction)&&const DeepCollectionEquality().equals(other.replyTargets, replyTargets)&&const DeepCollectionEquality().equals(other.replyToUsers, replyToUsers)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.viewerCircle, viewerCircle) || other.viewerCircle == viewerCircle)&&(identical(other.viewerCircleId, viewerCircleId) || other.viewerCircleId == viewerCircleId)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adminForceHidden,adminForceR18,author,authorId,bookmarked,bookmarksCount,canInteract,canQuote,comment,content,createdAt,editedAt,embedDescription,embedImage,embedTitle,embedUrl,const DeepCollectionEquality().hash(excludedMentions),hasBlockedAuthor,const DeepCollectionEquality().hash(hashtags),hideFromMinors,id,isAiGenerated,isBlockedByAuthor,isMutedByViewer,isPromotional,isR18,maximumAge,adminForceMinimumAge,adminForceMaximumAge,effectiveMinimumAge,effectiveMaximumAge,communityId,expiresAt,liked,likesCount,const DeepCollectionEquality().hash(mediaAlts),const DeepCollectionEquality().hash(mediaR18Flags),const DeepCollectionEquality().hash(mediaSpoilerFlags),const DeepCollectionEquality().hash(mediaTypes),const DeepCollectionEquality().hash(mediaUrls),const DeepCollectionEquality().hash(mentions),minimumAge,parentId,poll,quoteUsersCount,quotePostsCount,quotedPost,quotedPostId,const DeepCollectionEquality().hash(reactionSummary),const DeepCollectionEquality().hash(reactions),rekaroted,rekarotedBy,rekarotsCount,repliesCount,replyCircle,replyCircleId,replyRestriction,const DeepCollectionEquality().hash(replyTargets),const DeepCollectionEquality().hash(replyToUsers),updatedAt,viewerCircle,viewerCircleId,viewsCount,visibility]);

@override
String toString() {
  return 'Post(adminForceHidden: $adminForceHidden, adminForceR18: $adminForceR18, author: $author, authorId: $authorId, bookmarked: $bookmarked, bookmarksCount: $bookmarksCount, canInteract: $canInteract, canQuote: $canQuote, comment: $comment, content: $content, createdAt: $createdAt, editedAt: $editedAt, embedDescription: $embedDescription, embedImage: $embedImage, embedTitle: $embedTitle, embedUrl: $embedUrl, excludedMentions: $excludedMentions, hasBlockedAuthor: $hasBlockedAuthor, hashtags: $hashtags, hideFromMinors: $hideFromMinors, id: $id, isAiGenerated: $isAiGenerated, isBlockedByAuthor: $isBlockedByAuthor, isMutedByViewer: $isMutedByViewer, isPromotional: $isPromotional, isR18: $isR18, maximumAge: $maximumAge, adminForceMinimumAge: $adminForceMinimumAge, adminForceMaximumAge: $adminForceMaximumAge, effectiveMinimumAge: $effectiveMinimumAge, effectiveMaximumAge: $effectiveMaximumAge, communityId: $communityId, expiresAt: $expiresAt, liked: $liked, likesCount: $likesCount, mediaAlts: $mediaAlts, mediaR18Flags: $mediaR18Flags, mediaSpoilerFlags: $mediaSpoilerFlags, mediaTypes: $mediaTypes, mediaUrls: $mediaUrls, mentions: $mentions, minimumAge: $minimumAge, parentId: $parentId, poll: $poll, quoteUsersCount: $quoteUsersCount, quotePostsCount: $quotePostsCount, quotedPost: $quotedPost, quotedPostId: $quotedPostId, reactionSummary: $reactionSummary, reactions: $reactions, rekaroted: $rekaroted, rekarotedBy: $rekarotedBy, rekarotsCount: $rekarotsCount, repliesCount: $repliesCount, replyCircle: $replyCircle, replyCircleId: $replyCircleId, replyRestriction: $replyRestriction, replyTargets: $replyTargets, replyToUsers: $replyToUsers, updatedAt: $updatedAt, viewerCircle: $viewerCircle, viewerCircleId: $viewerCircleId, viewsCount: $viewsCount, visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class $PostCopyWith<$Res>  {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) = _$PostCopyWithImpl;
@useResult
$Res call({
 bool adminForceHidden, bool adminForceR18, Author author, int? authorId, bool bookmarked, int bookmarksCount, bool canInteract, bool canQuote, String? comment, String content, DateTime createdAt, DateTime? editedAt, String? embedDescription, String? embedImage, String? embedTitle, String? embedUrl, List<int> excludedMentions, bool hasBlockedAuthor, List<HashTags> hashtags, bool hideFromMinors, int id, bool isAiGenerated, bool isBlockedByAuthor, bool isMutedByViewer, bool isPromotional, bool isR18, int? maximumAge, int? adminForceMinimumAge, int? adminForceMaximumAge, int? effectiveMinimumAge, int? effectiveMaximumAge, int? communityId, DateTime? expiresAt, bool liked, int likesCount, List<String> mediaAlts, List<bool> mediaR18Flags, List<bool> mediaSpoilerFlags, List<String> mediaTypes, List<String> mediaUrls, List<MentionId> mentions, int? minimumAge, int? parentId, Poll? poll, int quoteUsersCount, int quotePostsCount,@QuoteConverter() Quote? quotedPost, int? quotedPostId, List<ReactionSummary> reactionSummary, List<Reaction> reactions, bool rekaroted, Author? rekarotedBy, int rekarotsCount, int repliesCount, Circle? replyCircle, int? replyCircleId,@JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN) ReplyRestriction replyRestriction, List<ReplyTarget> replyTargets, List<Author> replyToUsers, DateTime? updatedAt, Circle? viewerCircle, int? viewerCircleId, int viewsCount,@JsonKey(unknownEnumValue: PostVisibility.UNKNOWN) PostVisibility visibility
});


$AuthorCopyWith<$Res> get author;$PollCopyWith<$Res>? get poll;$AuthorCopyWith<$Res>? get rekarotedBy;$CircleCopyWith<$Res>? get replyCircle;$CircleCopyWith<$Res>? get viewerCircle;

}
/// @nodoc
class _$PostCopyWithImpl<$Res>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adminForceHidden = null,Object? adminForceR18 = null,Object? author = null,Object? authorId = freezed,Object? bookmarked = null,Object? bookmarksCount = null,Object? canInteract = null,Object? canQuote = null,Object? comment = freezed,Object? content = null,Object? createdAt = null,Object? editedAt = freezed,Object? embedDescription = freezed,Object? embedImage = freezed,Object? embedTitle = freezed,Object? embedUrl = freezed,Object? excludedMentions = null,Object? hasBlockedAuthor = null,Object? hashtags = null,Object? hideFromMinors = null,Object? id = null,Object? isAiGenerated = null,Object? isBlockedByAuthor = null,Object? isMutedByViewer = null,Object? isPromotional = null,Object? isR18 = null,Object? maximumAge = freezed,Object? adminForceMinimumAge = freezed,Object? adminForceMaximumAge = freezed,Object? effectiveMinimumAge = freezed,Object? effectiveMaximumAge = freezed,Object? communityId = freezed,Object? expiresAt = freezed,Object? liked = null,Object? likesCount = null,Object? mediaAlts = null,Object? mediaR18Flags = null,Object? mediaSpoilerFlags = null,Object? mediaTypes = null,Object? mediaUrls = null,Object? mentions = null,Object? minimumAge = freezed,Object? parentId = freezed,Object? poll = freezed,Object? quoteUsersCount = null,Object? quotePostsCount = null,Object? quotedPost = freezed,Object? quotedPostId = freezed,Object? reactionSummary = null,Object? reactions = null,Object? rekaroted = null,Object? rekarotedBy = freezed,Object? rekarotsCount = null,Object? repliesCount = null,Object? replyCircle = freezed,Object? replyCircleId = freezed,Object? replyRestriction = null,Object? replyTargets = null,Object? replyToUsers = null,Object? updatedAt = freezed,Object? viewerCircle = freezed,Object? viewerCircleId = freezed,Object? viewsCount = null,Object? visibility = null,}) {
  return _then(Post(
adminForceHidden: null == adminForceHidden ? _self.adminForceHidden : adminForceHidden // ignore: cast_nullable_to_non_nullable
as bool,adminForceR18: null == adminForceR18 ? _self.adminForceR18 : adminForceR18 // ignore: cast_nullable_to_non_nullable
as bool,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,bookmarksCount: null == bookmarksCount ? _self.bookmarksCount : bookmarksCount // ignore: cast_nullable_to_non_nullable
as int,canInteract: null == canInteract ? _self.canInteract : canInteract // ignore: cast_nullable_to_non_nullable
as bool,canQuote: null == canQuote ? _self.canQuote : canQuote // ignore: cast_nullable_to_non_nullable
as bool,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,embedDescription: freezed == embedDescription ? _self.embedDescription : embedDescription // ignore: cast_nullable_to_non_nullable
as String?,embedImage: freezed == embedImage ? _self.embedImage : embedImage // ignore: cast_nullable_to_non_nullable
as String?,embedTitle: freezed == embedTitle ? _self.embedTitle : embedTitle // ignore: cast_nullable_to_non_nullable
as String?,embedUrl: freezed == embedUrl ? _self.embedUrl : embedUrl // ignore: cast_nullable_to_non_nullable
as String?,excludedMentions: null == excludedMentions ? _self.excludedMentions : excludedMentions // ignore: cast_nullable_to_non_nullable
as List<int>,hasBlockedAuthor: null == hasBlockedAuthor ? _self.hasBlockedAuthor : hasBlockedAuthor // ignore: cast_nullable_to_non_nullable
as bool,hashtags: null == hashtags ? _self.hashtags : hashtags // ignore: cast_nullable_to_non_nullable
as List<HashTags>,hideFromMinors: null == hideFromMinors ? _self.hideFromMinors : hideFromMinors // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isAiGenerated: null == isAiGenerated ? _self.isAiGenerated : isAiGenerated // ignore: cast_nullable_to_non_nullable
as bool,isBlockedByAuthor: null == isBlockedByAuthor ? _self.isBlockedByAuthor : isBlockedByAuthor // ignore: cast_nullable_to_non_nullable
as bool,isMutedByViewer: null == isMutedByViewer ? _self.isMutedByViewer : isMutedByViewer // ignore: cast_nullable_to_non_nullable
as bool,isPromotional: null == isPromotional ? _self.isPromotional : isPromotional // ignore: cast_nullable_to_non_nullable
as bool,isR18: null == isR18 ? _self.isR18 : isR18 // ignore: cast_nullable_to_non_nullable
as bool,maximumAge: freezed == maximumAge ? _self.maximumAge : maximumAge // ignore: cast_nullable_to_non_nullable
as int?,adminForceMinimumAge: freezed == adminForceMinimumAge ? _self.adminForceMinimumAge : adminForceMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,adminForceMaximumAge: freezed == adminForceMaximumAge ? _self.adminForceMaximumAge : adminForceMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,effectiveMinimumAge: freezed == effectiveMinimumAge ? _self.effectiveMinimumAge : effectiveMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,effectiveMaximumAge: freezed == effectiveMaximumAge ? _self.effectiveMaximumAge : effectiveMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,mediaAlts: null == mediaAlts ? _self.mediaAlts : mediaAlts // ignore: cast_nullable_to_non_nullable
as List<String>,mediaR18Flags: null == mediaR18Flags ? _self.mediaR18Flags : mediaR18Flags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaSpoilerFlags: null == mediaSpoilerFlags ? _self.mediaSpoilerFlags : mediaSpoilerFlags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaTypes: null == mediaTypes ? _self.mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mentions: null == mentions ? _self.mentions : mentions // ignore: cast_nullable_to_non_nullable
as List<MentionId>,minimumAge: freezed == minimumAge ? _self.minimumAge : minimumAge // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,quoteUsersCount: null == quoteUsersCount ? _self.quoteUsersCount : quoteUsersCount // ignore: cast_nullable_to_non_nullable
as int,quotePostsCount: null == quotePostsCount ? _self.quotePostsCount : quotePostsCount // ignore: cast_nullable_to_non_nullable
as int,quotedPost: freezed == quotedPost ? _self.quotedPost : quotedPost // ignore: cast_nullable_to_non_nullable
as Quote?,quotedPostId: freezed == quotedPostId ? _self.quotedPostId : quotedPostId // ignore: cast_nullable_to_non_nullable
as int?,reactionSummary: null == reactionSummary ? _self.reactionSummary : reactionSummary // ignore: cast_nullable_to_non_nullable
as List<ReactionSummary>,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<Reaction>,rekaroted: null == rekaroted ? _self.rekaroted : rekaroted // ignore: cast_nullable_to_non_nullable
as bool,rekarotedBy: freezed == rekarotedBy ? _self.rekarotedBy : rekarotedBy // ignore: cast_nullable_to_non_nullable
as Author?,rekarotsCount: null == rekarotsCount ? _self.rekarotsCount : rekarotsCount // ignore: cast_nullable_to_non_nullable
as int,repliesCount: null == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int,replyCircle: freezed == replyCircle ? _self.replyCircle : replyCircle // ignore: cast_nullable_to_non_nullable
as Circle?,replyCircleId: freezed == replyCircleId ? _self.replyCircleId : replyCircleId // ignore: cast_nullable_to_non_nullable
as int?,replyRestriction: null == replyRestriction ? _self.replyRestriction : replyRestriction // ignore: cast_nullable_to_non_nullable
as ReplyRestriction,replyTargets: null == replyTargets ? _self.replyTargets : replyTargets // ignore: cast_nullable_to_non_nullable
as List<ReplyTarget>,replyToUsers: null == replyToUsers ? _self.replyToUsers : replyToUsers // ignore: cast_nullable_to_non_nullable
as List<Author>,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,viewerCircle: freezed == viewerCircle ? _self.viewerCircle : viewerCircle // ignore: cast_nullable_to_non_nullable
as Circle?,viewerCircleId: freezed == viewerCircleId ? _self.viewerCircleId : viewerCircleId // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as PostVisibility,
  ));
}
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res>? get poll {
    if (_self.poll == null) {
    return null;
  }

  return $PollCopyWith<$Res>(_self.poll!, (value) {
    return _then(_self.copyWith(poll: value));
  });
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res>? get rekarotedBy {
    if (_self.rekarotedBy == null) {
    return null;
  }

  return $AuthorCopyWith<$Res>(_self.rekarotedBy!, (value) {
    return _then(_self.copyWith(rekarotedBy: value));
  });
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CircleCopyWith<$Res>? get replyCircle {
    if (_self.replyCircle == null) {
    return null;
  }

  return $CircleCopyWith<$Res>(_self.replyCircle!, (value) {
    return _then(_self.copyWith(replyCircle: value));
  });
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CircleCopyWith<$Res>? get viewerCircle {
    if (_self.viewerCircle == null) {
    return null;
  }

  return $CircleCopyWith<$Res>(_self.viewerCircle!, (value) {
    return _then(_self.copyWith(viewerCircle: value));
  });
}
}


/// Adds pattern-matching-related methods to [Post].
extension PostPatterns on Post {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Post value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Post() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Post value)  $default,){
final _that = this;
switch (_that) {
case _Post():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Post value)?  $default,){
final _that = this;
switch (_that) {
case _Post() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool adminForceHidden,  bool adminForceR18,  Author author,  int? authorId,  bool bookmarked,  int bookmarksCount,  bool canInteract,  bool canQuote,  String? comment,  String content,  DateTime createdAt,  DateTime? editedAt,  String? embedDescription,  String? embedImage,  String? embedTitle,  String? embedUrl,  List<int> excludedMentions,  bool hasBlockedAuthor,  List<HashTags> hashtags,  bool hideFromMinors,  int id,  bool isAiGenerated,  bool isBlockedByAuthor,  bool isMutedByViewer,  bool isPromotional,  bool isR18,  int? maximumAge,  int? adminForceMinimumAge,  int? adminForceMaximumAge,  int? effectiveMinimumAge,  int? effectiveMaximumAge,  int? communityId,  DateTime? expiresAt,  bool liked,  int likesCount,  List<String> mediaAlts,  List<bool> mediaR18Flags,  List<bool> mediaSpoilerFlags,  List<String> mediaTypes,  List<String> mediaUrls,  List<MentionId> mentions,  int? minimumAge,  int? parentId,  Poll? poll,  int quoteUsersCount,  int quotePostsCount, @QuoteConverter()  Quote? quotedPost,  int? quotedPostId,  List<ReactionSummary> reactionSummary,  List<Reaction> reactions,  bool rekaroted,  Author? rekarotedBy,  int rekarotsCount,  int repliesCount,  Circle? replyCircle,  int? replyCircleId, @JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN)  ReplyRestriction replyRestriction,  List<ReplyTarget> replyTargets,  List<Author> replyToUsers,  DateTime? updatedAt,  Circle? viewerCircle,  int? viewerCircleId,  int viewsCount, @JsonKey(unknownEnumValue: PostVisibility.UNKNOWN)  PostVisibility visibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.adminForceHidden,_that.adminForceR18,_that.author,_that.authorId,_that.bookmarked,_that.bookmarksCount,_that.canInteract,_that.canQuote,_that.comment,_that.content,_that.createdAt,_that.editedAt,_that.embedDescription,_that.embedImage,_that.embedTitle,_that.embedUrl,_that.excludedMentions,_that.hasBlockedAuthor,_that.hashtags,_that.hideFromMinors,_that.id,_that.isAiGenerated,_that.isBlockedByAuthor,_that.isMutedByViewer,_that.isPromotional,_that.isR18,_that.maximumAge,_that.adminForceMinimumAge,_that.adminForceMaximumAge,_that.effectiveMinimumAge,_that.effectiveMaximumAge,_that.communityId,_that.expiresAt,_that.liked,_that.likesCount,_that.mediaAlts,_that.mediaR18Flags,_that.mediaSpoilerFlags,_that.mediaTypes,_that.mediaUrls,_that.mentions,_that.minimumAge,_that.parentId,_that.poll,_that.quoteUsersCount,_that.quotePostsCount,_that.quotedPost,_that.quotedPostId,_that.reactionSummary,_that.reactions,_that.rekaroted,_that.rekarotedBy,_that.rekarotsCount,_that.repliesCount,_that.replyCircle,_that.replyCircleId,_that.replyRestriction,_that.replyTargets,_that.replyToUsers,_that.updatedAt,_that.viewerCircle,_that.viewerCircleId,_that.viewsCount,_that.visibility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool adminForceHidden,  bool adminForceR18,  Author author,  int? authorId,  bool bookmarked,  int bookmarksCount,  bool canInteract,  bool canQuote,  String? comment,  String content,  DateTime createdAt,  DateTime? editedAt,  String? embedDescription,  String? embedImage,  String? embedTitle,  String? embedUrl,  List<int> excludedMentions,  bool hasBlockedAuthor,  List<HashTags> hashtags,  bool hideFromMinors,  int id,  bool isAiGenerated,  bool isBlockedByAuthor,  bool isMutedByViewer,  bool isPromotional,  bool isR18,  int? maximumAge,  int? adminForceMinimumAge,  int? adminForceMaximumAge,  int? effectiveMinimumAge,  int? effectiveMaximumAge,  int? communityId,  DateTime? expiresAt,  bool liked,  int likesCount,  List<String> mediaAlts,  List<bool> mediaR18Flags,  List<bool> mediaSpoilerFlags,  List<String> mediaTypes,  List<String> mediaUrls,  List<MentionId> mentions,  int? minimumAge,  int? parentId,  Poll? poll,  int quoteUsersCount,  int quotePostsCount, @QuoteConverter()  Quote? quotedPost,  int? quotedPostId,  List<ReactionSummary> reactionSummary,  List<Reaction> reactions,  bool rekaroted,  Author? rekarotedBy,  int rekarotsCount,  int repliesCount,  Circle? replyCircle,  int? replyCircleId, @JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN)  ReplyRestriction replyRestriction,  List<ReplyTarget> replyTargets,  List<Author> replyToUsers,  DateTime? updatedAt,  Circle? viewerCircle,  int? viewerCircleId,  int viewsCount, @JsonKey(unknownEnumValue: PostVisibility.UNKNOWN)  PostVisibility visibility)  $default,) {final _that = this;
switch (_that) {
case _Post():
return $default(_that.adminForceHidden,_that.adminForceR18,_that.author,_that.authorId,_that.bookmarked,_that.bookmarksCount,_that.canInteract,_that.canQuote,_that.comment,_that.content,_that.createdAt,_that.editedAt,_that.embedDescription,_that.embedImage,_that.embedTitle,_that.embedUrl,_that.excludedMentions,_that.hasBlockedAuthor,_that.hashtags,_that.hideFromMinors,_that.id,_that.isAiGenerated,_that.isBlockedByAuthor,_that.isMutedByViewer,_that.isPromotional,_that.isR18,_that.maximumAge,_that.adminForceMinimumAge,_that.adminForceMaximumAge,_that.effectiveMinimumAge,_that.effectiveMaximumAge,_that.communityId,_that.expiresAt,_that.liked,_that.likesCount,_that.mediaAlts,_that.mediaR18Flags,_that.mediaSpoilerFlags,_that.mediaTypes,_that.mediaUrls,_that.mentions,_that.minimumAge,_that.parentId,_that.poll,_that.quoteUsersCount,_that.quotePostsCount,_that.quotedPost,_that.quotedPostId,_that.reactionSummary,_that.reactions,_that.rekaroted,_that.rekarotedBy,_that.rekarotsCount,_that.repliesCount,_that.replyCircle,_that.replyCircleId,_that.replyRestriction,_that.replyTargets,_that.replyToUsers,_that.updatedAt,_that.viewerCircle,_that.viewerCircleId,_that.viewsCount,_that.visibility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool adminForceHidden,  bool adminForceR18,  Author author,  int? authorId,  bool bookmarked,  int bookmarksCount,  bool canInteract,  bool canQuote,  String? comment,  String content,  DateTime createdAt,  DateTime? editedAt,  String? embedDescription,  String? embedImage,  String? embedTitle,  String? embedUrl,  List<int> excludedMentions,  bool hasBlockedAuthor,  List<HashTags> hashtags,  bool hideFromMinors,  int id,  bool isAiGenerated,  bool isBlockedByAuthor,  bool isMutedByViewer,  bool isPromotional,  bool isR18,  int? maximumAge,  int? adminForceMinimumAge,  int? adminForceMaximumAge,  int? effectiveMinimumAge,  int? effectiveMaximumAge,  int? communityId,  DateTime? expiresAt,  bool liked,  int likesCount,  List<String> mediaAlts,  List<bool> mediaR18Flags,  List<bool> mediaSpoilerFlags,  List<String> mediaTypes,  List<String> mediaUrls,  List<MentionId> mentions,  int? minimumAge,  int? parentId,  Poll? poll,  int quoteUsersCount,  int quotePostsCount, @QuoteConverter()  Quote? quotedPost,  int? quotedPostId,  List<ReactionSummary> reactionSummary,  List<Reaction> reactions,  bool rekaroted,  Author? rekarotedBy,  int rekarotsCount,  int repliesCount,  Circle? replyCircle,  int? replyCircleId, @JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN)  ReplyRestriction replyRestriction,  List<ReplyTarget> replyTargets,  List<Author> replyToUsers,  DateTime? updatedAt,  Circle? viewerCircle,  int? viewerCircleId,  int viewsCount, @JsonKey(unknownEnumValue: PostVisibility.UNKNOWN)  PostVisibility visibility)?  $default,) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.adminForceHidden,_that.adminForceR18,_that.author,_that.authorId,_that.bookmarked,_that.bookmarksCount,_that.canInteract,_that.canQuote,_that.comment,_that.content,_that.createdAt,_that.editedAt,_that.embedDescription,_that.embedImage,_that.embedTitle,_that.embedUrl,_that.excludedMentions,_that.hasBlockedAuthor,_that.hashtags,_that.hideFromMinors,_that.id,_that.isAiGenerated,_that.isBlockedByAuthor,_that.isMutedByViewer,_that.isPromotional,_that.isR18,_that.maximumAge,_that.adminForceMinimumAge,_that.adminForceMaximumAge,_that.effectiveMinimumAge,_that.effectiveMaximumAge,_that.communityId,_that.expiresAt,_that.liked,_that.likesCount,_that.mediaAlts,_that.mediaR18Flags,_that.mediaSpoilerFlags,_that.mediaTypes,_that.mediaUrls,_that.mentions,_that.minimumAge,_that.parentId,_that.poll,_that.quoteUsersCount,_that.quotePostsCount,_that.quotedPost,_that.quotedPostId,_that.reactionSummary,_that.reactions,_that.rekaroted,_that.rekarotedBy,_that.rekarotsCount,_that.repliesCount,_that.replyCircle,_that.replyCircleId,_that.replyRestriction,_that.replyTargets,_that.replyToUsers,_that.updatedAt,_that.viewerCircle,_that.viewerCircleId,_that.viewsCount,_that.visibility);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Post implements Post {
  const _Post({this.adminForceHidden = false, this.adminForceR18 = false, required this.author, this.authorId, this.bookmarked = false, this.bookmarksCount = 0, this.canInteract = true, this.canQuote = true, this.comment, this.content = "", required this.createdAt, this.editedAt, this.embedDescription, this.embedImage, this.embedTitle, this.embedUrl,  List<int> excludedMentions = const [], this.hasBlockedAuthor = true,  List<HashTags> hashtags = const [], this.hideFromMinors = false, required this.id, this.isAiGenerated = false, this.isBlockedByAuthor = false, this.isMutedByViewer = false, this.isPromotional = false, this.isR18 = false, this.maximumAge, this.adminForceMinimumAge, this.adminForceMaximumAge, this.effectiveMinimumAge, this.effectiveMaximumAge, this.communityId, this.expiresAt, this.liked = false, this.likesCount = 0,  List<String> mediaAlts = const [],  List<bool> mediaR18Flags = const [],  List<bool> mediaSpoilerFlags = const [],  List<String> mediaTypes = const [],  List<String> mediaUrls = const [],  List<MentionId> mentions = const [], this.minimumAge, this.parentId, this.poll, this.quoteUsersCount = 0, this.quotePostsCount = 0, @QuoteConverter() this.quotedPost, this.quotedPostId,  List<ReactionSummary> reactionSummary = const [],  List<Reaction> reactions = const [], this.rekaroted = false, this.rekarotedBy, this.rekarotsCount = 0, this.repliesCount = 0, this.replyCircle, this.replyCircleId, @JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN) this.replyRestriction = ReplyRestriction.EVERYONE,  List<ReplyTarget> replyTargets = const [],  List<Author> replyToUsers = const [], this.updatedAt, this.viewerCircle, this.viewerCircleId, this.viewsCount = 0, @JsonKey(unknownEnumValue: PostVisibility.UNKNOWN) this.visibility = PostVisibility.PUBLIC}): _excludedMentions = excludedMentions,_hashtags = hashtags,_mediaAlts = mediaAlts,_mediaR18Flags = mediaR18Flags,_mediaSpoilerFlags = mediaSpoilerFlags,_mediaTypes = mediaTypes,_mediaUrls = mediaUrls,_mentions = mentions,_reactionSummary = reactionSummary,_reactions = reactions,_replyTargets = replyTargets,_replyToUsers = replyToUsers;
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

/// 運営が強制的に非表示にした。作者本人の設定より優先される。
@override@JsonKey() final  bool adminForceHidden;
/// 運営が強制的に R18 扱いにした。作者の [isR18] より優先される。
@override@JsonKey() final  bool adminForceR18;
@override final  Author author;
@override final  int? authorId;
/// 一覧の種類によっては返らない。`/users/{id}/media` がそう。
@override@JsonKey() final  bool bookmarked;
@override@JsonKey() final  int bookmarksCount;
@override@JsonKey() final  bool canInteract;
@override@JsonKey() final  bool canQuote;
@override final  String? comment;
@override@JsonKey() final  String content;
@override final  DateTime createdAt;
@override final  DateTime? editedAt;
@override final  String? embedDescription;
@override final  String? embedImage;
@override final  String? embedTitle;
@override final  String? embedUrl;
 final  List<int> _excludedMentions;
@override@JsonKey() List<int> get excludedMentions {
  if (_excludedMentions is EqualUnmodifiableListView) return _excludedMentions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludedMentions);
}

@override@JsonKey() final  bool hasBlockedAuthor;
 final  List<HashTags> _hashtags;
@override@JsonKey() List<HashTags> get hashtags {
  if (_hashtags is EqualUnmodifiableListView) return _hashtags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hashtags);
}

/// 未成年に見せない。
@override@JsonKey() final  bool hideFromMinors;
@override final  int id;
@override@JsonKey() final  bool isAiGenerated;
@override@JsonKey() final  bool isBlockedByAuthor;
@override@JsonKey() final  bool isMutedByViewer;
@override@JsonKey() final  bool isPromotional;
/// 作者が R18 として投稿した。表示前に伏せること。
@override@JsonKey() final  bool isR18;
/// 閲覧可能な年齢の上限。null なら制限無し。
@override final  int? maximumAge;
/// 運営が上書きした年齢制限。
@override final  int? adminForceMinimumAge;
@override final  int? adminForceMaximumAge;
/// 作者の設定と運営の上書きをサーバー側で合成した結果。
/// 年齢制限の判定はこちらを使う（[effectiveR18] と違い自前で計算しない）。
@override final  int? effectiveMinimumAge;
@override final  int? effectiveMaximumAge;
/// コミュニティに投稿されたカロート。karotator はまだ画面を持たない。
@override final  int? communityId;
/// 期限付きカロートの消滅時刻。
@override final  DateTime? expiresAt;
@override@JsonKey() final  bool liked;
@override@JsonKey() final  int likesCount;
 final  List<String> _mediaAlts;
@override@JsonKey() List<String> get mediaAlts {
  if (_mediaAlts is EqualUnmodifiableListView) return _mediaAlts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaAlts);
}

 final  List<bool> _mediaR18Flags;
@override@JsonKey() List<bool> get mediaR18Flags {
  if (_mediaR18Flags is EqualUnmodifiableListView) return _mediaR18Flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaR18Flags);
}

 final  List<bool> _mediaSpoilerFlags;
@override@JsonKey() List<bool> get mediaSpoilerFlags {
  if (_mediaSpoilerFlags is EqualUnmodifiableListView) return _mediaSpoilerFlags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaSpoilerFlags);
}

 final  List<String> _mediaTypes;
@override@JsonKey() List<String> get mediaTypes {
  if (_mediaTypes is EqualUnmodifiableListView) return _mediaTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaTypes);
}

 final  List<String> _mediaUrls;
@override@JsonKey() List<String> get mediaUrls {
  if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaUrls);
}

 final  List<MentionId> _mentions;
@override@JsonKey() List<MentionId> get mentions {
  if (_mentions is EqualUnmodifiableListView) return _mentions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mentions);
}

/// 閲覧可能な年齢の下限。null なら制限無し。
@override final  int? minimumAge;
@override final  int? parentId;
@override final  Poll? poll;
/// 引用した人数。エンドポイントによっては [quotePostsCount] で返る。
@override@JsonKey() final  int quoteUsersCount;
@override@JsonKey() final  int quotePostsCount;
/// 引用元。**画面からは [PostX.quote] を読むこと。**
/// こちらを直接読むと `quotedPostId` だけがある場合の合成が効かない。
@override@QuoteConverter() final  Quote? quotedPost;
@override final  int? quotedPostId;
 final  List<ReactionSummary> _reactionSummary;
@override@JsonKey() List<ReactionSummary> get reactionSummary {
  if (_reactionSummary is EqualUnmodifiableListView) return _reactionSummary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reactionSummary);
}

 final  List<Reaction> _reactions;
@override@JsonKey() List<Reaction> get reactions {
  if (_reactions is EqualUnmodifiableListView) return _reactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reactions);
}

@override@JsonKey() final  bool rekaroted;
@override final  Author? rekarotedBy;
@override@JsonKey() final  int rekarotsCount;
@override@JsonKey() final  int repliesCount;
@override final  Circle? replyCircle;
@override final  int? replyCircleId;
@override@JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN) final  ReplyRestriction replyRestriction;
 final  List<ReplyTarget> _replyTargets;
@override@JsonKey() List<ReplyTarget> get replyTargets {
  if (_replyTargets is EqualUnmodifiableListView) return _replyTargets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replyTargets);
}

 final  List<Author> _replyToUsers;
@override@JsonKey() List<Author> get replyToUsers {
  if (_replyToUsers is EqualUnmodifiableListView) return _replyToUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replyToUsers);
}

@override final  DateTime? updatedAt;
@override final  Circle? viewerCircle;
@override final  int? viewerCircleId;
@override@JsonKey() final  int viewsCount;
@override@JsonKey(unknownEnumValue: PostVisibility.UNKNOWN) final  PostVisibility visibility;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCopyWith<_Post> get copyWith => __$PostCopyWithImpl<_Post>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Post&&(identical(other.adminForceHidden, adminForceHidden) || other.adminForceHidden == adminForceHidden)&&(identical(other.adminForceR18, adminForceR18) || other.adminForceR18 == adminForceR18)&&(identical(other.author, author) || other.author == author)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&(identical(other.bookmarksCount, bookmarksCount) || other.bookmarksCount == bookmarksCount)&&(identical(other.canInteract, canInteract) || other.canInteract == canInteract)&&(identical(other.canQuote, canQuote) || other.canQuote == canQuote)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.embedDescription, embedDescription) || other.embedDescription == embedDescription)&&(identical(other.embedImage, embedImage) || other.embedImage == embedImage)&&(identical(other.embedTitle, embedTitle) || other.embedTitle == embedTitle)&&(identical(other.embedUrl, embedUrl) || other.embedUrl == embedUrl)&&const DeepCollectionEquality().equals(other._excludedMentions, _excludedMentions)&&(identical(other.hasBlockedAuthor, hasBlockedAuthor) || other.hasBlockedAuthor == hasBlockedAuthor)&&const DeepCollectionEquality().equals(other._hashtags, _hashtags)&&(identical(other.hideFromMinors, hideFromMinors) || other.hideFromMinors == hideFromMinors)&&(identical(other.id, id) || other.id == id)&&(identical(other.isAiGenerated, isAiGenerated) || other.isAiGenerated == isAiGenerated)&&(identical(other.isBlockedByAuthor, isBlockedByAuthor) || other.isBlockedByAuthor == isBlockedByAuthor)&&(identical(other.isMutedByViewer, isMutedByViewer) || other.isMutedByViewer == isMutedByViewer)&&(identical(other.isPromotional, isPromotional) || other.isPromotional == isPromotional)&&(identical(other.isR18, isR18) || other.isR18 == isR18)&&(identical(other.maximumAge, maximumAge) || other.maximumAge == maximumAge)&&(identical(other.adminForceMinimumAge, adminForceMinimumAge) || other.adminForceMinimumAge == adminForceMinimumAge)&&(identical(other.adminForceMaximumAge, adminForceMaximumAge) || other.adminForceMaximumAge == adminForceMaximumAge)&&(identical(other.effectiveMinimumAge, effectiveMinimumAge) || other.effectiveMinimumAge == effectiveMinimumAge)&&(identical(other.effectiveMaximumAge, effectiveMaximumAge) || other.effectiveMaximumAge == effectiveMaximumAge)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&const DeepCollectionEquality().equals(other._mediaAlts, _mediaAlts)&&const DeepCollectionEquality().equals(other._mediaR18Flags, _mediaR18Flags)&&const DeepCollectionEquality().equals(other._mediaSpoilerFlags, _mediaSpoilerFlags)&&const DeepCollectionEquality().equals(other._mediaTypes, _mediaTypes)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&const DeepCollectionEquality().equals(other._mentions, _mentions)&&(identical(other.minimumAge, minimumAge) || other.minimumAge == minimumAge)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.quoteUsersCount, quoteUsersCount) || other.quoteUsersCount == quoteUsersCount)&&(identical(other.quotePostsCount, quotePostsCount) || other.quotePostsCount == quotePostsCount)&&(identical(other.quotedPost, quotedPost) || other.quotedPost == quotedPost)&&(identical(other.quotedPostId, quotedPostId) || other.quotedPostId == quotedPostId)&&const DeepCollectionEquality().equals(other._reactionSummary, _reactionSummary)&&const DeepCollectionEquality().equals(other._reactions, _reactions)&&(identical(other.rekaroted, rekaroted) || other.rekaroted == rekaroted)&&(identical(other.rekarotedBy, rekarotedBy) || other.rekarotedBy == rekarotedBy)&&(identical(other.rekarotsCount, rekarotsCount) || other.rekarotsCount == rekarotsCount)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.replyCircle, replyCircle) || other.replyCircle == replyCircle)&&(identical(other.replyCircleId, replyCircleId) || other.replyCircleId == replyCircleId)&&(identical(other.replyRestriction, replyRestriction) || other.replyRestriction == replyRestriction)&&const DeepCollectionEquality().equals(other._replyTargets, _replyTargets)&&const DeepCollectionEquality().equals(other._replyToUsers, _replyToUsers)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.viewerCircle, viewerCircle) || other.viewerCircle == viewerCircle)&&(identical(other.viewerCircleId, viewerCircleId) || other.viewerCircleId == viewerCircleId)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adminForceHidden,adminForceR18,author,authorId,bookmarked,bookmarksCount,canInteract,canQuote,comment,content,createdAt,editedAt,embedDescription,embedImage,embedTitle,embedUrl,const DeepCollectionEquality().hash(_excludedMentions),hasBlockedAuthor,const DeepCollectionEquality().hash(_hashtags),hideFromMinors,id,isAiGenerated,isBlockedByAuthor,isMutedByViewer,isPromotional,isR18,maximumAge,adminForceMinimumAge,adminForceMaximumAge,effectiveMinimumAge,effectiveMaximumAge,communityId,expiresAt,liked,likesCount,const DeepCollectionEquality().hash(_mediaAlts),const DeepCollectionEquality().hash(_mediaR18Flags),const DeepCollectionEquality().hash(_mediaSpoilerFlags),const DeepCollectionEquality().hash(_mediaTypes),const DeepCollectionEquality().hash(_mediaUrls),const DeepCollectionEquality().hash(_mentions),minimumAge,parentId,poll,quoteUsersCount,quotePostsCount,quotedPost,quotedPostId,const DeepCollectionEquality().hash(_reactionSummary),const DeepCollectionEquality().hash(_reactions),rekaroted,rekarotedBy,rekarotsCount,repliesCount,replyCircle,replyCircleId,replyRestriction,const DeepCollectionEquality().hash(_replyTargets),const DeepCollectionEquality().hash(_replyToUsers),updatedAt,viewerCircle,viewerCircleId,viewsCount,visibility]);

@override
String toString() {
  return 'Post(adminForceHidden: $adminForceHidden, adminForceR18: $adminForceR18, author: $author, authorId: $authorId, bookmarked: $bookmarked, bookmarksCount: $bookmarksCount, canInteract: $canInteract, canQuote: $canQuote, comment: $comment, content: $content, createdAt: $createdAt, editedAt: $editedAt, embedDescription: $embedDescription, embedImage: $embedImage, embedTitle: $embedTitle, embedUrl: $embedUrl, excludedMentions: $excludedMentions, hasBlockedAuthor: $hasBlockedAuthor, hashtags: $hashtags, hideFromMinors: $hideFromMinors, id: $id, isAiGenerated: $isAiGenerated, isBlockedByAuthor: $isBlockedByAuthor, isMutedByViewer: $isMutedByViewer, isPromotional: $isPromotional, isR18: $isR18, maximumAge: $maximumAge, adminForceMinimumAge: $adminForceMinimumAge, adminForceMaximumAge: $adminForceMaximumAge, effectiveMinimumAge: $effectiveMinimumAge, effectiveMaximumAge: $effectiveMaximumAge, communityId: $communityId, expiresAt: $expiresAt, liked: $liked, likesCount: $likesCount, mediaAlts: $mediaAlts, mediaR18Flags: $mediaR18Flags, mediaSpoilerFlags: $mediaSpoilerFlags, mediaTypes: $mediaTypes, mediaUrls: $mediaUrls, mentions: $mentions, minimumAge: $minimumAge, parentId: $parentId, poll: $poll, quoteUsersCount: $quoteUsersCount, quotePostsCount: $quotePostsCount, quotedPost: $quotedPost, quotedPostId: $quotedPostId, reactionSummary: $reactionSummary, reactions: $reactions, rekaroted: $rekaroted, rekarotedBy: $rekarotedBy, rekarotsCount: $rekarotsCount, repliesCount: $repliesCount, replyCircle: $replyCircle, replyCircleId: $replyCircleId, replyRestriction: $replyRestriction, replyTargets: $replyTargets, replyToUsers: $replyToUsers, updatedAt: $updatedAt, viewerCircle: $viewerCircle, viewerCircleId: $viewerCircleId, viewsCount: $viewsCount, visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) = __$PostCopyWithImpl;
@override @useResult
$Res call({
 bool adminForceHidden, bool adminForceR18, Author author, int? authorId, bool bookmarked, int bookmarksCount, bool canInteract, bool canQuote, String? comment, String content, DateTime createdAt, DateTime? editedAt, String? embedDescription, String? embedImage, String? embedTitle, String? embedUrl, List<int> excludedMentions, bool hasBlockedAuthor, List<HashTags> hashtags, bool hideFromMinors, int id, bool isAiGenerated, bool isBlockedByAuthor, bool isMutedByViewer, bool isPromotional, bool isR18, int? maximumAge, int? adminForceMinimumAge, int? adminForceMaximumAge, int? effectiveMinimumAge, int? effectiveMaximumAge, int? communityId, DateTime? expiresAt, bool liked, int likesCount, List<String> mediaAlts, List<bool> mediaR18Flags, List<bool> mediaSpoilerFlags, List<String> mediaTypes, List<String> mediaUrls, List<MentionId> mentions, int? minimumAge, int? parentId, Poll? poll, int quoteUsersCount, int quotePostsCount,@QuoteConverter() Quote? quotedPost, int? quotedPostId, List<ReactionSummary> reactionSummary, List<Reaction> reactions, bool rekaroted, Author? rekarotedBy, int rekarotsCount, int repliesCount, Circle? replyCircle, int? replyCircleId,@JsonKey(unknownEnumValue: ReplyRestriction.UNKNOWN) ReplyRestriction replyRestriction, List<ReplyTarget> replyTargets, List<Author> replyToUsers, DateTime? updatedAt, Circle? viewerCircle, int? viewerCircleId, int viewsCount,@JsonKey(unknownEnumValue: PostVisibility.UNKNOWN) PostVisibility visibility
});


@override $AuthorCopyWith<$Res> get author;@override $PollCopyWith<$Res>? get poll;@override $AuthorCopyWith<$Res>? get rekarotedBy;@override $CircleCopyWith<$Res>? get replyCircle;@override $CircleCopyWith<$Res>? get viewerCircle;

}
/// @nodoc
class __$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adminForceHidden = null,Object? adminForceR18 = null,Object? author = null,Object? authorId = freezed,Object? bookmarked = null,Object? bookmarksCount = null,Object? canInteract = null,Object? canQuote = null,Object? comment = freezed,Object? content = null,Object? createdAt = null,Object? editedAt = freezed,Object? embedDescription = freezed,Object? embedImage = freezed,Object? embedTitle = freezed,Object? embedUrl = freezed,Object? excludedMentions = null,Object? hasBlockedAuthor = null,Object? hashtags = null,Object? hideFromMinors = null,Object? id = null,Object? isAiGenerated = null,Object? isBlockedByAuthor = null,Object? isMutedByViewer = null,Object? isPromotional = null,Object? isR18 = null,Object? maximumAge = freezed,Object? adminForceMinimumAge = freezed,Object? adminForceMaximumAge = freezed,Object? effectiveMinimumAge = freezed,Object? effectiveMaximumAge = freezed,Object? communityId = freezed,Object? expiresAt = freezed,Object? liked = null,Object? likesCount = null,Object? mediaAlts = null,Object? mediaR18Flags = null,Object? mediaSpoilerFlags = null,Object? mediaTypes = null,Object? mediaUrls = null,Object? mentions = null,Object? minimumAge = freezed,Object? parentId = freezed,Object? poll = freezed,Object? quoteUsersCount = null,Object? quotePostsCount = null,Object? quotedPost = freezed,Object? quotedPostId = freezed,Object? reactionSummary = null,Object? reactions = null,Object? rekaroted = null,Object? rekarotedBy = freezed,Object? rekarotsCount = null,Object? repliesCount = null,Object? replyCircle = freezed,Object? replyCircleId = freezed,Object? replyRestriction = null,Object? replyTargets = null,Object? replyToUsers = null,Object? updatedAt = freezed,Object? viewerCircle = freezed,Object? viewerCircleId = freezed,Object? viewsCount = null,Object? visibility = null,}) {
  return _then(_Post(
adminForceHidden: null == adminForceHidden ? _self.adminForceHidden : adminForceHidden // ignore: cast_nullable_to_non_nullable
as bool,adminForceR18: null == adminForceR18 ? _self.adminForceR18 : adminForceR18 // ignore: cast_nullable_to_non_nullable
as bool,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int?,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,bookmarksCount: null == bookmarksCount ? _self.bookmarksCount : bookmarksCount // ignore: cast_nullable_to_non_nullable
as int,canInteract: null == canInteract ? _self.canInteract : canInteract // ignore: cast_nullable_to_non_nullable
as bool,canQuote: null == canQuote ? _self.canQuote : canQuote // ignore: cast_nullable_to_non_nullable
as bool,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,embedDescription: freezed == embedDescription ? _self.embedDescription : embedDescription // ignore: cast_nullable_to_non_nullable
as String?,embedImage: freezed == embedImage ? _self.embedImage : embedImage // ignore: cast_nullable_to_non_nullable
as String?,embedTitle: freezed == embedTitle ? _self.embedTitle : embedTitle // ignore: cast_nullable_to_non_nullable
as String?,embedUrl: freezed == embedUrl ? _self.embedUrl : embedUrl // ignore: cast_nullable_to_non_nullable
as String?,excludedMentions: null == excludedMentions ? _self._excludedMentions : excludedMentions // ignore: cast_nullable_to_non_nullable
as List<int>,hasBlockedAuthor: null == hasBlockedAuthor ? _self.hasBlockedAuthor : hasBlockedAuthor // ignore: cast_nullable_to_non_nullable
as bool,hashtags: null == hashtags ? _self._hashtags : hashtags // ignore: cast_nullable_to_non_nullable
as List<HashTags>,hideFromMinors: null == hideFromMinors ? _self.hideFromMinors : hideFromMinors // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isAiGenerated: null == isAiGenerated ? _self.isAiGenerated : isAiGenerated // ignore: cast_nullable_to_non_nullable
as bool,isBlockedByAuthor: null == isBlockedByAuthor ? _self.isBlockedByAuthor : isBlockedByAuthor // ignore: cast_nullable_to_non_nullable
as bool,isMutedByViewer: null == isMutedByViewer ? _self.isMutedByViewer : isMutedByViewer // ignore: cast_nullable_to_non_nullable
as bool,isPromotional: null == isPromotional ? _self.isPromotional : isPromotional // ignore: cast_nullable_to_non_nullable
as bool,isR18: null == isR18 ? _self.isR18 : isR18 // ignore: cast_nullable_to_non_nullable
as bool,maximumAge: freezed == maximumAge ? _self.maximumAge : maximumAge // ignore: cast_nullable_to_non_nullable
as int?,adminForceMinimumAge: freezed == adminForceMinimumAge ? _self.adminForceMinimumAge : adminForceMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,adminForceMaximumAge: freezed == adminForceMaximumAge ? _self.adminForceMaximumAge : adminForceMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,effectiveMinimumAge: freezed == effectiveMinimumAge ? _self.effectiveMinimumAge : effectiveMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,effectiveMaximumAge: freezed == effectiveMaximumAge ? _self.effectiveMaximumAge : effectiveMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,mediaAlts: null == mediaAlts ? _self._mediaAlts : mediaAlts // ignore: cast_nullable_to_non_nullable
as List<String>,mediaR18Flags: null == mediaR18Flags ? _self._mediaR18Flags : mediaR18Flags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaSpoilerFlags: null == mediaSpoilerFlags ? _self._mediaSpoilerFlags : mediaSpoilerFlags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaTypes: null == mediaTypes ? _self._mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mentions: null == mentions ? _self._mentions : mentions // ignore: cast_nullable_to_non_nullable
as List<MentionId>,minimumAge: freezed == minimumAge ? _self.minimumAge : minimumAge // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,quoteUsersCount: null == quoteUsersCount ? _self.quoteUsersCount : quoteUsersCount // ignore: cast_nullable_to_non_nullable
as int,quotePostsCount: null == quotePostsCount ? _self.quotePostsCount : quotePostsCount // ignore: cast_nullable_to_non_nullable
as int,quotedPost: freezed == quotedPost ? _self.quotedPost : quotedPost // ignore: cast_nullable_to_non_nullable
as Quote?,quotedPostId: freezed == quotedPostId ? _self.quotedPostId : quotedPostId // ignore: cast_nullable_to_non_nullable
as int?,reactionSummary: null == reactionSummary ? _self._reactionSummary : reactionSummary // ignore: cast_nullable_to_non_nullable
as List<ReactionSummary>,reactions: null == reactions ? _self._reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<Reaction>,rekaroted: null == rekaroted ? _self.rekaroted : rekaroted // ignore: cast_nullable_to_non_nullable
as bool,rekarotedBy: freezed == rekarotedBy ? _self.rekarotedBy : rekarotedBy // ignore: cast_nullable_to_non_nullable
as Author?,rekarotsCount: null == rekarotsCount ? _self.rekarotsCount : rekarotsCount // ignore: cast_nullable_to_non_nullable
as int,repliesCount: null == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int,replyCircle: freezed == replyCircle ? _self.replyCircle : replyCircle // ignore: cast_nullable_to_non_nullable
as Circle?,replyCircleId: freezed == replyCircleId ? _self.replyCircleId : replyCircleId // ignore: cast_nullable_to_non_nullable
as int?,replyRestriction: null == replyRestriction ? _self.replyRestriction : replyRestriction // ignore: cast_nullable_to_non_nullable
as ReplyRestriction,replyTargets: null == replyTargets ? _self._replyTargets : replyTargets // ignore: cast_nullable_to_non_nullable
as List<ReplyTarget>,replyToUsers: null == replyToUsers ? _self._replyToUsers : replyToUsers // ignore: cast_nullable_to_non_nullable
as List<Author>,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,viewerCircle: freezed == viewerCircle ? _self.viewerCircle : viewerCircle // ignore: cast_nullable_to_non_nullable
as Circle?,viewerCircleId: freezed == viewerCircleId ? _self.viewerCircleId : viewerCircleId // ignore: cast_nullable_to_non_nullable
as int?,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as PostVisibility,
  ));
}

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res>? get poll {
    if (_self.poll == null) {
    return null;
  }

  return $PollCopyWith<$Res>(_self.poll!, (value) {
    return _then(_self.copyWith(poll: value));
  });
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res>? get rekarotedBy {
    if (_self.rekarotedBy == null) {
    return null;
  }

  return $AuthorCopyWith<$Res>(_self.rekarotedBy!, (value) {
    return _then(_self.copyWith(rekarotedBy: value));
  });
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CircleCopyWith<$Res>? get replyCircle {
    if (_self.replyCircle == null) {
    return null;
  }

  return $CircleCopyWith<$Res>(_self.replyCircle!, (value) {
    return _then(_self.copyWith(replyCircle: value));
  });
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CircleCopyWith<$Res>? get viewerCircle {
    if (_self.viewerCircle == null) {
    return null;
  }

  return $CircleCopyWith<$Res>(_self.viewerCircle!, (value) {
    return _then(_self.copyWith(viewerCircle: value));
  });
}
}

// dart format on
