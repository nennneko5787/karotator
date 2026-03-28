// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

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
  return _then(_self.copyWith(
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
  return _then(_self.copyWith(
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

 int get id; String get text; int get position; int get votesCount; int get percentage; bool get votedByMe;
/// Create a copy of PollOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollOptionCopyWith<PollOption> get copyWith => _$PollOptionCopyWithImpl<PollOption>(this as PollOption, _$identity);

  /// Serializes this PollOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollOption&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.position, position) || other.position == position)&&(identical(other.votesCount, votesCount) || other.votesCount == votesCount)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.votedByMe, votedByMe) || other.votedByMe == votedByMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,position,votesCount,percentage,votedByMe);

@override
String toString() {
  return 'PollOption(id: $id, text: $text, position: $position, votesCount: $votesCount, percentage: $percentage, votedByMe: $votedByMe)';
}


}

/// @nodoc
abstract mixin class $PollOptionCopyWith<$Res>  {
  factory $PollOptionCopyWith(PollOption value, $Res Function(PollOption) _then) = _$PollOptionCopyWithImpl;
@useResult
$Res call({
 int id, String text, int position, int votesCount, int percentage, bool votedByMe
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? position = null,Object? votesCount = null,Object? percentage = null,Object? votedByMe = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String text,  int position,  int votesCount,  int percentage,  bool votedByMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PollOption() when $default != null:
return $default(_that.id,_that.text,_that.position,_that.votesCount,_that.percentage,_that.votedByMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String text,  int position,  int votesCount,  int percentage,  bool votedByMe)  $default,) {final _that = this;
switch (_that) {
case _PollOption():
return $default(_that.id,_that.text,_that.position,_that.votesCount,_that.percentage,_that.votedByMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String text,  int position,  int votesCount,  int percentage,  bool votedByMe)?  $default,) {final _that = this;
switch (_that) {
case _PollOption() when $default != null:
return $default(_that.id,_that.text,_that.position,_that.votesCount,_that.percentage,_that.votedByMe);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PollOption implements PollOption {
  const _PollOption({required this.id, required this.text, required this.position, required this.votesCount, required this.percentage, required this.votedByMe});
  factory _PollOption.fromJson(Map<String, dynamic> json) => _$PollOptionFromJson(json);

@override final  int id;
@override final  String text;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PollOption&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.position, position) || other.position == position)&&(identical(other.votesCount, votesCount) || other.votesCount == votesCount)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.votedByMe, votedByMe) || other.votedByMe == votedByMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,position,votesCount,percentage,votedByMe);

@override
String toString() {
  return 'PollOption(id: $id, text: $text, position: $position, votesCount: $votesCount, percentage: $percentage, votedByMe: $votedByMe)';
}


}

/// @nodoc
abstract mixin class _$PollOptionCopyWith<$Res> implements $PollOptionCopyWith<$Res> {
  factory _$PollOptionCopyWith(_PollOption value, $Res Function(_PollOption) _then) = __$PollOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String text, int position, int votesCount, int percentage, bool votedByMe
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? position = null,Object? votesCount = null,Object? percentage = null,Object? votedByMe = null,}) {
  return _then(_PollOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,votesCount: null == votesCount ? _self.votesCount : votesCount // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,votedByMe: null == votedByMe ? _self.votedByMe : votedByMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Poll {

 int get id; DateTime get expiresAt; bool get isExpired; int get totalVotes; int? get ownVoteOptionId; List<PollOption> get options;
/// Create a copy of Poll
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollCopyWith<Poll> get copyWith => _$PollCopyWithImpl<Poll>(this as Poll, _$identity);

  /// Serializes this Poll to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Poll&&(identical(other.id, id) || other.id == id)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&(identical(other.ownVoteOptionId, ownVoteOptionId) || other.ownVoteOptionId == ownVoteOptionId)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expiresAt,isExpired,totalVotes,ownVoteOptionId,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'Poll(id: $id, expiresAt: $expiresAt, isExpired: $isExpired, totalVotes: $totalVotes, ownVoteOptionId: $ownVoteOptionId, options: $options)';
}


}

/// @nodoc
abstract mixin class $PollCopyWith<$Res>  {
  factory $PollCopyWith(Poll value, $Res Function(Poll) _then) = _$PollCopyWithImpl;
@useResult
$Res call({
 int id, DateTime expiresAt, bool isExpired, int totalVotes, int? ownVoteOptionId, List<PollOption> options
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expiresAt = null,Object? isExpired = null,Object? totalVotes = null,Object? ownVoteOptionId = freezed,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime expiresAt,  bool isExpired,  int totalVotes,  int? ownVoteOptionId,  List<PollOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Poll() when $default != null:
return $default(_that.id,_that.expiresAt,_that.isExpired,_that.totalVotes,_that.ownVoteOptionId,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime expiresAt,  bool isExpired,  int totalVotes,  int? ownVoteOptionId,  List<PollOption> options)  $default,) {final _that = this;
switch (_that) {
case _Poll():
return $default(_that.id,_that.expiresAt,_that.isExpired,_that.totalVotes,_that.ownVoteOptionId,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime expiresAt,  bool isExpired,  int totalVotes,  int? ownVoteOptionId,  List<PollOption> options)?  $default,) {final _that = this;
switch (_that) {
case _Poll() when $default != null:
return $default(_that.id,_that.expiresAt,_that.isExpired,_that.totalVotes,_that.ownVoteOptionId,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Poll implements Poll {
  const _Poll({required this.id, required this.expiresAt, required this.isExpired, required this.totalVotes, this.ownVoteOptionId, required final  List<PollOption> options}): _options = options;
  factory _Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

@override final  int id;
@override final  DateTime expiresAt;
@override final  bool isExpired;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Poll&&(identical(other.id, id) || other.id == id)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&(identical(other.ownVoteOptionId, ownVoteOptionId) || other.ownVoteOptionId == ownVoteOptionId)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expiresAt,isExpired,totalVotes,ownVoteOptionId,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'Poll(id: $id, expiresAt: $expiresAt, isExpired: $isExpired, totalVotes: $totalVotes, ownVoteOptionId: $ownVoteOptionId, options: $options)';
}


}

/// @nodoc
abstract mixin class _$PollCopyWith<$Res> implements $PollCopyWith<$Res> {
  factory _$PollCopyWith(_Poll value, $Res Function(_Poll) _then) = __$PollCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime expiresAt, bool isExpired, int totalVotes, int? ownVoteOptionId, List<PollOption> options
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expiresAt = null,Object? isExpired = null,Object? totalVotes = null,Object? ownVoteOptionId = freezed,Object? options = null,}) {
  return _then(_Poll(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
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
  return _then(_self.copyWith(
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
  return _then(_self.copyWith(
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

 DateTime get createdAt; int get id; int get postId; String get source; Author get user; int get userId;
/// Create a copy of ReplyTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyTargetCopyWith<ReplyTarget> get copyWith => _$ReplyTargetCopyWithImpl<ReplyTarget>(this as ReplyTarget, _$identity);

  /// Serializes this ReplyTarget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyTarget&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.source, source) || other.source == source)&&(identical(other.user, user) || other.user == user)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,id,postId,source,user,userId);

@override
String toString() {
  return 'ReplyTarget(createdAt: $createdAt, id: $id, postId: $postId, source: $source, user: $user, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ReplyTargetCopyWith<$Res>  {
  factory $ReplyTargetCopyWith(ReplyTarget value, $Res Function(ReplyTarget) _then) = _$ReplyTargetCopyWithImpl;
@useResult
$Res call({
 DateTime createdAt, int id, int postId, String source, Author user, int userId
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
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? id = null,Object? postId = null,Object? source = null,Object? user = null,Object? userId = null,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Author,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime createdAt,  int id,  int postId,  String source,  Author user,  int userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReplyTarget() when $default != null:
return $default(_that.createdAt,_that.id,_that.postId,_that.source,_that.user,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime createdAt,  int id,  int postId,  String source,  Author user,  int userId)  $default,) {final _that = this;
switch (_that) {
case _ReplyTarget():
return $default(_that.createdAt,_that.id,_that.postId,_that.source,_that.user,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime createdAt,  int id,  int postId,  String source,  Author user,  int userId)?  $default,) {final _that = this;
switch (_that) {
case _ReplyTarget() when $default != null:
return $default(_that.createdAt,_that.id,_that.postId,_that.source,_that.user,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReplyTarget implements ReplyTarget {
  const _ReplyTarget({required this.createdAt, required this.id, required this.postId, required this.source, required this.user, required this.userId});
  factory _ReplyTarget.fromJson(Map<String, dynamic> json) => _$ReplyTargetFromJson(json);

@override final  DateTime createdAt;
@override final  int id;
@override final  int postId;
@override final  String source;
@override final  Author user;
@override final  int userId;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplyTarget&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.source, source) || other.source == source)&&(identical(other.user, user) || other.user == user)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,id,postId,source,user,userId);

@override
String toString() {
  return 'ReplyTarget(createdAt: $createdAt, id: $id, postId: $postId, source: $source, user: $user, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ReplyTargetCopyWith<$Res> implements $ReplyTargetCopyWith<$Res> {
  factory _$ReplyTargetCopyWith(_ReplyTarget value, $Res Function(_ReplyTarget) _then) = __$ReplyTargetCopyWithImpl;
@override @useResult
$Res call({
 DateTime createdAt, int id, int postId, String source, Author user, int userId
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
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? id = null,Object? postId = null,Object? source = null,Object? user = null,Object? userId = null,}) {
  return _then(_ReplyTarget(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Author,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
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

 int get id; String? get name; int? get usageCount; int? get trendScore;
/// Create a copy of HashTags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HashTagsCopyWith<HashTags> get copyWith => _$HashTagsCopyWithImpl<HashTags>(this as HashTags, _$identity);

  /// Serializes this HashTags to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HashTags&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.trendScore, trendScore) || other.trendScore == trendScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,usageCount,trendScore);

@override
String toString() {
  return 'HashTags(id: $id, name: $name, usageCount: $usageCount, trendScore: $trendScore)';
}


}

/// @nodoc
abstract mixin class $HashTagsCopyWith<$Res>  {
  factory $HashTagsCopyWith(HashTags value, $Res Function(HashTags) _then) = _$HashTagsCopyWithImpl;
@useResult
$Res call({
 int id, String? name, int? usageCount, int? trendScore
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? usageCount = freezed,Object? trendScore = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,usageCount: freezed == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int?,trendScore: freezed == trendScore ? _self.trendScore : trendScore // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? name,  int? usageCount,  int? trendScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HashTags() when $default != null:
return $default(_that.id,_that.name,_that.usageCount,_that.trendScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? name,  int? usageCount,  int? trendScore)  $default,) {final _that = this;
switch (_that) {
case _HashTags():
return $default(_that.id,_that.name,_that.usageCount,_that.trendScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? name,  int? usageCount,  int? trendScore)?  $default,) {final _that = this;
switch (_that) {
case _HashTags() when $default != null:
return $default(_that.id,_that.name,_that.usageCount,_that.trendScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HashTags implements HashTags {
  const _HashTags({required this.id, required this.name, required this.usageCount, required this.trendScore});
  factory _HashTags.fromJson(Map<String, dynamic> json) => _$HashTagsFromJson(json);

@override final  int id;
@override final  String? name;
@override final  int? usageCount;
@override final  int? trendScore;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HashTags&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.trendScore, trendScore) || other.trendScore == trendScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,usageCount,trendScore);

@override
String toString() {
  return 'HashTags(id: $id, name: $name, usageCount: $usageCount, trendScore: $trendScore)';
}


}

/// @nodoc
abstract mixin class _$HashTagsCopyWith<$Res> implements $HashTagsCopyWith<$Res> {
  factory _$HashTagsCopyWith(_HashTags value, $Res Function(_HashTags) _then) = __$HashTagsCopyWithImpl;
@override @useResult
$Res call({
 int id, String? name, int? usageCount, int? trendScore
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? usageCount = freezed,Object? trendScore = freezed,}) {
  return _then(_HashTags(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,usageCount: freezed == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int?,trendScore: freezed == trendScore ? _self.trendScore : trendScore // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$QuotedPost {

 int get id; String get content; Author get author; DateTime get createdAt; DateTime? get updatedAt; DateTime? get editedAt; int? get parentId; int? get quotedPostId; List<String> get mediaUrls; List<String> get mediaTypes; List<String> get mediaAlts; List<bool> get mediaSpoilerFlags; List<bool> get mediaR18Flags; String? get embedUrl; String? get embedTitle; String? get embedDescription; String? get embedImage; int get likesCount; int get rekarotsCount; int get repliesCount; int get viewsCount; List<int> get excludedMentions; ReplyRestriction get replyRestriction; PostVisibility get visibility; bool get canView;
/// Create a copy of QuotedPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotedPostCopyWith<QuotedPost> get copyWith => _$QuotedPostCopyWithImpl<QuotedPost>(this as QuotedPost, _$identity);

  /// Serializes this QuotedPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotedPost&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.author, author) || other.author == author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.quotedPostId, quotedPostId) || other.quotedPostId == quotedPostId)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&const DeepCollectionEquality().equals(other.mediaTypes, mediaTypes)&&const DeepCollectionEquality().equals(other.mediaAlts, mediaAlts)&&const DeepCollectionEquality().equals(other.mediaSpoilerFlags, mediaSpoilerFlags)&&const DeepCollectionEquality().equals(other.mediaR18Flags, mediaR18Flags)&&(identical(other.embedUrl, embedUrl) || other.embedUrl == embedUrl)&&(identical(other.embedTitle, embedTitle) || other.embedTitle == embedTitle)&&(identical(other.embedDescription, embedDescription) || other.embedDescription == embedDescription)&&(identical(other.embedImage, embedImage) || other.embedImage == embedImage)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.rekarotsCount, rekarotsCount) || other.rekarotsCount == rekarotsCount)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&const DeepCollectionEquality().equals(other.excludedMentions, excludedMentions)&&(identical(other.replyRestriction, replyRestriction) || other.replyRestriction == replyRestriction)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.canView, canView) || other.canView == canView));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,content,author,createdAt,updatedAt,editedAt,parentId,quotedPostId,const DeepCollectionEquality().hash(mediaUrls),const DeepCollectionEquality().hash(mediaTypes),const DeepCollectionEquality().hash(mediaAlts),const DeepCollectionEquality().hash(mediaSpoilerFlags),const DeepCollectionEquality().hash(mediaR18Flags),embedUrl,embedTitle,embedDescription,embedImage,likesCount,rekarotsCount,repliesCount,viewsCount,const DeepCollectionEquality().hash(excludedMentions),replyRestriction,visibility,canView]);

@override
String toString() {
  return 'QuotedPost(id: $id, content: $content, author: $author, createdAt: $createdAt, updatedAt: $updatedAt, editedAt: $editedAt, parentId: $parentId, quotedPostId: $quotedPostId, mediaUrls: $mediaUrls, mediaTypes: $mediaTypes, mediaAlts: $mediaAlts, mediaSpoilerFlags: $mediaSpoilerFlags, mediaR18Flags: $mediaR18Flags, embedUrl: $embedUrl, embedTitle: $embedTitle, embedDescription: $embedDescription, embedImage: $embedImage, likesCount: $likesCount, rekarotsCount: $rekarotsCount, repliesCount: $repliesCount, viewsCount: $viewsCount, excludedMentions: $excludedMentions, replyRestriction: $replyRestriction, visibility: $visibility, canView: $canView)';
}


}

/// @nodoc
abstract mixin class $QuotedPostCopyWith<$Res>  {
  factory $QuotedPostCopyWith(QuotedPost value, $Res Function(QuotedPost) _then) = _$QuotedPostCopyWithImpl;
@useResult
$Res call({
 int id, String content, Author author, DateTime createdAt, DateTime? updatedAt, DateTime? editedAt, int? parentId, int? quotedPostId, List<String> mediaUrls, List<String> mediaTypes, List<String> mediaAlts, List<bool> mediaSpoilerFlags, List<bool> mediaR18Flags, String? embedUrl, String? embedTitle, String? embedDescription, String? embedImage, int likesCount, int rekarotsCount, int repliesCount, int viewsCount, List<int> excludedMentions, ReplyRestriction replyRestriction, PostVisibility visibility, bool canView
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? author = null,Object? createdAt = null,Object? updatedAt = freezed,Object? editedAt = freezed,Object? parentId = freezed,Object? quotedPostId = freezed,Object? mediaUrls = null,Object? mediaTypes = null,Object? mediaAlts = null,Object? mediaSpoilerFlags = null,Object? mediaR18Flags = null,Object? embedUrl = freezed,Object? embedTitle = freezed,Object? embedDescription = freezed,Object? embedImage = freezed,Object? likesCount = null,Object? rekarotsCount = null,Object? repliesCount = null,Object? viewsCount = null,Object? excludedMentions = null,Object? replyRestriction = null,Object? visibility = null,Object? canView = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,quotedPostId: freezed == quotedPostId ? _self.quotedPostId : quotedPostId // ignore: cast_nullable_to_non_nullable
as int?,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mediaTypes: null == mediaTypes ? _self.mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,mediaAlts: null == mediaAlts ? _self.mediaAlts : mediaAlts // ignore: cast_nullable_to_non_nullable
as List<String>,mediaSpoilerFlags: null == mediaSpoilerFlags ? _self.mediaSpoilerFlags : mediaSpoilerFlags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaR18Flags: null == mediaR18Flags ? _self.mediaR18Flags : mediaR18Flags // ignore: cast_nullable_to_non_nullable
as List<bool>,embedUrl: freezed == embedUrl ? _self.embedUrl : embedUrl // ignore: cast_nullable_to_non_nullable
as String?,embedTitle: freezed == embedTitle ? _self.embedTitle : embedTitle // ignore: cast_nullable_to_non_nullable
as String?,embedDescription: freezed == embedDescription ? _self.embedDescription : embedDescription // ignore: cast_nullable_to_non_nullable
as String?,embedImage: freezed == embedImage ? _self.embedImage : embedImage // ignore: cast_nullable_to_non_nullable
as String?,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,rekarotsCount: null == rekarotsCount ? _self.rekarotsCount : rekarotsCount // ignore: cast_nullable_to_non_nullable
as int,repliesCount: null == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,excludedMentions: null == excludedMentions ? _self.excludedMentions : excludedMentions // ignore: cast_nullable_to_non_nullable
as List<int>,replyRestriction: null == replyRestriction ? _self.replyRestriction : replyRestriction // ignore: cast_nullable_to_non_nullable
as ReplyRestriction,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as PostVisibility,canView: null == canView ? _self.canView : canView // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String content,  Author author,  DateTime createdAt,  DateTime? updatedAt,  DateTime? editedAt,  int? parentId,  int? quotedPostId,  List<String> mediaUrls,  List<String> mediaTypes,  List<String> mediaAlts,  List<bool> mediaSpoilerFlags,  List<bool> mediaR18Flags,  String? embedUrl,  String? embedTitle,  String? embedDescription,  String? embedImage,  int likesCount,  int rekarotsCount,  int repliesCount,  int viewsCount,  List<int> excludedMentions,  ReplyRestriction replyRestriction,  PostVisibility visibility,  bool canView)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuotedPost() when $default != null:
return $default(_that.id,_that.content,_that.author,_that.createdAt,_that.updatedAt,_that.editedAt,_that.parentId,_that.quotedPostId,_that.mediaUrls,_that.mediaTypes,_that.mediaAlts,_that.mediaSpoilerFlags,_that.mediaR18Flags,_that.embedUrl,_that.embedTitle,_that.embedDescription,_that.embedImage,_that.likesCount,_that.rekarotsCount,_that.repliesCount,_that.viewsCount,_that.excludedMentions,_that.replyRestriction,_that.visibility,_that.canView);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String content,  Author author,  DateTime createdAt,  DateTime? updatedAt,  DateTime? editedAt,  int? parentId,  int? quotedPostId,  List<String> mediaUrls,  List<String> mediaTypes,  List<String> mediaAlts,  List<bool> mediaSpoilerFlags,  List<bool> mediaR18Flags,  String? embedUrl,  String? embedTitle,  String? embedDescription,  String? embedImage,  int likesCount,  int rekarotsCount,  int repliesCount,  int viewsCount,  List<int> excludedMentions,  ReplyRestriction replyRestriction,  PostVisibility visibility,  bool canView)  $default,) {final _that = this;
switch (_that) {
case _QuotedPost():
return $default(_that.id,_that.content,_that.author,_that.createdAt,_that.updatedAt,_that.editedAt,_that.parentId,_that.quotedPostId,_that.mediaUrls,_that.mediaTypes,_that.mediaAlts,_that.mediaSpoilerFlags,_that.mediaR18Flags,_that.embedUrl,_that.embedTitle,_that.embedDescription,_that.embedImage,_that.likesCount,_that.rekarotsCount,_that.repliesCount,_that.viewsCount,_that.excludedMentions,_that.replyRestriction,_that.visibility,_that.canView);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String content,  Author author,  DateTime createdAt,  DateTime? updatedAt,  DateTime? editedAt,  int? parentId,  int? quotedPostId,  List<String> mediaUrls,  List<String> mediaTypes,  List<String> mediaAlts,  List<bool> mediaSpoilerFlags,  List<bool> mediaR18Flags,  String? embedUrl,  String? embedTitle,  String? embedDescription,  String? embedImage,  int likesCount,  int rekarotsCount,  int repliesCount,  int viewsCount,  List<int> excludedMentions,  ReplyRestriction replyRestriction,  PostVisibility visibility,  bool canView)?  $default,) {final _that = this;
switch (_that) {
case _QuotedPost() when $default != null:
return $default(_that.id,_that.content,_that.author,_that.createdAt,_that.updatedAt,_that.editedAt,_that.parentId,_that.quotedPostId,_that.mediaUrls,_that.mediaTypes,_that.mediaAlts,_that.mediaSpoilerFlags,_that.mediaR18Flags,_that.embedUrl,_that.embedTitle,_that.embedDescription,_that.embedImage,_that.likesCount,_that.rekarotsCount,_that.repliesCount,_that.viewsCount,_that.excludedMentions,_that.replyRestriction,_that.visibility,_that.canView);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuotedPost implements QuotedPost {
  const _QuotedPost({required this.id, required this.content, required this.author, required this.createdAt, this.updatedAt, this.editedAt, this.parentId, this.quotedPostId, final  List<String> mediaUrls = const [], final  List<String> mediaTypes = const [], final  List<String> mediaAlts = const [], final  List<bool> mediaSpoilerFlags = const [], final  List<bool> mediaR18Flags = const [], this.embedUrl, this.embedTitle, this.embedDescription, this.embedImage, required this.likesCount, required this.rekarotsCount, required this.repliesCount, required this.viewsCount, final  List<int> excludedMentions = const [], this.replyRestriction = ReplyRestriction.EVERYONE, this.visibility = PostVisibility.PUBLIC, this.canView = true}): _mediaUrls = mediaUrls,_mediaTypes = mediaTypes,_mediaAlts = mediaAlts,_mediaSpoilerFlags = mediaSpoilerFlags,_mediaR18Flags = mediaR18Flags,_excludedMentions = excludedMentions;
  factory _QuotedPost.fromJson(Map<String, dynamic> json) => _$QuotedPostFromJson(json);

@override final  int id;
@override final  String content;
@override final  Author author;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? editedAt;
@override final  int? parentId;
@override final  int? quotedPostId;
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

 final  List<String> _mediaAlts;
@override@JsonKey() List<String> get mediaAlts {
  if (_mediaAlts is EqualUnmodifiableListView) return _mediaAlts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaAlts);
}

 final  List<bool> _mediaSpoilerFlags;
@override@JsonKey() List<bool> get mediaSpoilerFlags {
  if (_mediaSpoilerFlags is EqualUnmodifiableListView) return _mediaSpoilerFlags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaSpoilerFlags);
}

 final  List<bool> _mediaR18Flags;
@override@JsonKey() List<bool> get mediaR18Flags {
  if (_mediaR18Flags is EqualUnmodifiableListView) return _mediaR18Flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaR18Flags);
}

@override final  String? embedUrl;
@override final  String? embedTitle;
@override final  String? embedDescription;
@override final  String? embedImage;
@override final  int likesCount;
@override final  int rekarotsCount;
@override final  int repliesCount;
@override final  int viewsCount;
 final  List<int> _excludedMentions;
@override@JsonKey() List<int> get excludedMentions {
  if (_excludedMentions is EqualUnmodifiableListView) return _excludedMentions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludedMentions);
}

@override@JsonKey() final  ReplyRestriction replyRestriction;
@override@JsonKey() final  PostVisibility visibility;
@override@JsonKey() final  bool canView;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuotedPost&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.author, author) || other.author == author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.quotedPostId, quotedPostId) || other.quotedPostId == quotedPostId)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&const DeepCollectionEquality().equals(other._mediaTypes, _mediaTypes)&&const DeepCollectionEquality().equals(other._mediaAlts, _mediaAlts)&&const DeepCollectionEquality().equals(other._mediaSpoilerFlags, _mediaSpoilerFlags)&&const DeepCollectionEquality().equals(other._mediaR18Flags, _mediaR18Flags)&&(identical(other.embedUrl, embedUrl) || other.embedUrl == embedUrl)&&(identical(other.embedTitle, embedTitle) || other.embedTitle == embedTitle)&&(identical(other.embedDescription, embedDescription) || other.embedDescription == embedDescription)&&(identical(other.embedImage, embedImage) || other.embedImage == embedImage)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.rekarotsCount, rekarotsCount) || other.rekarotsCount == rekarotsCount)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&const DeepCollectionEquality().equals(other._excludedMentions, _excludedMentions)&&(identical(other.replyRestriction, replyRestriction) || other.replyRestriction == replyRestriction)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.canView, canView) || other.canView == canView));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,content,author,createdAt,updatedAt,editedAt,parentId,quotedPostId,const DeepCollectionEquality().hash(_mediaUrls),const DeepCollectionEquality().hash(_mediaTypes),const DeepCollectionEquality().hash(_mediaAlts),const DeepCollectionEquality().hash(_mediaSpoilerFlags),const DeepCollectionEquality().hash(_mediaR18Flags),embedUrl,embedTitle,embedDescription,embedImage,likesCount,rekarotsCount,repliesCount,viewsCount,const DeepCollectionEquality().hash(_excludedMentions),replyRestriction,visibility,canView]);

@override
String toString() {
  return 'QuotedPost(id: $id, content: $content, author: $author, createdAt: $createdAt, updatedAt: $updatedAt, editedAt: $editedAt, parentId: $parentId, quotedPostId: $quotedPostId, mediaUrls: $mediaUrls, mediaTypes: $mediaTypes, mediaAlts: $mediaAlts, mediaSpoilerFlags: $mediaSpoilerFlags, mediaR18Flags: $mediaR18Flags, embedUrl: $embedUrl, embedTitle: $embedTitle, embedDescription: $embedDescription, embedImage: $embedImage, likesCount: $likesCount, rekarotsCount: $rekarotsCount, repliesCount: $repliesCount, viewsCount: $viewsCount, excludedMentions: $excludedMentions, replyRestriction: $replyRestriction, visibility: $visibility, canView: $canView)';
}


}

/// @nodoc
abstract mixin class _$QuotedPostCopyWith<$Res> implements $QuotedPostCopyWith<$Res> {
  factory _$QuotedPostCopyWith(_QuotedPost value, $Res Function(_QuotedPost) _then) = __$QuotedPostCopyWithImpl;
@override @useResult
$Res call({
 int id, String content, Author author, DateTime createdAt, DateTime? updatedAt, DateTime? editedAt, int? parentId, int? quotedPostId, List<String> mediaUrls, List<String> mediaTypes, List<String> mediaAlts, List<bool> mediaSpoilerFlags, List<bool> mediaR18Flags, String? embedUrl, String? embedTitle, String? embedDescription, String? embedImage, int likesCount, int rekarotsCount, int repliesCount, int viewsCount, List<int> excludedMentions, ReplyRestriction replyRestriction, PostVisibility visibility, bool canView
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? author = null,Object? createdAt = null,Object? updatedAt = freezed,Object? editedAt = freezed,Object? parentId = freezed,Object? quotedPostId = freezed,Object? mediaUrls = null,Object? mediaTypes = null,Object? mediaAlts = null,Object? mediaSpoilerFlags = null,Object? mediaR18Flags = null,Object? embedUrl = freezed,Object? embedTitle = freezed,Object? embedDescription = freezed,Object? embedImage = freezed,Object? likesCount = null,Object? rekarotsCount = null,Object? repliesCount = null,Object? viewsCount = null,Object? excludedMentions = null,Object? replyRestriction = null,Object? visibility = null,Object? canView = null,}) {
  return _then(_QuotedPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,quotedPostId: freezed == quotedPostId ? _self.quotedPostId : quotedPostId // ignore: cast_nullable_to_non_nullable
as int?,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mediaTypes: null == mediaTypes ? _self._mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,mediaAlts: null == mediaAlts ? _self._mediaAlts : mediaAlts // ignore: cast_nullable_to_non_nullable
as List<String>,mediaSpoilerFlags: null == mediaSpoilerFlags ? _self._mediaSpoilerFlags : mediaSpoilerFlags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaR18Flags: null == mediaR18Flags ? _self._mediaR18Flags : mediaR18Flags // ignore: cast_nullable_to_non_nullable
as List<bool>,embedUrl: freezed == embedUrl ? _self.embedUrl : embedUrl // ignore: cast_nullable_to_non_nullable
as String?,embedTitle: freezed == embedTitle ? _self.embedTitle : embedTitle // ignore: cast_nullable_to_non_nullable
as String?,embedDescription: freezed == embedDescription ? _self.embedDescription : embedDescription // ignore: cast_nullable_to_non_nullable
as String?,embedImage: freezed == embedImage ? _self.embedImage : embedImage // ignore: cast_nullable_to_non_nullable
as String?,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,rekarotsCount: null == rekarotsCount ? _self.rekarotsCount : rekarotsCount // ignore: cast_nullable_to_non_nullable
as int,repliesCount: null == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int,viewsCount: null == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int,excludedMentions: null == excludedMentions ? _self._excludedMentions : excludedMentions // ignore: cast_nullable_to_non_nullable
as List<int>,replyRestriction: null == replyRestriction ? _self.replyRestriction : replyRestriction // ignore: cast_nullable_to_non_nullable
as ReplyRestriction,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as PostVisibility,canView: null == canView ? _self.canView : canView // ignore: cast_nullable_to_non_nullable
as bool,
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

 Author get author; int get authorId; bool get bookmarked;//required List<Id> bookmarks,
 int get bookmarksCount; bool get canInteract; bool get canQuote; String? get comment; String get content; DateTime get createdAt; DateTime? get editedAt; String? get embedDescription; String? get embedImage; String? get embedTitle; String? get embedUrl; List<int> get excludedMentions; bool get hasBlockedAuthor; List<HashTags> get hashtags; int get id; bool get isAiGenerated; bool get isBlockedByAuthor; bool get isMutedByViewer; bool get isPromotional;// required String itemId,
 bool get liked;// required List<Id> likes,
 int get likesCount; List<String> get mediaAlts; List<bool> get mediaR18Flags; List<bool> get mediaSpoilerFlags; List<String> get mediaTypes; List<String> get mediaUrls; List<MentionId> get mentions; int? get parentId; Poll? get poll; int get quoteUsersCount; QuotedPost? get quotedPost; int? get quotedPostId; List<ReactionSummary> get reactionSummary; List<Reaction> get reactions; bool get rekaroted; Author? get rekarotedBy;// required List<Id> rekarots,
 int get rekarotsCount; int get repliesCount; Circle? get replyCircle; int? get replyCircleId; ReplyRestriction get replyRestriction; List<ReplyTarget> get replyTargets; List<Author> get replyToUsers;// required DateTime time,
// required String type,
 DateTime get updatedAt; Circle? get viewerCircle; int? get viewerCircleId; int get viewsCount; PostVisibility get visibility;
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCopyWith<Post> get copyWith => _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Post&&(identical(other.author, author) || other.author == author)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&(identical(other.bookmarksCount, bookmarksCount) || other.bookmarksCount == bookmarksCount)&&(identical(other.canInteract, canInteract) || other.canInteract == canInteract)&&(identical(other.canQuote, canQuote) || other.canQuote == canQuote)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.embedDescription, embedDescription) || other.embedDescription == embedDescription)&&(identical(other.embedImage, embedImage) || other.embedImage == embedImage)&&(identical(other.embedTitle, embedTitle) || other.embedTitle == embedTitle)&&(identical(other.embedUrl, embedUrl) || other.embedUrl == embedUrl)&&const DeepCollectionEquality().equals(other.excludedMentions, excludedMentions)&&(identical(other.hasBlockedAuthor, hasBlockedAuthor) || other.hasBlockedAuthor == hasBlockedAuthor)&&const DeepCollectionEquality().equals(other.hashtags, hashtags)&&(identical(other.id, id) || other.id == id)&&(identical(other.isAiGenerated, isAiGenerated) || other.isAiGenerated == isAiGenerated)&&(identical(other.isBlockedByAuthor, isBlockedByAuthor) || other.isBlockedByAuthor == isBlockedByAuthor)&&(identical(other.isMutedByViewer, isMutedByViewer) || other.isMutedByViewer == isMutedByViewer)&&(identical(other.isPromotional, isPromotional) || other.isPromotional == isPromotional)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&const DeepCollectionEquality().equals(other.mediaAlts, mediaAlts)&&const DeepCollectionEquality().equals(other.mediaR18Flags, mediaR18Flags)&&const DeepCollectionEquality().equals(other.mediaSpoilerFlags, mediaSpoilerFlags)&&const DeepCollectionEquality().equals(other.mediaTypes, mediaTypes)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&const DeepCollectionEquality().equals(other.mentions, mentions)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.quoteUsersCount, quoteUsersCount) || other.quoteUsersCount == quoteUsersCount)&&(identical(other.quotedPost, quotedPost) || other.quotedPost == quotedPost)&&(identical(other.quotedPostId, quotedPostId) || other.quotedPostId == quotedPostId)&&const DeepCollectionEquality().equals(other.reactionSummary, reactionSummary)&&const DeepCollectionEquality().equals(other.reactions, reactions)&&(identical(other.rekaroted, rekaroted) || other.rekaroted == rekaroted)&&(identical(other.rekarotedBy, rekarotedBy) || other.rekarotedBy == rekarotedBy)&&(identical(other.rekarotsCount, rekarotsCount) || other.rekarotsCount == rekarotsCount)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.replyCircle, replyCircle) || other.replyCircle == replyCircle)&&(identical(other.replyCircleId, replyCircleId) || other.replyCircleId == replyCircleId)&&(identical(other.replyRestriction, replyRestriction) || other.replyRestriction == replyRestriction)&&const DeepCollectionEquality().equals(other.replyTargets, replyTargets)&&const DeepCollectionEquality().equals(other.replyToUsers, replyToUsers)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.viewerCircle, viewerCircle) || other.viewerCircle == viewerCircle)&&(identical(other.viewerCircleId, viewerCircleId) || other.viewerCircleId == viewerCircleId)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,author,authorId,bookmarked,bookmarksCount,canInteract,canQuote,comment,content,createdAt,editedAt,embedDescription,embedImage,embedTitle,embedUrl,const DeepCollectionEquality().hash(excludedMentions),hasBlockedAuthor,const DeepCollectionEquality().hash(hashtags),id,isAiGenerated,isBlockedByAuthor,isMutedByViewer,isPromotional,liked,likesCount,const DeepCollectionEquality().hash(mediaAlts),const DeepCollectionEquality().hash(mediaR18Flags),const DeepCollectionEquality().hash(mediaSpoilerFlags),const DeepCollectionEquality().hash(mediaTypes),const DeepCollectionEquality().hash(mediaUrls),const DeepCollectionEquality().hash(mentions),parentId,poll,quoteUsersCount,quotedPost,quotedPostId,const DeepCollectionEquality().hash(reactionSummary),const DeepCollectionEquality().hash(reactions),rekaroted,rekarotedBy,rekarotsCount,repliesCount,replyCircle,replyCircleId,replyRestriction,const DeepCollectionEquality().hash(replyTargets),const DeepCollectionEquality().hash(replyToUsers),updatedAt,viewerCircle,viewerCircleId,viewsCount,visibility]);

@override
String toString() {
  return 'Post(author: $author, authorId: $authorId, bookmarked: $bookmarked, bookmarksCount: $bookmarksCount, canInteract: $canInteract, canQuote: $canQuote, comment: $comment, content: $content, createdAt: $createdAt, editedAt: $editedAt, embedDescription: $embedDescription, embedImage: $embedImage, embedTitle: $embedTitle, embedUrl: $embedUrl, excludedMentions: $excludedMentions, hasBlockedAuthor: $hasBlockedAuthor, hashtags: $hashtags, id: $id, isAiGenerated: $isAiGenerated, isBlockedByAuthor: $isBlockedByAuthor, isMutedByViewer: $isMutedByViewer, isPromotional: $isPromotional, liked: $liked, likesCount: $likesCount, mediaAlts: $mediaAlts, mediaR18Flags: $mediaR18Flags, mediaSpoilerFlags: $mediaSpoilerFlags, mediaTypes: $mediaTypes, mediaUrls: $mediaUrls, mentions: $mentions, parentId: $parentId, poll: $poll, quoteUsersCount: $quoteUsersCount, quotedPost: $quotedPost, quotedPostId: $quotedPostId, reactionSummary: $reactionSummary, reactions: $reactions, rekaroted: $rekaroted, rekarotedBy: $rekarotedBy, rekarotsCount: $rekarotsCount, repliesCount: $repliesCount, replyCircle: $replyCircle, replyCircleId: $replyCircleId, replyRestriction: $replyRestriction, replyTargets: $replyTargets, replyToUsers: $replyToUsers, updatedAt: $updatedAt, viewerCircle: $viewerCircle, viewerCircleId: $viewerCircleId, viewsCount: $viewsCount, visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class $PostCopyWith<$Res>  {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) = _$PostCopyWithImpl;
@useResult
$Res call({
 Author author, int authorId, bool bookmarked, int bookmarksCount, bool canInteract, bool canQuote, String? comment, String content, DateTime createdAt, DateTime? editedAt, String? embedDescription, String? embedImage, String? embedTitle, String? embedUrl, List<int> excludedMentions, bool hasBlockedAuthor, List<HashTags> hashtags, int id, bool isAiGenerated, bool isBlockedByAuthor, bool isMutedByViewer, bool isPromotional, bool liked, int likesCount, List<String> mediaAlts, List<bool> mediaR18Flags, List<bool> mediaSpoilerFlags, List<String> mediaTypes, List<String> mediaUrls, List<MentionId> mentions, int? parentId, Poll? poll, int quoteUsersCount, QuotedPost? quotedPost, int? quotedPostId, List<ReactionSummary> reactionSummary, List<Reaction> reactions, bool rekaroted, Author? rekarotedBy, int rekarotsCount, int repliesCount, Circle? replyCircle, int? replyCircleId, ReplyRestriction replyRestriction, List<ReplyTarget> replyTargets, List<Author> replyToUsers, DateTime updatedAt, Circle? viewerCircle, int? viewerCircleId, int viewsCount, PostVisibility visibility
});


$AuthorCopyWith<$Res> get author;$PollCopyWith<$Res>? get poll;$QuotedPostCopyWith<$Res>? get quotedPost;$AuthorCopyWith<$Res>? get rekarotedBy;$CircleCopyWith<$Res>? get replyCircle;$CircleCopyWith<$Res>? get viewerCircle;

}
/// @nodoc
class _$PostCopyWithImpl<$Res>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? author = null,Object? authorId = null,Object? bookmarked = null,Object? bookmarksCount = null,Object? canInteract = null,Object? canQuote = null,Object? comment = freezed,Object? content = null,Object? createdAt = null,Object? editedAt = freezed,Object? embedDescription = freezed,Object? embedImage = freezed,Object? embedTitle = freezed,Object? embedUrl = freezed,Object? excludedMentions = null,Object? hasBlockedAuthor = null,Object? hashtags = null,Object? id = null,Object? isAiGenerated = null,Object? isBlockedByAuthor = null,Object? isMutedByViewer = null,Object? isPromotional = null,Object? liked = null,Object? likesCount = null,Object? mediaAlts = null,Object? mediaR18Flags = null,Object? mediaSpoilerFlags = null,Object? mediaTypes = null,Object? mediaUrls = null,Object? mentions = null,Object? parentId = freezed,Object? poll = freezed,Object? quoteUsersCount = null,Object? quotedPost = freezed,Object? quotedPostId = freezed,Object? reactionSummary = null,Object? reactions = null,Object? rekaroted = null,Object? rekarotedBy = freezed,Object? rekarotsCount = null,Object? repliesCount = null,Object? replyCircle = freezed,Object? replyCircleId = freezed,Object? replyRestriction = null,Object? replyTargets = null,Object? replyToUsers = null,Object? updatedAt = null,Object? viewerCircle = freezed,Object? viewerCircleId = freezed,Object? viewsCount = null,Object? visibility = null,}) {
  return _then(_self.copyWith(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
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
as List<HashTags>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isAiGenerated: null == isAiGenerated ? _self.isAiGenerated : isAiGenerated // ignore: cast_nullable_to_non_nullable
as bool,isBlockedByAuthor: null == isBlockedByAuthor ? _self.isBlockedByAuthor : isBlockedByAuthor // ignore: cast_nullable_to_non_nullable
as bool,isMutedByViewer: null == isMutedByViewer ? _self.isMutedByViewer : isMutedByViewer // ignore: cast_nullable_to_non_nullable
as bool,isPromotional: null == isPromotional ? _self.isPromotional : isPromotional // ignore: cast_nullable_to_non_nullable
as bool,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,mediaAlts: null == mediaAlts ? _self.mediaAlts : mediaAlts // ignore: cast_nullable_to_non_nullable
as List<String>,mediaR18Flags: null == mediaR18Flags ? _self.mediaR18Flags : mediaR18Flags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaSpoilerFlags: null == mediaSpoilerFlags ? _self.mediaSpoilerFlags : mediaSpoilerFlags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaTypes: null == mediaTypes ? _self.mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mentions: null == mentions ? _self.mentions : mentions // ignore: cast_nullable_to_non_nullable
as List<MentionId>,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,quoteUsersCount: null == quoteUsersCount ? _self.quoteUsersCount : quoteUsersCount // ignore: cast_nullable_to_non_nullable
as int,quotedPost: freezed == quotedPost ? _self.quotedPost : quotedPost // ignore: cast_nullable_to_non_nullable
as QuotedPost?,quotedPostId: freezed == quotedPostId ? _self.quotedPostId : quotedPostId // ignore: cast_nullable_to_non_nullable
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
as List<Author>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,viewerCircle: freezed == viewerCircle ? _self.viewerCircle : viewerCircle // ignore: cast_nullable_to_non_nullable
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
$QuotedPostCopyWith<$Res>? get quotedPost {
    if (_self.quotedPost == null) {
    return null;
  }

  return $QuotedPostCopyWith<$Res>(_self.quotedPost!, (value) {
    return _then(_self.copyWith(quotedPost: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Author author,  int authorId,  bool bookmarked,  int bookmarksCount,  bool canInteract,  bool canQuote,  String? comment,  String content,  DateTime createdAt,  DateTime? editedAt,  String? embedDescription,  String? embedImage,  String? embedTitle,  String? embedUrl,  List<int> excludedMentions,  bool hasBlockedAuthor,  List<HashTags> hashtags,  int id,  bool isAiGenerated,  bool isBlockedByAuthor,  bool isMutedByViewer,  bool isPromotional,  bool liked,  int likesCount,  List<String> mediaAlts,  List<bool> mediaR18Flags,  List<bool> mediaSpoilerFlags,  List<String> mediaTypes,  List<String> mediaUrls,  List<MentionId> mentions,  int? parentId,  Poll? poll,  int quoteUsersCount,  QuotedPost? quotedPost,  int? quotedPostId,  List<ReactionSummary> reactionSummary,  List<Reaction> reactions,  bool rekaroted,  Author? rekarotedBy,  int rekarotsCount,  int repliesCount,  Circle? replyCircle,  int? replyCircleId,  ReplyRestriction replyRestriction,  List<ReplyTarget> replyTargets,  List<Author> replyToUsers,  DateTime updatedAt,  Circle? viewerCircle,  int? viewerCircleId,  int viewsCount,  PostVisibility visibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.author,_that.authorId,_that.bookmarked,_that.bookmarksCount,_that.canInteract,_that.canQuote,_that.comment,_that.content,_that.createdAt,_that.editedAt,_that.embedDescription,_that.embedImage,_that.embedTitle,_that.embedUrl,_that.excludedMentions,_that.hasBlockedAuthor,_that.hashtags,_that.id,_that.isAiGenerated,_that.isBlockedByAuthor,_that.isMutedByViewer,_that.isPromotional,_that.liked,_that.likesCount,_that.mediaAlts,_that.mediaR18Flags,_that.mediaSpoilerFlags,_that.mediaTypes,_that.mediaUrls,_that.mentions,_that.parentId,_that.poll,_that.quoteUsersCount,_that.quotedPost,_that.quotedPostId,_that.reactionSummary,_that.reactions,_that.rekaroted,_that.rekarotedBy,_that.rekarotsCount,_that.repliesCount,_that.replyCircle,_that.replyCircleId,_that.replyRestriction,_that.replyTargets,_that.replyToUsers,_that.updatedAt,_that.viewerCircle,_that.viewerCircleId,_that.viewsCount,_that.visibility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Author author,  int authorId,  bool bookmarked,  int bookmarksCount,  bool canInteract,  bool canQuote,  String? comment,  String content,  DateTime createdAt,  DateTime? editedAt,  String? embedDescription,  String? embedImage,  String? embedTitle,  String? embedUrl,  List<int> excludedMentions,  bool hasBlockedAuthor,  List<HashTags> hashtags,  int id,  bool isAiGenerated,  bool isBlockedByAuthor,  bool isMutedByViewer,  bool isPromotional,  bool liked,  int likesCount,  List<String> mediaAlts,  List<bool> mediaR18Flags,  List<bool> mediaSpoilerFlags,  List<String> mediaTypes,  List<String> mediaUrls,  List<MentionId> mentions,  int? parentId,  Poll? poll,  int quoteUsersCount,  QuotedPost? quotedPost,  int? quotedPostId,  List<ReactionSummary> reactionSummary,  List<Reaction> reactions,  bool rekaroted,  Author? rekarotedBy,  int rekarotsCount,  int repliesCount,  Circle? replyCircle,  int? replyCircleId,  ReplyRestriction replyRestriction,  List<ReplyTarget> replyTargets,  List<Author> replyToUsers,  DateTime updatedAt,  Circle? viewerCircle,  int? viewerCircleId,  int viewsCount,  PostVisibility visibility)  $default,) {final _that = this;
switch (_that) {
case _Post():
return $default(_that.author,_that.authorId,_that.bookmarked,_that.bookmarksCount,_that.canInteract,_that.canQuote,_that.comment,_that.content,_that.createdAt,_that.editedAt,_that.embedDescription,_that.embedImage,_that.embedTitle,_that.embedUrl,_that.excludedMentions,_that.hasBlockedAuthor,_that.hashtags,_that.id,_that.isAiGenerated,_that.isBlockedByAuthor,_that.isMutedByViewer,_that.isPromotional,_that.liked,_that.likesCount,_that.mediaAlts,_that.mediaR18Flags,_that.mediaSpoilerFlags,_that.mediaTypes,_that.mediaUrls,_that.mentions,_that.parentId,_that.poll,_that.quoteUsersCount,_that.quotedPost,_that.quotedPostId,_that.reactionSummary,_that.reactions,_that.rekaroted,_that.rekarotedBy,_that.rekarotsCount,_that.repliesCount,_that.replyCircle,_that.replyCircleId,_that.replyRestriction,_that.replyTargets,_that.replyToUsers,_that.updatedAt,_that.viewerCircle,_that.viewerCircleId,_that.viewsCount,_that.visibility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Author author,  int authorId,  bool bookmarked,  int bookmarksCount,  bool canInteract,  bool canQuote,  String? comment,  String content,  DateTime createdAt,  DateTime? editedAt,  String? embedDescription,  String? embedImage,  String? embedTitle,  String? embedUrl,  List<int> excludedMentions,  bool hasBlockedAuthor,  List<HashTags> hashtags,  int id,  bool isAiGenerated,  bool isBlockedByAuthor,  bool isMutedByViewer,  bool isPromotional,  bool liked,  int likesCount,  List<String> mediaAlts,  List<bool> mediaR18Flags,  List<bool> mediaSpoilerFlags,  List<String> mediaTypes,  List<String> mediaUrls,  List<MentionId> mentions,  int? parentId,  Poll? poll,  int quoteUsersCount,  QuotedPost? quotedPost,  int? quotedPostId,  List<ReactionSummary> reactionSummary,  List<Reaction> reactions,  bool rekaroted,  Author? rekarotedBy,  int rekarotsCount,  int repliesCount,  Circle? replyCircle,  int? replyCircleId,  ReplyRestriction replyRestriction,  List<ReplyTarget> replyTargets,  List<Author> replyToUsers,  DateTime updatedAt,  Circle? viewerCircle,  int? viewerCircleId,  int viewsCount,  PostVisibility visibility)?  $default,) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.author,_that.authorId,_that.bookmarked,_that.bookmarksCount,_that.canInteract,_that.canQuote,_that.comment,_that.content,_that.createdAt,_that.editedAt,_that.embedDescription,_that.embedImage,_that.embedTitle,_that.embedUrl,_that.excludedMentions,_that.hasBlockedAuthor,_that.hashtags,_that.id,_that.isAiGenerated,_that.isBlockedByAuthor,_that.isMutedByViewer,_that.isPromotional,_that.liked,_that.likesCount,_that.mediaAlts,_that.mediaR18Flags,_that.mediaSpoilerFlags,_that.mediaTypes,_that.mediaUrls,_that.mentions,_that.parentId,_that.poll,_that.quoteUsersCount,_that.quotedPost,_that.quotedPostId,_that.reactionSummary,_that.reactions,_that.rekaroted,_that.rekarotedBy,_that.rekarotsCount,_that.repliesCount,_that.replyCircle,_that.replyCircleId,_that.replyRestriction,_that.replyTargets,_that.replyToUsers,_that.updatedAt,_that.viewerCircle,_that.viewerCircleId,_that.viewsCount,_that.visibility);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Post implements Post {
  const _Post({required this.author, required this.authorId, required this.bookmarked, required this.bookmarksCount, this.canInteract = true, this.canQuote = true, this.comment, required this.content, required this.createdAt, this.editedAt, this.embedDescription, this.embedImage, this.embedTitle, this.embedUrl, required final  List<int> excludedMentions, this.hasBlockedAuthor = true, final  List<HashTags> hashtags = const [], required this.id, required this.isAiGenerated, this.isBlockedByAuthor = false, this.isMutedByViewer = false, required this.isPromotional, this.liked = false, required this.likesCount, required final  List<String> mediaAlts, required final  List<bool> mediaR18Flags, required final  List<bool> mediaSpoilerFlags, required final  List<String> mediaTypes, required final  List<String> mediaUrls, final  List<MentionId> mentions = const [], this.parentId, this.poll, this.quoteUsersCount = 0, this.quotedPost, this.quotedPostId, final  List<ReactionSummary> reactionSummary = const [], final  List<Reaction> reactions = const [], this.rekaroted = false, this.rekarotedBy, this.rekarotsCount = 0, required this.repliesCount, this.replyCircle, this.replyCircleId, required this.replyRestriction, final  List<ReplyTarget> replyTargets = const [], final  List<Author> replyToUsers = const [], required this.updatedAt, this.viewerCircle, this.viewerCircleId, required this.viewsCount, required this.visibility}): _excludedMentions = excludedMentions,_hashtags = hashtags,_mediaAlts = mediaAlts,_mediaR18Flags = mediaR18Flags,_mediaSpoilerFlags = mediaSpoilerFlags,_mediaTypes = mediaTypes,_mediaUrls = mediaUrls,_mentions = mentions,_reactionSummary = reactionSummary,_reactions = reactions,_replyTargets = replyTargets,_replyToUsers = replyToUsers;
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

@override final  Author author;
@override final  int authorId;
@override final  bool bookmarked;
//required List<Id> bookmarks,
@override final  int bookmarksCount;
@override@JsonKey() final  bool canInteract;
@override@JsonKey() final  bool canQuote;
@override final  String? comment;
@override final  String content;
@override final  DateTime createdAt;
@override final  DateTime? editedAt;
@override final  String? embedDescription;
@override final  String? embedImage;
@override final  String? embedTitle;
@override final  String? embedUrl;
 final  List<int> _excludedMentions;
@override List<int> get excludedMentions {
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

@override final  int id;
@override final  bool isAiGenerated;
@override@JsonKey() final  bool isBlockedByAuthor;
@override@JsonKey() final  bool isMutedByViewer;
@override final  bool isPromotional;
// required String itemId,
@override@JsonKey() final  bool liked;
// required List<Id> likes,
@override final  int likesCount;
 final  List<String> _mediaAlts;
@override List<String> get mediaAlts {
  if (_mediaAlts is EqualUnmodifiableListView) return _mediaAlts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaAlts);
}

 final  List<bool> _mediaR18Flags;
@override List<bool> get mediaR18Flags {
  if (_mediaR18Flags is EqualUnmodifiableListView) return _mediaR18Flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaR18Flags);
}

 final  List<bool> _mediaSpoilerFlags;
@override List<bool> get mediaSpoilerFlags {
  if (_mediaSpoilerFlags is EqualUnmodifiableListView) return _mediaSpoilerFlags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaSpoilerFlags);
}

 final  List<String> _mediaTypes;
@override List<String> get mediaTypes {
  if (_mediaTypes is EqualUnmodifiableListView) return _mediaTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaTypes);
}

 final  List<String> _mediaUrls;
@override List<String> get mediaUrls {
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

@override final  int? parentId;
@override final  Poll? poll;
@override@JsonKey() final  int quoteUsersCount;
@override final  QuotedPost? quotedPost;
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
// required List<Id> rekarots,
@override@JsonKey() final  int rekarotsCount;
@override final  int repliesCount;
@override final  Circle? replyCircle;
@override final  int? replyCircleId;
@override final  ReplyRestriction replyRestriction;
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

// required DateTime time,
// required String type,
@override final  DateTime updatedAt;
@override final  Circle? viewerCircle;
@override final  int? viewerCircleId;
@override final  int viewsCount;
@override final  PostVisibility visibility;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Post&&(identical(other.author, author) || other.author == author)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&(identical(other.bookmarksCount, bookmarksCount) || other.bookmarksCount == bookmarksCount)&&(identical(other.canInteract, canInteract) || other.canInteract == canInteract)&&(identical(other.canQuote, canQuote) || other.canQuote == canQuote)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.embedDescription, embedDescription) || other.embedDescription == embedDescription)&&(identical(other.embedImage, embedImage) || other.embedImage == embedImage)&&(identical(other.embedTitle, embedTitle) || other.embedTitle == embedTitle)&&(identical(other.embedUrl, embedUrl) || other.embedUrl == embedUrl)&&const DeepCollectionEquality().equals(other._excludedMentions, _excludedMentions)&&(identical(other.hasBlockedAuthor, hasBlockedAuthor) || other.hasBlockedAuthor == hasBlockedAuthor)&&const DeepCollectionEquality().equals(other._hashtags, _hashtags)&&(identical(other.id, id) || other.id == id)&&(identical(other.isAiGenerated, isAiGenerated) || other.isAiGenerated == isAiGenerated)&&(identical(other.isBlockedByAuthor, isBlockedByAuthor) || other.isBlockedByAuthor == isBlockedByAuthor)&&(identical(other.isMutedByViewer, isMutedByViewer) || other.isMutedByViewer == isMutedByViewer)&&(identical(other.isPromotional, isPromotional) || other.isPromotional == isPromotional)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&const DeepCollectionEquality().equals(other._mediaAlts, _mediaAlts)&&const DeepCollectionEquality().equals(other._mediaR18Flags, _mediaR18Flags)&&const DeepCollectionEquality().equals(other._mediaSpoilerFlags, _mediaSpoilerFlags)&&const DeepCollectionEquality().equals(other._mediaTypes, _mediaTypes)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&const DeepCollectionEquality().equals(other._mentions, _mentions)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.quoteUsersCount, quoteUsersCount) || other.quoteUsersCount == quoteUsersCount)&&(identical(other.quotedPost, quotedPost) || other.quotedPost == quotedPost)&&(identical(other.quotedPostId, quotedPostId) || other.quotedPostId == quotedPostId)&&const DeepCollectionEquality().equals(other._reactionSummary, _reactionSummary)&&const DeepCollectionEquality().equals(other._reactions, _reactions)&&(identical(other.rekaroted, rekaroted) || other.rekaroted == rekaroted)&&(identical(other.rekarotedBy, rekarotedBy) || other.rekarotedBy == rekarotedBy)&&(identical(other.rekarotsCount, rekarotsCount) || other.rekarotsCount == rekarotsCount)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.replyCircle, replyCircle) || other.replyCircle == replyCircle)&&(identical(other.replyCircleId, replyCircleId) || other.replyCircleId == replyCircleId)&&(identical(other.replyRestriction, replyRestriction) || other.replyRestriction == replyRestriction)&&const DeepCollectionEquality().equals(other._replyTargets, _replyTargets)&&const DeepCollectionEquality().equals(other._replyToUsers, _replyToUsers)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.viewerCircle, viewerCircle) || other.viewerCircle == viewerCircle)&&(identical(other.viewerCircleId, viewerCircleId) || other.viewerCircleId == viewerCircleId)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,author,authorId,bookmarked,bookmarksCount,canInteract,canQuote,comment,content,createdAt,editedAt,embedDescription,embedImage,embedTitle,embedUrl,const DeepCollectionEquality().hash(_excludedMentions),hasBlockedAuthor,const DeepCollectionEquality().hash(_hashtags),id,isAiGenerated,isBlockedByAuthor,isMutedByViewer,isPromotional,liked,likesCount,const DeepCollectionEquality().hash(_mediaAlts),const DeepCollectionEquality().hash(_mediaR18Flags),const DeepCollectionEquality().hash(_mediaSpoilerFlags),const DeepCollectionEquality().hash(_mediaTypes),const DeepCollectionEquality().hash(_mediaUrls),const DeepCollectionEquality().hash(_mentions),parentId,poll,quoteUsersCount,quotedPost,quotedPostId,const DeepCollectionEquality().hash(_reactionSummary),const DeepCollectionEquality().hash(_reactions),rekaroted,rekarotedBy,rekarotsCount,repliesCount,replyCircle,replyCircleId,replyRestriction,const DeepCollectionEquality().hash(_replyTargets),const DeepCollectionEquality().hash(_replyToUsers),updatedAt,viewerCircle,viewerCircleId,viewsCount,visibility]);

@override
String toString() {
  return 'Post(author: $author, authorId: $authorId, bookmarked: $bookmarked, bookmarksCount: $bookmarksCount, canInteract: $canInteract, canQuote: $canQuote, comment: $comment, content: $content, createdAt: $createdAt, editedAt: $editedAt, embedDescription: $embedDescription, embedImage: $embedImage, embedTitle: $embedTitle, embedUrl: $embedUrl, excludedMentions: $excludedMentions, hasBlockedAuthor: $hasBlockedAuthor, hashtags: $hashtags, id: $id, isAiGenerated: $isAiGenerated, isBlockedByAuthor: $isBlockedByAuthor, isMutedByViewer: $isMutedByViewer, isPromotional: $isPromotional, liked: $liked, likesCount: $likesCount, mediaAlts: $mediaAlts, mediaR18Flags: $mediaR18Flags, mediaSpoilerFlags: $mediaSpoilerFlags, mediaTypes: $mediaTypes, mediaUrls: $mediaUrls, mentions: $mentions, parentId: $parentId, poll: $poll, quoteUsersCount: $quoteUsersCount, quotedPost: $quotedPost, quotedPostId: $quotedPostId, reactionSummary: $reactionSummary, reactions: $reactions, rekaroted: $rekaroted, rekarotedBy: $rekarotedBy, rekarotsCount: $rekarotsCount, repliesCount: $repliesCount, replyCircle: $replyCircle, replyCircleId: $replyCircleId, replyRestriction: $replyRestriction, replyTargets: $replyTargets, replyToUsers: $replyToUsers, updatedAt: $updatedAt, viewerCircle: $viewerCircle, viewerCircleId: $viewerCircleId, viewsCount: $viewsCount, visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) = __$PostCopyWithImpl;
@override @useResult
$Res call({
 Author author, int authorId, bool bookmarked, int bookmarksCount, bool canInteract, bool canQuote, String? comment, String content, DateTime createdAt, DateTime? editedAt, String? embedDescription, String? embedImage, String? embedTitle, String? embedUrl, List<int> excludedMentions, bool hasBlockedAuthor, List<HashTags> hashtags, int id, bool isAiGenerated, bool isBlockedByAuthor, bool isMutedByViewer, bool isPromotional, bool liked, int likesCount, List<String> mediaAlts, List<bool> mediaR18Flags, List<bool> mediaSpoilerFlags, List<String> mediaTypes, List<String> mediaUrls, List<MentionId> mentions, int? parentId, Poll? poll, int quoteUsersCount, QuotedPost? quotedPost, int? quotedPostId, List<ReactionSummary> reactionSummary, List<Reaction> reactions, bool rekaroted, Author? rekarotedBy, int rekarotsCount, int repliesCount, Circle? replyCircle, int? replyCircleId, ReplyRestriction replyRestriction, List<ReplyTarget> replyTargets, List<Author> replyToUsers, DateTime updatedAt, Circle? viewerCircle, int? viewerCircleId, int viewsCount, PostVisibility visibility
});


@override $AuthorCopyWith<$Res> get author;@override $PollCopyWith<$Res>? get poll;@override $QuotedPostCopyWith<$Res>? get quotedPost;@override $AuthorCopyWith<$Res>? get rekarotedBy;@override $CircleCopyWith<$Res>? get replyCircle;@override $CircleCopyWith<$Res>? get viewerCircle;

}
/// @nodoc
class __$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = null,Object? authorId = null,Object? bookmarked = null,Object? bookmarksCount = null,Object? canInteract = null,Object? canQuote = null,Object? comment = freezed,Object? content = null,Object? createdAt = null,Object? editedAt = freezed,Object? embedDescription = freezed,Object? embedImage = freezed,Object? embedTitle = freezed,Object? embedUrl = freezed,Object? excludedMentions = null,Object? hasBlockedAuthor = null,Object? hashtags = null,Object? id = null,Object? isAiGenerated = null,Object? isBlockedByAuthor = null,Object? isMutedByViewer = null,Object? isPromotional = null,Object? liked = null,Object? likesCount = null,Object? mediaAlts = null,Object? mediaR18Flags = null,Object? mediaSpoilerFlags = null,Object? mediaTypes = null,Object? mediaUrls = null,Object? mentions = null,Object? parentId = freezed,Object? poll = freezed,Object? quoteUsersCount = null,Object? quotedPost = freezed,Object? quotedPostId = freezed,Object? reactionSummary = null,Object? reactions = null,Object? rekaroted = null,Object? rekarotedBy = freezed,Object? rekarotsCount = null,Object? repliesCount = null,Object? replyCircle = freezed,Object? replyCircleId = freezed,Object? replyRestriction = null,Object? replyTargets = null,Object? replyToUsers = null,Object? updatedAt = null,Object? viewerCircle = freezed,Object? viewerCircleId = freezed,Object? viewsCount = null,Object? visibility = null,}) {
  return _then(_Post(
author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
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
as List<HashTags>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isAiGenerated: null == isAiGenerated ? _self.isAiGenerated : isAiGenerated // ignore: cast_nullable_to_non_nullable
as bool,isBlockedByAuthor: null == isBlockedByAuthor ? _self.isBlockedByAuthor : isBlockedByAuthor // ignore: cast_nullable_to_non_nullable
as bool,isMutedByViewer: null == isMutedByViewer ? _self.isMutedByViewer : isMutedByViewer // ignore: cast_nullable_to_non_nullable
as bool,isPromotional: null == isPromotional ? _self.isPromotional : isPromotional // ignore: cast_nullable_to_non_nullable
as bool,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,mediaAlts: null == mediaAlts ? _self._mediaAlts : mediaAlts // ignore: cast_nullable_to_non_nullable
as List<String>,mediaR18Flags: null == mediaR18Flags ? _self._mediaR18Flags : mediaR18Flags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaSpoilerFlags: null == mediaSpoilerFlags ? _self._mediaSpoilerFlags : mediaSpoilerFlags // ignore: cast_nullable_to_non_nullable
as List<bool>,mediaTypes: null == mediaTypes ? _self._mediaTypes : mediaTypes // ignore: cast_nullable_to_non_nullable
as List<String>,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,mentions: null == mentions ? _self._mentions : mentions // ignore: cast_nullable_to_non_nullable
as List<MentionId>,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,quoteUsersCount: null == quoteUsersCount ? _self.quoteUsersCount : quoteUsersCount // ignore: cast_nullable_to_non_nullable
as int,quotedPost: freezed == quotedPost ? _self.quotedPost : quotedPost // ignore: cast_nullable_to_non_nullable
as QuotedPost?,quotedPostId: freezed == quotedPostId ? _self.quotedPostId : quotedPostId // ignore: cast_nullable_to_non_nullable
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
as List<Author>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,viewerCircle: freezed == viewerCircle ? _self.viewerCircle : viewerCircle // ignore: cast_nullable_to_non_nullable
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
$QuotedPostCopyWith<$Res>? get quotedPost {
    if (_self.quotedPost == null) {
    return null;
  }

  return $QuotedPostCopyWith<$Res>(_self.quotedPost!, (value) {
    return _then(_self.copyWith(quotedPost: value));
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
