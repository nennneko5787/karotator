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

 int? get avatarFrameId; String? get avatarUrl; String get displayName; int get id; bool get isPrivate; bool get isBotAccount; bool get isParodyAccount; List<String> get officialMark; String get username;
/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorCopyWith<Author> get copyWith => _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Author&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&const DeepCollectionEquality().equals(other.officialMark, officialMark)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,isBotAccount,isParodyAccount,const DeepCollectionEquality().hash(officialMark),username);

@override
String toString() {
  return 'Author(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, officialMark: $officialMark, username: $username)';
}


}

/// @nodoc
abstract mixin class $AuthorCopyWith<$Res>  {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) = _$AuthorCopyWithImpl;
@useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, bool isBotAccount, bool isParodyAccount, List<String> officialMark, String username
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
@pragma('vm:prefer-inline') @override $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? officialMark = null,Object? username = null,}) {
  return _then(_self.copyWith(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self.officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<String>,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  List<String> officialMark,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.officialMark,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  List<String> officialMark,  String username)  $default,) {final _that = this;
switch (_that) {
case _Author():
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.officialMark,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  List<String> officialMark,  String username)?  $default,) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.officialMark,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Author implements Author {
  const _Author({this.avatarFrameId, this.avatarUrl, required this.displayName, required this.id, this.isPrivate = false, this.isBotAccount = false, this.isParodyAccount = false, final  List<String> officialMark = const [], required this.username}): _officialMark = officialMark;
  factory _Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

@override final  int? avatarFrameId;
@override final  String? avatarUrl;
@override final  String displayName;
@override final  int id;
@override@JsonKey() final  bool isPrivate;
@override@JsonKey() final  bool isBotAccount;
@override@JsonKey() final  bool isParodyAccount;
 final  List<String> _officialMark;
@override@JsonKey() List<String> get officialMark {
  if (_officialMark is EqualUnmodifiableListView) return _officialMark;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_officialMark);
}

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Author&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&const DeepCollectionEquality().equals(other._officialMark, _officialMark)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,isBotAccount,isParodyAccount,const DeepCollectionEquality().hash(_officialMark),username);

@override
String toString() {
  return 'Author(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, officialMark: $officialMark, username: $username)';
}


}

/// @nodoc
abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) = __$AuthorCopyWithImpl;
@override @useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, bool isBotAccount, bool isParodyAccount, List<String> officialMark, String username
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
@override @pragma('vm:prefer-inline') $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? officialMark = null,Object? username = null,}) {
  return _then(_Author(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self._officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<String>,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthUser {

 String? get avatarUrl; String get displayName; int get id; String? get email; bool get emailVerified; String get username;
/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserCopyWith<AuthUser> get copyWith => _$AuthUserCopyWithImpl<AuthUser>(this as AuthUser, _$identity);

  /// Serializes this AuthUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUser&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarUrl,displayName,id,email,emailVerified,username);

@override
String toString() {
  return 'AuthUser(avatarUrl: $avatarUrl, displayName: $displayName, id: $id, email: $email, emailVerified: $emailVerified, username: $username)';
}


}

/// @nodoc
abstract mixin class $AuthUserCopyWith<$Res>  {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) _then) = _$AuthUserCopyWithImpl;
@useResult
$Res call({
 String? avatarUrl, String displayName, int id, String? email, bool emailVerified, String username
});




}
/// @nodoc
class _$AuthUserCopyWithImpl<$Res>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._self, this._then);

  final AuthUser _self;
  final $Res Function(AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? email = freezed,Object? emailVerified = null,Object? username = null,}) {
  return _then(_self.copyWith(
avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUser].
extension AuthUserPatterns on AuthUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUser value)  $default,){
final _that = this;
switch (_that) {
case _AuthUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUser value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? avatarUrl,  String displayName,  int id,  String? email,  bool emailVerified,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.avatarUrl,_that.displayName,_that.id,_that.email,_that.emailVerified,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? avatarUrl,  String displayName,  int id,  String? email,  bool emailVerified,  String username)  $default,) {final _that = this;
switch (_that) {
case _AuthUser():
return $default(_that.avatarUrl,_that.displayName,_that.id,_that.email,_that.emailVerified,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? avatarUrl,  String displayName,  int id,  String? email,  bool emailVerified,  String username)?  $default,) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.avatarUrl,_that.displayName,_that.id,_that.email,_that.emailVerified,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUser implements AuthUser {
  const _AuthUser({this.avatarUrl, required this.displayName, required this.id, this.email, required this.emailVerified, required this.username});
  factory _AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);

@override final  String? avatarUrl;
@override final  String displayName;
@override final  int id;
@override final  String? email;
@override final  bool emailVerified;
@override final  String username;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserCopyWith<_AuthUser> get copyWith => __$AuthUserCopyWithImpl<_AuthUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUser&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarUrl,displayName,id,email,emailVerified,username);

@override
String toString() {
  return 'AuthUser(avatarUrl: $avatarUrl, displayName: $displayName, id: $id, email: $email, emailVerified: $emailVerified, username: $username)';
}


}

/// @nodoc
abstract mixin class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) _then) = __$AuthUserCopyWithImpl;
@override @useResult
$Res call({
 String? avatarUrl, String displayName, int id, String? email, bool emailVerified, String username
});




}
/// @nodoc
class __$AuthUserCopyWithImpl<$Res>
    implements _$AuthUserCopyWith<$Res> {
  __$AuthUserCopyWithImpl(this._self, this._then);

  final _AuthUser _self;
  final $Res Function(_AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? email = freezed,Object? emailVerified = null,Object? username = null,}) {
  return _then(_AuthUser(
avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$User {

 int? get avatarFrameId; String? get avatarUrl; String get displayName; int get id; bool get isPrivate; bool get isBotAccount; bool get isParodyAccount; List<String> get officialMark; String get username; int? get pinnedPostId; String? get headerUrl; String get bio; String? get birthday; BirthdayVisibility get birthdayVisibility; bool get birthdayBalloonsEnabled; bool get hideProfileFromMinors; String? get websiteUrl; String? get location; OnlineStatus get onlineStatus; int get followersCount; int get followingCount; int get postsCount; bool get isPremium; DateTime get createdAt; List<String> get userBadges; int? get age; List<String> get badges;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&const DeepCollectionEquality().equals(other.officialMark, officialMark)&&(identical(other.username, username) || other.username == username)&&(identical(other.pinnedPostId, pinnedPostId) || other.pinnedPostId == pinnedPostId)&&(identical(other.headerUrl, headerUrl) || other.headerUrl == headerUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.birthdayVisibility, birthdayVisibility) || other.birthdayVisibility == birthdayVisibility)&&(identical(other.birthdayBalloonsEnabled, birthdayBalloonsEnabled) || other.birthdayBalloonsEnabled == birthdayBalloonsEnabled)&&(identical(other.hideProfileFromMinors, hideProfileFromMinors) || other.hideProfileFromMinors == hideProfileFromMinors)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.onlineStatus, onlineStatus) || other.onlineStatus == onlineStatus)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.postsCount, postsCount) || other.postsCount == postsCount)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.userBadges, userBadges)&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other.badges, badges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,isBotAccount,isParodyAccount,const DeepCollectionEquality().hash(officialMark),username,pinnedPostId,headerUrl,bio,birthday,birthdayVisibility,birthdayBalloonsEnabled,hideProfileFromMinors,websiteUrl,location,onlineStatus,followersCount,followingCount,postsCount,isPremium,createdAt,const DeepCollectionEquality().hash(userBadges),age,const DeepCollectionEquality().hash(badges)]);

@override
String toString() {
  return 'User(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, officialMark: $officialMark, username: $username, pinnedPostId: $pinnedPostId, headerUrl: $headerUrl, bio: $bio, birthday: $birthday, birthdayVisibility: $birthdayVisibility, birthdayBalloonsEnabled: $birthdayBalloonsEnabled, hideProfileFromMinors: $hideProfileFromMinors, websiteUrl: $websiteUrl, location: $location, onlineStatus: $onlineStatus, followersCount: $followersCount, followingCount: $followingCount, postsCount: $postsCount, isPremium: $isPremium, createdAt: $createdAt, userBadges: $userBadges, age: $age, badges: $badges)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, bool isBotAccount, bool isParodyAccount, List<String> officialMark, String username, int? pinnedPostId, String? headerUrl, String bio, String? birthday, BirthdayVisibility birthdayVisibility, bool birthdayBalloonsEnabled, bool hideProfileFromMinors, String? websiteUrl, String? location, OnlineStatus onlineStatus, int followersCount, int followingCount, int postsCount, bool isPremium, DateTime createdAt, List<String> userBadges, int? age, List<String> badges
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? officialMark = null,Object? username = null,Object? pinnedPostId = freezed,Object? headerUrl = freezed,Object? bio = null,Object? birthday = freezed,Object? birthdayVisibility = null,Object? birthdayBalloonsEnabled = null,Object? hideProfileFromMinors = null,Object? websiteUrl = freezed,Object? location = freezed,Object? onlineStatus = null,Object? followersCount = null,Object? followingCount = null,Object? postsCount = null,Object? isPremium = null,Object? createdAt = null,Object? userBadges = null,Object? age = freezed,Object? badges = null,}) {
  return _then(_self.copyWith(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self.officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<String>,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,pinnedPostId: freezed == pinnedPostId ? _self.pinnedPostId : pinnedPostId // ignore: cast_nullable_to_non_nullable
as int?,headerUrl: freezed == headerUrl ? _self.headerUrl : headerUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,birthdayVisibility: null == birthdayVisibility ? _self.birthdayVisibility : birthdayVisibility // ignore: cast_nullable_to_non_nullable
as BirthdayVisibility,birthdayBalloonsEnabled: null == birthdayBalloonsEnabled ? _self.birthdayBalloonsEnabled : birthdayBalloonsEnabled // ignore: cast_nullable_to_non_nullable
as bool,hideProfileFromMinors: null == hideProfileFromMinors ? _self.hideProfileFromMinors : hideProfileFromMinors // ignore: cast_nullable_to_non_nullable
as bool,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,onlineStatus: null == onlineStatus ? _self.onlineStatus : onlineStatus // ignore: cast_nullable_to_non_nullable
as OnlineStatus,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,postsCount: null == postsCount ? _self.postsCount : postsCount // ignore: cast_nullable_to_non_nullable
as int,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,userBadges: null == userBadges ? _self.userBadges : userBadges // ignore: cast_nullable_to_non_nullable
as List<String>,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  List<String> officialMark,  String username,  int? pinnedPostId,  String? headerUrl,  String bio,  String? birthday,  BirthdayVisibility birthdayVisibility,  bool birthdayBalloonsEnabled,  bool hideProfileFromMinors,  String? websiteUrl,  String? location,  OnlineStatus onlineStatus,  int followersCount,  int followingCount,  int postsCount,  bool isPremium,  DateTime createdAt,  List<String> userBadges,  int? age,  List<String> badges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.officialMark,_that.username,_that.pinnedPostId,_that.headerUrl,_that.bio,_that.birthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.hideProfileFromMinors,_that.websiteUrl,_that.location,_that.onlineStatus,_that.followersCount,_that.followingCount,_that.postsCount,_that.isPremium,_that.createdAt,_that.userBadges,_that.age,_that.badges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  List<String> officialMark,  String username,  int? pinnedPostId,  String? headerUrl,  String bio,  String? birthday,  BirthdayVisibility birthdayVisibility,  bool birthdayBalloonsEnabled,  bool hideProfileFromMinors,  String? websiteUrl,  String? location,  OnlineStatus onlineStatus,  int followersCount,  int followingCount,  int postsCount,  bool isPremium,  DateTime createdAt,  List<String> userBadges,  int? age,  List<String> badges)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.officialMark,_that.username,_that.pinnedPostId,_that.headerUrl,_that.bio,_that.birthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.hideProfileFromMinors,_that.websiteUrl,_that.location,_that.onlineStatus,_that.followersCount,_that.followingCount,_that.postsCount,_that.isPremium,_that.createdAt,_that.userBadges,_that.age,_that.badges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  List<String> officialMark,  String username,  int? pinnedPostId,  String? headerUrl,  String bio,  String? birthday,  BirthdayVisibility birthdayVisibility,  bool birthdayBalloonsEnabled,  bool hideProfileFromMinors,  String? websiteUrl,  String? location,  OnlineStatus onlineStatus,  int followersCount,  int followingCount,  int postsCount,  bool isPremium,  DateTime createdAt,  List<String> userBadges,  int? age,  List<String> badges)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.officialMark,_that.username,_that.pinnedPostId,_that.headerUrl,_that.bio,_that.birthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.hideProfileFromMinors,_that.websiteUrl,_that.location,_that.onlineStatus,_that.followersCount,_that.followingCount,_that.postsCount,_that.isPremium,_that.createdAt,_that.userBadges,_that.age,_that.badges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({this.avatarFrameId, this.avatarUrl, required this.displayName, required this.id, required this.isPrivate, required this.isBotAccount, required this.isParodyAccount, required final  List<String> officialMark, required this.username, this.pinnedPostId, this.headerUrl, required this.bio, this.birthday, required this.birthdayVisibility, required this.birthdayBalloonsEnabled, required this.hideProfileFromMinors, this.websiteUrl, this.location, required this.onlineStatus, required this.followersCount, required this.followingCount, required this.postsCount, required this.isPremium, required this.createdAt, required final  List<String> userBadges, this.age, required final  List<String> badges}): _officialMark = officialMark,_userBadges = userBadges,_badges = badges;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int? avatarFrameId;
@override final  String? avatarUrl;
@override final  String displayName;
@override final  int id;
@override final  bool isPrivate;
@override final  bool isBotAccount;
@override final  bool isParodyAccount;
 final  List<String> _officialMark;
@override List<String> get officialMark {
  if (_officialMark is EqualUnmodifiableListView) return _officialMark;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_officialMark);
}

@override final  String username;
@override final  int? pinnedPostId;
@override final  String? headerUrl;
@override final  String bio;
@override final  String? birthday;
@override final  BirthdayVisibility birthdayVisibility;
@override final  bool birthdayBalloonsEnabled;
@override final  bool hideProfileFromMinors;
@override final  String? websiteUrl;
@override final  String? location;
@override final  OnlineStatus onlineStatus;
@override final  int followersCount;
@override final  int followingCount;
@override final  int postsCount;
@override final  bool isPremium;
@override final  DateTime createdAt;
 final  List<String> _userBadges;
@override List<String> get userBadges {
  if (_userBadges is EqualUnmodifiableListView) return _userBadges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userBadges);
}

@override final  int? age;
 final  List<String> _badges;
@override List<String> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&const DeepCollectionEquality().equals(other._officialMark, _officialMark)&&(identical(other.username, username) || other.username == username)&&(identical(other.pinnedPostId, pinnedPostId) || other.pinnedPostId == pinnedPostId)&&(identical(other.headerUrl, headerUrl) || other.headerUrl == headerUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.birthdayVisibility, birthdayVisibility) || other.birthdayVisibility == birthdayVisibility)&&(identical(other.birthdayBalloonsEnabled, birthdayBalloonsEnabled) || other.birthdayBalloonsEnabled == birthdayBalloonsEnabled)&&(identical(other.hideProfileFromMinors, hideProfileFromMinors) || other.hideProfileFromMinors == hideProfileFromMinors)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.onlineStatus, onlineStatus) || other.onlineStatus == onlineStatus)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.postsCount, postsCount) || other.postsCount == postsCount)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._userBadges, _userBadges)&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other._badges, _badges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,isBotAccount,isParodyAccount,const DeepCollectionEquality().hash(_officialMark),username,pinnedPostId,headerUrl,bio,birthday,birthdayVisibility,birthdayBalloonsEnabled,hideProfileFromMinors,websiteUrl,location,onlineStatus,followersCount,followingCount,postsCount,isPremium,createdAt,const DeepCollectionEquality().hash(_userBadges),age,const DeepCollectionEquality().hash(_badges)]);

@override
String toString() {
  return 'User(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, officialMark: $officialMark, username: $username, pinnedPostId: $pinnedPostId, headerUrl: $headerUrl, bio: $bio, birthday: $birthday, birthdayVisibility: $birthdayVisibility, birthdayBalloonsEnabled: $birthdayBalloonsEnabled, hideProfileFromMinors: $hideProfileFromMinors, websiteUrl: $websiteUrl, location: $location, onlineStatus: $onlineStatus, followersCount: $followersCount, followingCount: $followingCount, postsCount: $postsCount, isPremium: $isPremium, createdAt: $createdAt, userBadges: $userBadges, age: $age, badges: $badges)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, bool isBotAccount, bool isParodyAccount, List<String> officialMark, String username, int? pinnedPostId, String? headerUrl, String bio, String? birthday, BirthdayVisibility birthdayVisibility, bool birthdayBalloonsEnabled, bool hideProfileFromMinors, String? websiteUrl, String? location, OnlineStatus onlineStatus, int followersCount, int followingCount, int postsCount, bool isPremium, DateTime createdAt, List<String> userBadges, int? age, List<String> badges
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? officialMark = null,Object? username = null,Object? pinnedPostId = freezed,Object? headerUrl = freezed,Object? bio = null,Object? birthday = freezed,Object? birthdayVisibility = null,Object? birthdayBalloonsEnabled = null,Object? hideProfileFromMinors = null,Object? websiteUrl = freezed,Object? location = freezed,Object? onlineStatus = null,Object? followersCount = null,Object? followingCount = null,Object? postsCount = null,Object? isPremium = null,Object? createdAt = null,Object? userBadges = null,Object? age = freezed,Object? badges = null,}) {
  return _then(_User(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self._officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<String>,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,pinnedPostId: freezed == pinnedPostId ? _self.pinnedPostId : pinnedPostId // ignore: cast_nullable_to_non_nullable
as int?,headerUrl: freezed == headerUrl ? _self.headerUrl : headerUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,birthdayVisibility: null == birthdayVisibility ? _self.birthdayVisibility : birthdayVisibility // ignore: cast_nullable_to_non_nullable
as BirthdayVisibility,birthdayBalloonsEnabled: null == birthdayBalloonsEnabled ? _self.birthdayBalloonsEnabled : birthdayBalloonsEnabled // ignore: cast_nullable_to_non_nullable
as bool,hideProfileFromMinors: null == hideProfileFromMinors ? _self.hideProfileFromMinors : hideProfileFromMinors // ignore: cast_nullable_to_non_nullable
as bool,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,onlineStatus: null == onlineStatus ? _self.onlineStatus : onlineStatus // ignore: cast_nullable_to_non_nullable
as OnlineStatus,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,postsCount: null == postsCount ? _self.postsCount : postsCount // ignore: cast_nullable_to_non_nullable
as int,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,userBadges: null == userBadges ? _self._userBadges : userBadges // ignore: cast_nullable_to_non_nullable
as List<String>,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
