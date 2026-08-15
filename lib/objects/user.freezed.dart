// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Author {

 int? get avatarFrameId; String? get avatarUrl; String get displayName; int get id; bool get isPrivate; bool get isBotAccount; bool get isParodyAccount; bool get adminForceParody; bool get adminForceBot;@OfficialMarkListConverter() List<OfficialMark> get officialMark; String get username; String? get bio; bool get isBanned; bool get hideProfileFromMinors; int? get profileMinimumAge; int? get profileMaximumAge; int get followersCount; int get followingCount; int get mutualFollowersCount;/// 閲覧者から見た関係。おすすめユーザーの一覧などに乗る。
 bool get isFollowingByViewer;/// 検索結果だけスネークケースで来る。同じ意味の別名。
@JsonKey(name: 'is_following') bool get isFollowing;@JsonKey(name: 'is_followed_by') bool get isFollowedBy;@JsonKey(name: 'follow_request_sent') bool get followRequestSent; String? get cardAccentColor; String? get profileAccentColor; String get premiumBadgeColor; List<String> get subscriptionBadgeColors; String get subscriptionPlan; String get subscriptionStatus; DateTime? get subscriptionActiveUntil; bool get showCardDecoration; bool get showProfileDecoration; bool get showSubscriptionBadges; bool get showGreenBadge; bool get showPlusBadge; bool get showProBadge; bool get showRedBadge;
/// Create a copy of Author
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorCopyWith<Author> get copyWith => _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Author&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&(identical(other.adminForceParody, adminForceParody) || other.adminForceParody == adminForceParody)&&(identical(other.adminForceBot, adminForceBot) || other.adminForceBot == adminForceBot)&&const DeepCollectionEquality().equals(other.officialMark, officialMark)&&(identical(other.username, username) || other.username == username)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.hideProfileFromMinors, hideProfileFromMinors) || other.hideProfileFromMinors == hideProfileFromMinors)&&(identical(other.profileMinimumAge, profileMinimumAge) || other.profileMinimumAge == profileMinimumAge)&&(identical(other.profileMaximumAge, profileMaximumAge) || other.profileMaximumAge == profileMaximumAge)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.mutualFollowersCount, mutualFollowersCount) || other.mutualFollowersCount == mutualFollowersCount)&&(identical(other.isFollowingByViewer, isFollowingByViewer) || other.isFollowingByViewer == isFollowingByViewer)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isFollowedBy, isFollowedBy) || other.isFollowedBy == isFollowedBy)&&(identical(other.followRequestSent, followRequestSent) || other.followRequestSent == followRequestSent)&&(identical(other.cardAccentColor, cardAccentColor) || other.cardAccentColor == cardAccentColor)&&(identical(other.profileAccentColor, profileAccentColor) || other.profileAccentColor == profileAccentColor)&&(identical(other.premiumBadgeColor, premiumBadgeColor) || other.premiumBadgeColor == premiumBadgeColor)&&const DeepCollectionEquality().equals(other.subscriptionBadgeColors, subscriptionBadgeColors)&&(identical(other.subscriptionPlan, subscriptionPlan) || other.subscriptionPlan == subscriptionPlan)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.subscriptionActiveUntil, subscriptionActiveUntil) || other.subscriptionActiveUntil == subscriptionActiveUntil)&&(identical(other.showCardDecoration, showCardDecoration) || other.showCardDecoration == showCardDecoration)&&(identical(other.showProfileDecoration, showProfileDecoration) || other.showProfileDecoration == showProfileDecoration)&&(identical(other.showSubscriptionBadges, showSubscriptionBadges) || other.showSubscriptionBadges == showSubscriptionBadges)&&(identical(other.showGreenBadge, showGreenBadge) || other.showGreenBadge == showGreenBadge)&&(identical(other.showPlusBadge, showPlusBadge) || other.showPlusBadge == showPlusBadge)&&(identical(other.showProBadge, showProBadge) || other.showProBadge == showProBadge)&&(identical(other.showRedBadge, showRedBadge) || other.showRedBadge == showRedBadge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,isBotAccount,isParodyAccount,adminForceParody,adminForceBot,const DeepCollectionEquality().hash(officialMark),username,bio,isBanned,hideProfileFromMinors,profileMinimumAge,profileMaximumAge,followersCount,followingCount,mutualFollowersCount,isFollowingByViewer,isFollowing,isFollowedBy,followRequestSent,cardAccentColor,profileAccentColor,premiumBadgeColor,const DeepCollectionEquality().hash(subscriptionBadgeColors),subscriptionPlan,subscriptionStatus,subscriptionActiveUntil,showCardDecoration,showProfileDecoration,showSubscriptionBadges,showGreenBadge,showPlusBadge,showProBadge,showRedBadge]);

@override
String toString() {
  return 'Author(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, adminForceParody: $adminForceParody, adminForceBot: $adminForceBot, officialMark: $officialMark, username: $username, bio: $bio, isBanned: $isBanned, hideProfileFromMinors: $hideProfileFromMinors, profileMinimumAge: $profileMinimumAge, profileMaximumAge: $profileMaximumAge, followersCount: $followersCount, followingCount: $followingCount, mutualFollowersCount: $mutualFollowersCount, isFollowingByViewer: $isFollowingByViewer, isFollowing: $isFollowing, isFollowedBy: $isFollowedBy, followRequestSent: $followRequestSent, cardAccentColor: $cardAccentColor, profileAccentColor: $profileAccentColor, premiumBadgeColor: $premiumBadgeColor, subscriptionBadgeColors: $subscriptionBadgeColors, subscriptionPlan: $subscriptionPlan, subscriptionStatus: $subscriptionStatus, subscriptionActiveUntil: $subscriptionActiveUntil, showCardDecoration: $showCardDecoration, showProfileDecoration: $showProfileDecoration, showSubscriptionBadges: $showSubscriptionBadges, showGreenBadge: $showGreenBadge, showPlusBadge: $showPlusBadge, showProBadge: $showProBadge, showRedBadge: $showRedBadge)';
}


}

/// @nodoc
abstract mixin class $AuthorCopyWith<$Res>  {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) = _$AuthorCopyWithImpl;
@useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, bool isBotAccount, bool isParodyAccount, bool adminForceParody, bool adminForceBot,@OfficialMarkListConverter() List<OfficialMark> officialMark, String username, String? bio, bool isBanned, bool hideProfileFromMinors, int? profileMinimumAge, int? profileMaximumAge, int followersCount, int followingCount, int mutualFollowersCount, bool isFollowingByViewer,@JsonKey(name: 'is_following') bool isFollowing,@JsonKey(name: 'is_followed_by') bool isFollowedBy,@JsonKey(name: 'follow_request_sent') bool followRequestSent, String? cardAccentColor, String? profileAccentColor, String premiumBadgeColor, List<String> subscriptionBadgeColors, String subscriptionPlan, String subscriptionStatus, DateTime? subscriptionActiveUntil, bool showCardDecoration, bool showProfileDecoration, bool showSubscriptionBadges, bool showGreenBadge, bool showPlusBadge, bool showProBadge, bool showRedBadge
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
@pragma('vm:prefer-inline') @override $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? adminForceParody = null,Object? adminForceBot = null,Object? officialMark = null,Object? username = null,Object? bio = freezed,Object? isBanned = null,Object? hideProfileFromMinors = null,Object? profileMinimumAge = freezed,Object? profileMaximumAge = freezed,Object? followersCount = null,Object? followingCount = null,Object? mutualFollowersCount = null,Object? isFollowingByViewer = null,Object? isFollowing = null,Object? isFollowedBy = null,Object? followRequestSent = null,Object? cardAccentColor = freezed,Object? profileAccentColor = freezed,Object? premiumBadgeColor = null,Object? subscriptionBadgeColors = null,Object? subscriptionPlan = null,Object? subscriptionStatus = null,Object? subscriptionActiveUntil = freezed,Object? showCardDecoration = null,Object? showProfileDecoration = null,Object? showSubscriptionBadges = null,Object? showGreenBadge = null,Object? showPlusBadge = null,Object? showProBadge = null,Object? showRedBadge = null,}) {
  return _then(Author(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,adminForceParody: null == adminForceParody ? _self.adminForceParody : adminForceParody // ignore: cast_nullable_to_non_nullable
as bool,adminForceBot: null == adminForceBot ? _self.adminForceBot : adminForceBot // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self.officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<OfficialMark>,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,hideProfileFromMinors: null == hideProfileFromMinors ? _self.hideProfileFromMinors : hideProfileFromMinors // ignore: cast_nullable_to_non_nullable
as bool,profileMinimumAge: freezed == profileMinimumAge ? _self.profileMinimumAge : profileMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,profileMaximumAge: freezed == profileMaximumAge ? _self.profileMaximumAge : profileMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,mutualFollowersCount: null == mutualFollowersCount ? _self.mutualFollowersCount : mutualFollowersCount // ignore: cast_nullable_to_non_nullable
as int,isFollowingByViewer: null == isFollowingByViewer ? _self.isFollowingByViewer : isFollowingByViewer // ignore: cast_nullable_to_non_nullable
as bool,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,isFollowedBy: null == isFollowedBy ? _self.isFollowedBy : isFollowedBy // ignore: cast_nullable_to_non_nullable
as bool,followRequestSent: null == followRequestSent ? _self.followRequestSent : followRequestSent // ignore: cast_nullable_to_non_nullable
as bool,cardAccentColor: freezed == cardAccentColor ? _self.cardAccentColor : cardAccentColor // ignore: cast_nullable_to_non_nullable
as String?,profileAccentColor: freezed == profileAccentColor ? _self.profileAccentColor : profileAccentColor // ignore: cast_nullable_to_non_nullable
as String?,premiumBadgeColor: null == premiumBadgeColor ? _self.premiumBadgeColor : premiumBadgeColor // ignore: cast_nullable_to_non_nullable
as String,subscriptionBadgeColors: null == subscriptionBadgeColors ? _self.subscriptionBadgeColors : subscriptionBadgeColors // ignore: cast_nullable_to_non_nullable
as List<String>,subscriptionPlan: null == subscriptionPlan ? _self.subscriptionPlan : subscriptionPlan // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionActiveUntil: freezed == subscriptionActiveUntil ? _self.subscriptionActiveUntil : subscriptionActiveUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,showCardDecoration: null == showCardDecoration ? _self.showCardDecoration : showCardDecoration // ignore: cast_nullable_to_non_nullable
as bool,showProfileDecoration: null == showProfileDecoration ? _self.showProfileDecoration : showProfileDecoration // ignore: cast_nullable_to_non_nullable
as bool,showSubscriptionBadges: null == showSubscriptionBadges ? _self.showSubscriptionBadges : showSubscriptionBadges // ignore: cast_nullable_to_non_nullable
as bool,showGreenBadge: null == showGreenBadge ? _self.showGreenBadge : showGreenBadge // ignore: cast_nullable_to_non_nullable
as bool,showPlusBadge: null == showPlusBadge ? _self.showPlusBadge : showPlusBadge // ignore: cast_nullable_to_non_nullable
as bool,showProBadge: null == showProBadge ? _self.showProBadge : showProBadge // ignore: cast_nullable_to_non_nullable
as bool,showRedBadge: null == showRedBadge ? _self.showRedBadge : showRedBadge // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  String username,  String? bio,  bool isBanned,  bool hideProfileFromMinors,  int? profileMinimumAge,  int? profileMaximumAge,  int followersCount,  int followingCount,  int mutualFollowersCount,  bool isFollowingByViewer, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_followed_by')  bool isFollowedBy, @JsonKey(name: 'follow_request_sent')  bool followRequestSent,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.officialMark,_that.username,_that.bio,_that.isBanned,_that.hideProfileFromMinors,_that.profileMinimumAge,_that.profileMaximumAge,_that.followersCount,_that.followingCount,_that.mutualFollowersCount,_that.isFollowingByViewer,_that.isFollowing,_that.isFollowedBy,_that.followRequestSent,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  String username,  String? bio,  bool isBanned,  bool hideProfileFromMinors,  int? profileMinimumAge,  int? profileMaximumAge,  int followersCount,  int followingCount,  int mutualFollowersCount,  bool isFollowingByViewer, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_followed_by')  bool isFollowedBy, @JsonKey(name: 'follow_request_sent')  bool followRequestSent,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)  $default,) {final _that = this;
switch (_that) {
case _Author():
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.officialMark,_that.username,_that.bio,_that.isBanned,_that.hideProfileFromMinors,_that.profileMinimumAge,_that.profileMaximumAge,_that.followersCount,_that.followingCount,_that.mutualFollowersCount,_that.isFollowingByViewer,_that.isFollowing,_that.isFollowedBy,_that.followRequestSent,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  String username,  String? bio,  bool isBanned,  bool hideProfileFromMinors,  int? profileMinimumAge,  int? profileMaximumAge,  int followersCount,  int followingCount,  int mutualFollowersCount,  bool isFollowingByViewer, @JsonKey(name: 'is_following')  bool isFollowing, @JsonKey(name: 'is_followed_by')  bool isFollowedBy, @JsonKey(name: 'follow_request_sent')  bool followRequestSent,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)?  $default,) {final _that = this;
switch (_that) {
case _Author() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.officialMark,_that.username,_that.bio,_that.isBanned,_that.hideProfileFromMinors,_that.profileMinimumAge,_that.profileMaximumAge,_that.followersCount,_that.followingCount,_that.mutualFollowersCount,_that.isFollowingByViewer,_that.isFollowing,_that.isFollowedBy,_that.followRequestSent,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Author implements Author {
  const _Author({this.avatarFrameId, this.avatarUrl, required this.displayName, required this.id, this.isPrivate = false, this.isBotAccount = false, this.isParodyAccount = false, this.adminForceParody = false, this.adminForceBot = false, @OfficialMarkListConverter()  List<OfficialMark> officialMark = const [], required this.username, this.bio, this.isBanned = false, this.hideProfileFromMinors = false, this.profileMinimumAge, this.profileMaximumAge, this.followersCount = 0, this.followingCount = 0, this.mutualFollowersCount = 0, this.isFollowingByViewer = false, @JsonKey(name: 'is_following') this.isFollowing = false, @JsonKey(name: 'is_followed_by') this.isFollowedBy = false, @JsonKey(name: 'follow_request_sent') this.followRequestSent = false, this.cardAccentColor, this.profileAccentColor, this.premiumBadgeColor = '',  List<String> subscriptionBadgeColors = const [], this.subscriptionPlan = '', this.subscriptionStatus = '', this.subscriptionActiveUntil, this.showCardDecoration = false, this.showProfileDecoration = false, this.showSubscriptionBadges = false, this.showGreenBadge = false, this.showPlusBadge = false, this.showProBadge = false, this.showRedBadge = false}): _officialMark = officialMark,_subscriptionBadgeColors = subscriptionBadgeColors;
  factory _Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

@override final  int? avatarFrameId;
@override final  String? avatarUrl;
@override final  String displayName;
@override final  int id;
@override@JsonKey() final  bool isPrivate;
@override@JsonKey() final  bool isBotAccount;
@override@JsonKey() final  bool isParodyAccount;
@override@JsonKey() final  bool adminForceParody;
@override@JsonKey() final  bool adminForceBot;
 final  List<OfficialMark> _officialMark;
@override@JsonKey()@OfficialMarkListConverter() List<OfficialMark> get officialMark {
  if (_officialMark is EqualUnmodifiableListView) return _officialMark;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_officialMark);
}

@override final  String username;
@override final  String? bio;
@override@JsonKey() final  bool isBanned;
@override@JsonKey() final  bool hideProfileFromMinors;
@override final  int? profileMinimumAge;
@override final  int? profileMaximumAge;
@override@JsonKey() final  int followersCount;
@override@JsonKey() final  int followingCount;
@override@JsonKey() final  int mutualFollowersCount;
/// 閲覧者から見た関係。おすすめユーザーの一覧などに乗る。
@override@JsonKey() final  bool isFollowingByViewer;
/// 検索結果だけスネークケースで来る。同じ意味の別名。
@override@JsonKey(name: 'is_following') final  bool isFollowing;
@override@JsonKey(name: 'is_followed_by') final  bool isFollowedBy;
@override@JsonKey(name: 'follow_request_sent') final  bool followRequestSent;
@override final  String? cardAccentColor;
@override final  String? profileAccentColor;
@override@JsonKey() final  String premiumBadgeColor;
 final  List<String> _subscriptionBadgeColors;
@override@JsonKey() List<String> get subscriptionBadgeColors {
  if (_subscriptionBadgeColors is EqualUnmodifiableListView) return _subscriptionBadgeColors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subscriptionBadgeColors);
}

@override@JsonKey() final  String subscriptionPlan;
@override@JsonKey() final  String subscriptionStatus;
@override final  DateTime? subscriptionActiveUntil;
@override@JsonKey() final  bool showCardDecoration;
@override@JsonKey() final  bool showProfileDecoration;
@override@JsonKey() final  bool showSubscriptionBadges;
@override@JsonKey() final  bool showGreenBadge;
@override@JsonKey() final  bool showPlusBadge;
@override@JsonKey() final  bool showProBadge;
@override@JsonKey() final  bool showRedBadge;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Author&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&(identical(other.adminForceParody, adminForceParody) || other.adminForceParody == adminForceParody)&&(identical(other.adminForceBot, adminForceBot) || other.adminForceBot == adminForceBot)&&const DeepCollectionEquality().equals(other._officialMark, _officialMark)&&(identical(other.username, username) || other.username == username)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.hideProfileFromMinors, hideProfileFromMinors) || other.hideProfileFromMinors == hideProfileFromMinors)&&(identical(other.profileMinimumAge, profileMinimumAge) || other.profileMinimumAge == profileMinimumAge)&&(identical(other.profileMaximumAge, profileMaximumAge) || other.profileMaximumAge == profileMaximumAge)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.mutualFollowersCount, mutualFollowersCount) || other.mutualFollowersCount == mutualFollowersCount)&&(identical(other.isFollowingByViewer, isFollowingByViewer) || other.isFollowingByViewer == isFollowingByViewer)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.isFollowedBy, isFollowedBy) || other.isFollowedBy == isFollowedBy)&&(identical(other.followRequestSent, followRequestSent) || other.followRequestSent == followRequestSent)&&(identical(other.cardAccentColor, cardAccentColor) || other.cardAccentColor == cardAccentColor)&&(identical(other.profileAccentColor, profileAccentColor) || other.profileAccentColor == profileAccentColor)&&(identical(other.premiumBadgeColor, premiumBadgeColor) || other.premiumBadgeColor == premiumBadgeColor)&&const DeepCollectionEquality().equals(other._subscriptionBadgeColors, _subscriptionBadgeColors)&&(identical(other.subscriptionPlan, subscriptionPlan) || other.subscriptionPlan == subscriptionPlan)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.subscriptionActiveUntil, subscriptionActiveUntil) || other.subscriptionActiveUntil == subscriptionActiveUntil)&&(identical(other.showCardDecoration, showCardDecoration) || other.showCardDecoration == showCardDecoration)&&(identical(other.showProfileDecoration, showProfileDecoration) || other.showProfileDecoration == showProfileDecoration)&&(identical(other.showSubscriptionBadges, showSubscriptionBadges) || other.showSubscriptionBadges == showSubscriptionBadges)&&(identical(other.showGreenBadge, showGreenBadge) || other.showGreenBadge == showGreenBadge)&&(identical(other.showPlusBadge, showPlusBadge) || other.showPlusBadge == showPlusBadge)&&(identical(other.showProBadge, showProBadge) || other.showProBadge == showProBadge)&&(identical(other.showRedBadge, showRedBadge) || other.showRedBadge == showRedBadge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,isBotAccount,isParodyAccount,adminForceParody,adminForceBot,const DeepCollectionEquality().hash(_officialMark),username,bio,isBanned,hideProfileFromMinors,profileMinimumAge,profileMaximumAge,followersCount,followingCount,mutualFollowersCount,isFollowingByViewer,isFollowing,isFollowedBy,followRequestSent,cardAccentColor,profileAccentColor,premiumBadgeColor,const DeepCollectionEquality().hash(_subscriptionBadgeColors),subscriptionPlan,subscriptionStatus,subscriptionActiveUntil,showCardDecoration,showProfileDecoration,showSubscriptionBadges,showGreenBadge,showPlusBadge,showProBadge,showRedBadge]);

@override
String toString() {
  return 'Author(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, adminForceParody: $adminForceParody, adminForceBot: $adminForceBot, officialMark: $officialMark, username: $username, bio: $bio, isBanned: $isBanned, hideProfileFromMinors: $hideProfileFromMinors, profileMinimumAge: $profileMinimumAge, profileMaximumAge: $profileMaximumAge, followersCount: $followersCount, followingCount: $followingCount, mutualFollowersCount: $mutualFollowersCount, isFollowingByViewer: $isFollowingByViewer, isFollowing: $isFollowing, isFollowedBy: $isFollowedBy, followRequestSent: $followRequestSent, cardAccentColor: $cardAccentColor, profileAccentColor: $profileAccentColor, premiumBadgeColor: $premiumBadgeColor, subscriptionBadgeColors: $subscriptionBadgeColors, subscriptionPlan: $subscriptionPlan, subscriptionStatus: $subscriptionStatus, subscriptionActiveUntil: $subscriptionActiveUntil, showCardDecoration: $showCardDecoration, showProfileDecoration: $showProfileDecoration, showSubscriptionBadges: $showSubscriptionBadges, showGreenBadge: $showGreenBadge, showPlusBadge: $showPlusBadge, showProBadge: $showProBadge, showRedBadge: $showRedBadge)';
}


}

/// @nodoc
abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) = __$AuthorCopyWithImpl;
@override @useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, bool isBotAccount, bool isParodyAccount, bool adminForceParody, bool adminForceBot,@OfficialMarkListConverter() List<OfficialMark> officialMark, String username, String? bio, bool isBanned, bool hideProfileFromMinors, int? profileMinimumAge, int? profileMaximumAge, int followersCount, int followingCount, int mutualFollowersCount, bool isFollowingByViewer,@JsonKey(name: 'is_following') bool isFollowing,@JsonKey(name: 'is_followed_by') bool isFollowedBy,@JsonKey(name: 'follow_request_sent') bool followRequestSent, String? cardAccentColor, String? profileAccentColor, String premiumBadgeColor, List<String> subscriptionBadgeColors, String subscriptionPlan, String subscriptionStatus, DateTime? subscriptionActiveUntil, bool showCardDecoration, bool showProfileDecoration, bool showSubscriptionBadges, bool showGreenBadge, bool showPlusBadge, bool showProBadge, bool showRedBadge
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
@override @pragma('vm:prefer-inline') $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? adminForceParody = null,Object? adminForceBot = null,Object? officialMark = null,Object? username = null,Object? bio = freezed,Object? isBanned = null,Object? hideProfileFromMinors = null,Object? profileMinimumAge = freezed,Object? profileMaximumAge = freezed,Object? followersCount = null,Object? followingCount = null,Object? mutualFollowersCount = null,Object? isFollowingByViewer = null,Object? isFollowing = null,Object? isFollowedBy = null,Object? followRequestSent = null,Object? cardAccentColor = freezed,Object? profileAccentColor = freezed,Object? premiumBadgeColor = null,Object? subscriptionBadgeColors = null,Object? subscriptionPlan = null,Object? subscriptionStatus = null,Object? subscriptionActiveUntil = freezed,Object? showCardDecoration = null,Object? showProfileDecoration = null,Object? showSubscriptionBadges = null,Object? showGreenBadge = null,Object? showPlusBadge = null,Object? showProBadge = null,Object? showRedBadge = null,}) {
  return _then(_Author(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,adminForceParody: null == adminForceParody ? _self.adminForceParody : adminForceParody // ignore: cast_nullable_to_non_nullable
as bool,adminForceBot: null == adminForceBot ? _self.adminForceBot : adminForceBot // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self._officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<OfficialMark>,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,hideProfileFromMinors: null == hideProfileFromMinors ? _self.hideProfileFromMinors : hideProfileFromMinors // ignore: cast_nullable_to_non_nullable
as bool,profileMinimumAge: freezed == profileMinimumAge ? _self.profileMinimumAge : profileMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,profileMaximumAge: freezed == profileMaximumAge ? _self.profileMaximumAge : profileMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,mutualFollowersCount: null == mutualFollowersCount ? _self.mutualFollowersCount : mutualFollowersCount // ignore: cast_nullable_to_non_nullable
as int,isFollowingByViewer: null == isFollowingByViewer ? _self.isFollowingByViewer : isFollowingByViewer // ignore: cast_nullable_to_non_nullable
as bool,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,isFollowedBy: null == isFollowedBy ? _self.isFollowedBy : isFollowedBy // ignore: cast_nullable_to_non_nullable
as bool,followRequestSent: null == followRequestSent ? _self.followRequestSent : followRequestSent // ignore: cast_nullable_to_non_nullable
as bool,cardAccentColor: freezed == cardAccentColor ? _self.cardAccentColor : cardAccentColor // ignore: cast_nullable_to_non_nullable
as String?,profileAccentColor: freezed == profileAccentColor ? _self.profileAccentColor : profileAccentColor // ignore: cast_nullable_to_non_nullable
as String?,premiumBadgeColor: null == premiumBadgeColor ? _self.premiumBadgeColor : premiumBadgeColor // ignore: cast_nullable_to_non_nullable
as String,subscriptionBadgeColors: null == subscriptionBadgeColors ? _self._subscriptionBadgeColors : subscriptionBadgeColors // ignore: cast_nullable_to_non_nullable
as List<String>,subscriptionPlan: null == subscriptionPlan ? _self.subscriptionPlan : subscriptionPlan // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionActiveUntil: freezed == subscriptionActiveUntil ? _self.subscriptionActiveUntil : subscriptionActiveUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,showCardDecoration: null == showCardDecoration ? _self.showCardDecoration : showCardDecoration // ignore: cast_nullable_to_non_nullable
as bool,showProfileDecoration: null == showProfileDecoration ? _self.showProfileDecoration : showProfileDecoration // ignore: cast_nullable_to_non_nullable
as bool,showSubscriptionBadges: null == showSubscriptionBadges ? _self.showSubscriptionBadges : showSubscriptionBadges // ignore: cast_nullable_to_non_nullable
as bool,showGreenBadge: null == showGreenBadge ? _self.showGreenBadge : showGreenBadge // ignore: cast_nullable_to_non_nullable
as bool,showPlusBadge: null == showPlusBadge ? _self.showPlusBadge : showPlusBadge // ignore: cast_nullable_to_non_nullable
as bool,showProBadge: null == showProBadge ? _self.showProBadge : showProBadge // ignore: cast_nullable_to_non_nullable
as bool,showRedBadge: null == showRedBadge ? _self.showRedBadge : showRedBadge // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$User {

 int? get avatarFrameId; String? get avatarUrl; String get displayName; int get id; bool get isPrivate; bool get isBotAccount; bool get isParodyAccount; bool get adminForceParody; bool get adminForceBot;@OfficialMarkListConverter() List<OfficialMark> get officialMark; String get username; int? get pinnedPostId; String? get headerUrl; String? get bio; String? get birthday;@JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN) BirthdayVisibility get birthdayVisibility; bool get birthdayBalloonsEnabled; bool get hideProfileFromMinors; String? get websiteUrl; String? get location;@JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN) OnlineStatus get onlineStatus; int get followersCount; int get followingCount; int get postsCount; bool get isPremium; DateTime get createdAt; List<String> get userBadges; int? get age; List<String> get badges; bool get isBanned; String? get statusMessage;/// 生年月日の表示用文字列。`birthdayVisibility` を適用済み。
 String? get displayBirthday;/// オンライン状態を誰に見せるか。`PUBLIC` / `FOLLOWERS` / `PRIVATE` など。
 String get onlineStatusVisibility; int? get profileMinimumAge; int? get profileMaximumAge;/// ピン留め。複数対応になったため `pinnedPostId` は残っているだけ。
 List<int> get pinnedPostIds; int get pinnedPostLimit;/// 質問箱を開けているか。
 bool get questionsEnabled;/// いいね欄を公開しているか。
 bool get showLikedPosts;/// DM の既読を相手に見せるか。
 bool get showReadReceipts; bool get levelEnabled; int get level; int get levelProgress; int get experience; int get experienceInLevel; int get experienceToNextLevel; int get experienceRequiredForNextLevel; String? get cardAccentColor; String? get profileAccentColor; String get premiumBadgeColor; List<String> get subscriptionBadgeColors; String get subscriptionPlan; String get subscriptionStatus; DateTime? get subscriptionActiveUntil; bool get subscriptionCancelAtPeriodEnd; bool get showCardDecoration; bool get showProfileDecoration; bool get showSubscriptionBadges; bool get showGreenBadge; bool get showPlusBadge; bool get showProBadge; bool get showRedBadge;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&(identical(other.adminForceParody, adminForceParody) || other.adminForceParody == adminForceParody)&&(identical(other.adminForceBot, adminForceBot) || other.adminForceBot == adminForceBot)&&const DeepCollectionEquality().equals(other.officialMark, officialMark)&&(identical(other.username, username) || other.username == username)&&(identical(other.pinnedPostId, pinnedPostId) || other.pinnedPostId == pinnedPostId)&&(identical(other.headerUrl, headerUrl) || other.headerUrl == headerUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.birthdayVisibility, birthdayVisibility) || other.birthdayVisibility == birthdayVisibility)&&(identical(other.birthdayBalloonsEnabled, birthdayBalloonsEnabled) || other.birthdayBalloonsEnabled == birthdayBalloonsEnabled)&&(identical(other.hideProfileFromMinors, hideProfileFromMinors) || other.hideProfileFromMinors == hideProfileFromMinors)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.onlineStatus, onlineStatus) || other.onlineStatus == onlineStatus)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.postsCount, postsCount) || other.postsCount == postsCount)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.userBadges, userBadges)&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other.badges, badges)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.displayBirthday, displayBirthday) || other.displayBirthday == displayBirthday)&&(identical(other.onlineStatusVisibility, onlineStatusVisibility) || other.onlineStatusVisibility == onlineStatusVisibility)&&(identical(other.profileMinimumAge, profileMinimumAge) || other.profileMinimumAge == profileMinimumAge)&&(identical(other.profileMaximumAge, profileMaximumAge) || other.profileMaximumAge == profileMaximumAge)&&const DeepCollectionEquality().equals(other.pinnedPostIds, pinnedPostIds)&&(identical(other.pinnedPostLimit, pinnedPostLimit) || other.pinnedPostLimit == pinnedPostLimit)&&(identical(other.questionsEnabled, questionsEnabled) || other.questionsEnabled == questionsEnabled)&&(identical(other.showLikedPosts, showLikedPosts) || other.showLikedPosts == showLikedPosts)&&(identical(other.showReadReceipts, showReadReceipts) || other.showReadReceipts == showReadReceipts)&&(identical(other.levelEnabled, levelEnabled) || other.levelEnabled == levelEnabled)&&(identical(other.level, level) || other.level == level)&&(identical(other.levelProgress, levelProgress) || other.levelProgress == levelProgress)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.experienceInLevel, experienceInLevel) || other.experienceInLevel == experienceInLevel)&&(identical(other.experienceToNextLevel, experienceToNextLevel) || other.experienceToNextLevel == experienceToNextLevel)&&(identical(other.experienceRequiredForNextLevel, experienceRequiredForNextLevel) || other.experienceRequiredForNextLevel == experienceRequiredForNextLevel)&&(identical(other.cardAccentColor, cardAccentColor) || other.cardAccentColor == cardAccentColor)&&(identical(other.profileAccentColor, profileAccentColor) || other.profileAccentColor == profileAccentColor)&&(identical(other.premiumBadgeColor, premiumBadgeColor) || other.premiumBadgeColor == premiumBadgeColor)&&const DeepCollectionEquality().equals(other.subscriptionBadgeColors, subscriptionBadgeColors)&&(identical(other.subscriptionPlan, subscriptionPlan) || other.subscriptionPlan == subscriptionPlan)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.subscriptionActiveUntil, subscriptionActiveUntil) || other.subscriptionActiveUntil == subscriptionActiveUntil)&&(identical(other.subscriptionCancelAtPeriodEnd, subscriptionCancelAtPeriodEnd) || other.subscriptionCancelAtPeriodEnd == subscriptionCancelAtPeriodEnd)&&(identical(other.showCardDecoration, showCardDecoration) || other.showCardDecoration == showCardDecoration)&&(identical(other.showProfileDecoration, showProfileDecoration) || other.showProfileDecoration == showProfileDecoration)&&(identical(other.showSubscriptionBadges, showSubscriptionBadges) || other.showSubscriptionBadges == showSubscriptionBadges)&&(identical(other.showGreenBadge, showGreenBadge) || other.showGreenBadge == showGreenBadge)&&(identical(other.showPlusBadge, showPlusBadge) || other.showPlusBadge == showPlusBadge)&&(identical(other.showProBadge, showProBadge) || other.showProBadge == showProBadge)&&(identical(other.showRedBadge, showRedBadge) || other.showRedBadge == showRedBadge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,isBotAccount,isParodyAccount,adminForceParody,adminForceBot,const DeepCollectionEquality().hash(officialMark),username,pinnedPostId,headerUrl,bio,birthday,birthdayVisibility,birthdayBalloonsEnabled,hideProfileFromMinors,websiteUrl,location,onlineStatus,followersCount,followingCount,postsCount,isPremium,createdAt,const DeepCollectionEquality().hash(userBadges),age,const DeepCollectionEquality().hash(badges),isBanned,statusMessage,displayBirthday,onlineStatusVisibility,profileMinimumAge,profileMaximumAge,const DeepCollectionEquality().hash(pinnedPostIds),pinnedPostLimit,questionsEnabled,showLikedPosts,showReadReceipts,levelEnabled,level,levelProgress,experience,experienceInLevel,experienceToNextLevel,experienceRequiredForNextLevel,cardAccentColor,profileAccentColor,premiumBadgeColor,const DeepCollectionEquality().hash(subscriptionBadgeColors),subscriptionPlan,subscriptionStatus,subscriptionActiveUntil,subscriptionCancelAtPeriodEnd,showCardDecoration,showProfileDecoration,showSubscriptionBadges,showGreenBadge,showPlusBadge,showProBadge,showRedBadge]);

@override
String toString() {
  return 'User(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, adminForceParody: $adminForceParody, adminForceBot: $adminForceBot, officialMark: $officialMark, username: $username, pinnedPostId: $pinnedPostId, headerUrl: $headerUrl, bio: $bio, birthday: $birthday, birthdayVisibility: $birthdayVisibility, birthdayBalloonsEnabled: $birthdayBalloonsEnabled, hideProfileFromMinors: $hideProfileFromMinors, websiteUrl: $websiteUrl, location: $location, onlineStatus: $onlineStatus, followersCount: $followersCount, followingCount: $followingCount, postsCount: $postsCount, isPremium: $isPremium, createdAt: $createdAt, userBadges: $userBadges, age: $age, badges: $badges, isBanned: $isBanned, statusMessage: $statusMessage, displayBirthday: $displayBirthday, onlineStatusVisibility: $onlineStatusVisibility, profileMinimumAge: $profileMinimumAge, profileMaximumAge: $profileMaximumAge, pinnedPostIds: $pinnedPostIds, pinnedPostLimit: $pinnedPostLimit, questionsEnabled: $questionsEnabled, showLikedPosts: $showLikedPosts, showReadReceipts: $showReadReceipts, levelEnabled: $levelEnabled, level: $level, levelProgress: $levelProgress, experience: $experience, experienceInLevel: $experienceInLevel, experienceToNextLevel: $experienceToNextLevel, experienceRequiredForNextLevel: $experienceRequiredForNextLevel, cardAccentColor: $cardAccentColor, profileAccentColor: $profileAccentColor, premiumBadgeColor: $premiumBadgeColor, subscriptionBadgeColors: $subscriptionBadgeColors, subscriptionPlan: $subscriptionPlan, subscriptionStatus: $subscriptionStatus, subscriptionActiveUntil: $subscriptionActiveUntil, subscriptionCancelAtPeriodEnd: $subscriptionCancelAtPeriodEnd, showCardDecoration: $showCardDecoration, showProfileDecoration: $showProfileDecoration, showSubscriptionBadges: $showSubscriptionBadges, showGreenBadge: $showGreenBadge, showPlusBadge: $showPlusBadge, showProBadge: $showProBadge, showRedBadge: $showRedBadge)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, bool isBotAccount, bool isParodyAccount, bool adminForceParody, bool adminForceBot,@OfficialMarkListConverter() List<OfficialMark> officialMark, String username, int? pinnedPostId, String? headerUrl, String? bio, String? birthday,@JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN) BirthdayVisibility birthdayVisibility, bool birthdayBalloonsEnabled, bool hideProfileFromMinors, String? websiteUrl, String? location,@JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN) OnlineStatus onlineStatus, int followersCount, int followingCount, int postsCount, bool isPremium, DateTime createdAt, List<String> userBadges, int? age, List<String> badges, bool isBanned, String? statusMessage, String? displayBirthday, String onlineStatusVisibility, int? profileMinimumAge, int? profileMaximumAge, List<int> pinnedPostIds, int pinnedPostLimit, bool questionsEnabled, bool showLikedPosts, bool showReadReceipts, bool levelEnabled, int level, int levelProgress, int experience, int experienceInLevel, int experienceToNextLevel, int experienceRequiredForNextLevel, String? cardAccentColor, String? profileAccentColor, String premiumBadgeColor, List<String> subscriptionBadgeColors, String subscriptionPlan, String subscriptionStatus, DateTime? subscriptionActiveUntil, bool subscriptionCancelAtPeriodEnd, bool showCardDecoration, bool showProfileDecoration, bool showSubscriptionBadges, bool showGreenBadge, bool showPlusBadge, bool showProBadge, bool showRedBadge
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
@pragma('vm:prefer-inline') @override $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? adminForceParody = null,Object? adminForceBot = null,Object? officialMark = null,Object? username = null,Object? pinnedPostId = freezed,Object? headerUrl = freezed,Object? bio = freezed,Object? birthday = freezed,Object? birthdayVisibility = null,Object? birthdayBalloonsEnabled = null,Object? hideProfileFromMinors = null,Object? websiteUrl = freezed,Object? location = freezed,Object? onlineStatus = null,Object? followersCount = null,Object? followingCount = null,Object? postsCount = null,Object? isPremium = null,Object? createdAt = null,Object? userBadges = null,Object? age = freezed,Object? badges = null,Object? isBanned = null,Object? statusMessage = freezed,Object? displayBirthday = freezed,Object? onlineStatusVisibility = null,Object? profileMinimumAge = freezed,Object? profileMaximumAge = freezed,Object? pinnedPostIds = null,Object? pinnedPostLimit = null,Object? questionsEnabled = null,Object? showLikedPosts = null,Object? showReadReceipts = null,Object? levelEnabled = null,Object? level = null,Object? levelProgress = null,Object? experience = null,Object? experienceInLevel = null,Object? experienceToNextLevel = null,Object? experienceRequiredForNextLevel = null,Object? cardAccentColor = freezed,Object? profileAccentColor = freezed,Object? premiumBadgeColor = null,Object? subscriptionBadgeColors = null,Object? subscriptionPlan = null,Object? subscriptionStatus = null,Object? subscriptionActiveUntil = freezed,Object? subscriptionCancelAtPeriodEnd = null,Object? showCardDecoration = null,Object? showProfileDecoration = null,Object? showSubscriptionBadges = null,Object? showGreenBadge = null,Object? showPlusBadge = null,Object? showProBadge = null,Object? showRedBadge = null,}) {
  return _then(User(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,adminForceParody: null == adminForceParody ? _self.adminForceParody : adminForceParody // ignore: cast_nullable_to_non_nullable
as bool,adminForceBot: null == adminForceBot ? _self.adminForceBot : adminForceBot // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self.officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<OfficialMark>,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,pinnedPostId: freezed == pinnedPostId ? _self.pinnedPostId : pinnedPostId // ignore: cast_nullable_to_non_nullable
as int?,headerUrl: freezed == headerUrl ? _self.headerUrl : headerUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
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
as List<String>,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,displayBirthday: freezed == displayBirthday ? _self.displayBirthday : displayBirthday // ignore: cast_nullable_to_non_nullable
as String?,onlineStatusVisibility: null == onlineStatusVisibility ? _self.onlineStatusVisibility : onlineStatusVisibility // ignore: cast_nullable_to_non_nullable
as String,profileMinimumAge: freezed == profileMinimumAge ? _self.profileMinimumAge : profileMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,profileMaximumAge: freezed == profileMaximumAge ? _self.profileMaximumAge : profileMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,pinnedPostIds: null == pinnedPostIds ? _self.pinnedPostIds : pinnedPostIds // ignore: cast_nullable_to_non_nullable
as List<int>,pinnedPostLimit: null == pinnedPostLimit ? _self.pinnedPostLimit : pinnedPostLimit // ignore: cast_nullable_to_non_nullable
as int,questionsEnabled: null == questionsEnabled ? _self.questionsEnabled : questionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,showLikedPosts: null == showLikedPosts ? _self.showLikedPosts : showLikedPosts // ignore: cast_nullable_to_non_nullable
as bool,showReadReceipts: null == showReadReceipts ? _self.showReadReceipts : showReadReceipts // ignore: cast_nullable_to_non_nullable
as bool,levelEnabled: null == levelEnabled ? _self.levelEnabled : levelEnabled // ignore: cast_nullable_to_non_nullable
as bool,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,levelProgress: null == levelProgress ? _self.levelProgress : levelProgress // ignore: cast_nullable_to_non_nullable
as int,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int,experienceInLevel: null == experienceInLevel ? _self.experienceInLevel : experienceInLevel // ignore: cast_nullable_to_non_nullable
as int,experienceToNextLevel: null == experienceToNextLevel ? _self.experienceToNextLevel : experienceToNextLevel // ignore: cast_nullable_to_non_nullable
as int,experienceRequiredForNextLevel: null == experienceRequiredForNextLevel ? _self.experienceRequiredForNextLevel : experienceRequiredForNextLevel // ignore: cast_nullable_to_non_nullable
as int,cardAccentColor: freezed == cardAccentColor ? _self.cardAccentColor : cardAccentColor // ignore: cast_nullable_to_non_nullable
as String?,profileAccentColor: freezed == profileAccentColor ? _self.profileAccentColor : profileAccentColor // ignore: cast_nullable_to_non_nullable
as String?,premiumBadgeColor: null == premiumBadgeColor ? _self.premiumBadgeColor : premiumBadgeColor // ignore: cast_nullable_to_non_nullable
as String,subscriptionBadgeColors: null == subscriptionBadgeColors ? _self.subscriptionBadgeColors : subscriptionBadgeColors // ignore: cast_nullable_to_non_nullable
as List<String>,subscriptionPlan: null == subscriptionPlan ? _self.subscriptionPlan : subscriptionPlan // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionActiveUntil: freezed == subscriptionActiveUntil ? _self.subscriptionActiveUntil : subscriptionActiveUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,subscriptionCancelAtPeriodEnd: null == subscriptionCancelAtPeriodEnd ? _self.subscriptionCancelAtPeriodEnd : subscriptionCancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool,showCardDecoration: null == showCardDecoration ? _self.showCardDecoration : showCardDecoration // ignore: cast_nullable_to_non_nullable
as bool,showProfileDecoration: null == showProfileDecoration ? _self.showProfileDecoration : showProfileDecoration // ignore: cast_nullable_to_non_nullable
as bool,showSubscriptionBadges: null == showSubscriptionBadges ? _self.showSubscriptionBadges : showSubscriptionBadges // ignore: cast_nullable_to_non_nullable
as bool,showGreenBadge: null == showGreenBadge ? _self.showGreenBadge : showGreenBadge // ignore: cast_nullable_to_non_nullable
as bool,showPlusBadge: null == showPlusBadge ? _self.showPlusBadge : showPlusBadge // ignore: cast_nullable_to_non_nullable
as bool,showProBadge: null == showProBadge ? _self.showProBadge : showProBadge // ignore: cast_nullable_to_non_nullable
as bool,showRedBadge: null == showRedBadge ? _self.showRedBadge : showRedBadge // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  String username,  int? pinnedPostId,  String? headerUrl,  String? bio,  String? birthday, @JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN)  BirthdayVisibility birthdayVisibility,  bool birthdayBalloonsEnabled,  bool hideProfileFromMinors,  String? websiteUrl,  String? location, @JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN)  OnlineStatus onlineStatus,  int followersCount,  int followingCount,  int postsCount,  bool isPremium,  DateTime createdAt,  List<String> userBadges,  int? age,  List<String> badges,  bool isBanned,  String? statusMessage,  String? displayBirthday,  String onlineStatusVisibility,  int? profileMinimumAge,  int? profileMaximumAge,  List<int> pinnedPostIds,  int pinnedPostLimit,  bool questionsEnabled,  bool showLikedPosts,  bool showReadReceipts,  bool levelEnabled,  int level,  int levelProgress,  int experience,  int experienceInLevel,  int experienceToNextLevel,  int experienceRequiredForNextLevel,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool subscriptionCancelAtPeriodEnd,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.officialMark,_that.username,_that.pinnedPostId,_that.headerUrl,_that.bio,_that.birthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.hideProfileFromMinors,_that.websiteUrl,_that.location,_that.onlineStatus,_that.followersCount,_that.followingCount,_that.postsCount,_that.isPremium,_that.createdAt,_that.userBadges,_that.age,_that.badges,_that.isBanned,_that.statusMessage,_that.displayBirthday,_that.onlineStatusVisibility,_that.profileMinimumAge,_that.profileMaximumAge,_that.pinnedPostIds,_that.pinnedPostLimit,_that.questionsEnabled,_that.showLikedPosts,_that.showReadReceipts,_that.levelEnabled,_that.level,_that.levelProgress,_that.experience,_that.experienceInLevel,_that.experienceToNextLevel,_that.experienceRequiredForNextLevel,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.subscriptionCancelAtPeriodEnd,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  String username,  int? pinnedPostId,  String? headerUrl,  String? bio,  String? birthday, @JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN)  BirthdayVisibility birthdayVisibility,  bool birthdayBalloonsEnabled,  bool hideProfileFromMinors,  String? websiteUrl,  String? location, @JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN)  OnlineStatus onlineStatus,  int followersCount,  int followingCount,  int postsCount,  bool isPremium,  DateTime createdAt,  List<String> userBadges,  int? age,  List<String> badges,  bool isBanned,  String? statusMessage,  String? displayBirthday,  String onlineStatusVisibility,  int? profileMinimumAge,  int? profileMaximumAge,  List<int> pinnedPostIds,  int pinnedPostLimit,  bool questionsEnabled,  bool showLikedPosts,  bool showReadReceipts,  bool levelEnabled,  int level,  int levelProgress,  int experience,  int experienceInLevel,  int experienceToNextLevel,  int experienceRequiredForNextLevel,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool subscriptionCancelAtPeriodEnd,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.officialMark,_that.username,_that.pinnedPostId,_that.headerUrl,_that.bio,_that.birthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.hideProfileFromMinors,_that.websiteUrl,_that.location,_that.onlineStatus,_that.followersCount,_that.followingCount,_that.postsCount,_that.isPremium,_that.createdAt,_that.userBadges,_that.age,_that.badges,_that.isBanned,_that.statusMessage,_that.displayBirthday,_that.onlineStatusVisibility,_that.profileMinimumAge,_that.profileMaximumAge,_that.pinnedPostIds,_that.pinnedPostLimit,_that.questionsEnabled,_that.showLikedPosts,_that.showReadReceipts,_that.levelEnabled,_that.level,_that.levelProgress,_that.experience,_that.experienceInLevel,_that.experienceToNextLevel,_that.experienceRequiredForNextLevel,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.subscriptionCancelAtPeriodEnd,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? avatarFrameId,  String? avatarUrl,  String displayName,  int id,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  String username,  int? pinnedPostId,  String? headerUrl,  String? bio,  String? birthday, @JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN)  BirthdayVisibility birthdayVisibility,  bool birthdayBalloonsEnabled,  bool hideProfileFromMinors,  String? websiteUrl,  String? location, @JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN)  OnlineStatus onlineStatus,  int followersCount,  int followingCount,  int postsCount,  bool isPremium,  DateTime createdAt,  List<String> userBadges,  int? age,  List<String> badges,  bool isBanned,  String? statusMessage,  String? displayBirthday,  String onlineStatusVisibility,  int? profileMinimumAge,  int? profileMaximumAge,  List<int> pinnedPostIds,  int pinnedPostLimit,  bool questionsEnabled,  bool showLikedPosts,  bool showReadReceipts,  bool levelEnabled,  int level,  int levelProgress,  int experience,  int experienceInLevel,  int experienceToNextLevel,  int experienceRequiredForNextLevel,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool subscriptionCancelAtPeriodEnd,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.avatarFrameId,_that.avatarUrl,_that.displayName,_that.id,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.officialMark,_that.username,_that.pinnedPostId,_that.headerUrl,_that.bio,_that.birthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.hideProfileFromMinors,_that.websiteUrl,_that.location,_that.onlineStatus,_that.followersCount,_that.followingCount,_that.postsCount,_that.isPremium,_that.createdAt,_that.userBadges,_that.age,_that.badges,_that.isBanned,_that.statusMessage,_that.displayBirthday,_that.onlineStatusVisibility,_that.profileMinimumAge,_that.profileMaximumAge,_that.pinnedPostIds,_that.pinnedPostLimit,_that.questionsEnabled,_that.showLikedPosts,_that.showReadReceipts,_that.levelEnabled,_that.level,_that.levelProgress,_that.experience,_that.experienceInLevel,_that.experienceToNextLevel,_that.experienceRequiredForNextLevel,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.subscriptionCancelAtPeriodEnd,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({this.avatarFrameId, this.avatarUrl, required this.displayName, required this.id, required this.isPrivate, required this.isBotAccount, required this.isParodyAccount, this.adminForceParody = false, this.adminForceBot = false, @OfficialMarkListConverter()  List<OfficialMark> officialMark = const [], required this.username, this.pinnedPostId, this.headerUrl, this.bio, this.birthday, @JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN) required this.birthdayVisibility, required this.birthdayBalloonsEnabled, required this.hideProfileFromMinors, this.websiteUrl, this.location, @JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN) required this.onlineStatus, required this.followersCount, required this.followingCount, required this.postsCount, required this.isPremium, required this.createdAt, required  List<String> userBadges, this.age, required  List<String> badges, this.isBanned = false, this.statusMessage, this.displayBirthday, this.onlineStatusVisibility = '', this.profileMinimumAge, this.profileMaximumAge,  List<int> pinnedPostIds = const [], this.pinnedPostLimit = 0, this.questionsEnabled = false, this.showLikedPosts = false, this.showReadReceipts = false, this.levelEnabled = false, this.level = 0, this.levelProgress = 0, this.experience = 0, this.experienceInLevel = 0, this.experienceToNextLevel = 0, this.experienceRequiredForNextLevel = 0, this.cardAccentColor, this.profileAccentColor, this.premiumBadgeColor = '',  List<String> subscriptionBadgeColors = const [], this.subscriptionPlan = '', this.subscriptionStatus = '', this.subscriptionActiveUntil, this.subscriptionCancelAtPeriodEnd = false, this.showCardDecoration = false, this.showProfileDecoration = false, this.showSubscriptionBadges = false, this.showGreenBadge = false, this.showPlusBadge = false, this.showProBadge = false, this.showRedBadge = false}): _officialMark = officialMark,_userBadges = userBadges,_badges = badges,_pinnedPostIds = pinnedPostIds,_subscriptionBadgeColors = subscriptionBadgeColors;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int? avatarFrameId;
@override final  String? avatarUrl;
@override final  String displayName;
@override final  int id;
@override final  bool isPrivate;
@override final  bool isBotAccount;
@override final  bool isParodyAccount;
@override@JsonKey() final  bool adminForceParody;
@override@JsonKey() final  bool adminForceBot;
 final  List<OfficialMark> _officialMark;
@override@JsonKey()@OfficialMarkListConverter() List<OfficialMark> get officialMark {
  if (_officialMark is EqualUnmodifiableListView) return _officialMark;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_officialMark);
}

@override final  String username;
@override final  int? pinnedPostId;
@override final  String? headerUrl;
@override final  String? bio;
@override final  String? birthday;
@override@JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN) final  BirthdayVisibility birthdayVisibility;
@override final  bool birthdayBalloonsEnabled;
@override final  bool hideProfileFromMinors;
@override final  String? websiteUrl;
@override final  String? location;
@override@JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN) final  OnlineStatus onlineStatus;
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

@override@JsonKey() final  bool isBanned;
@override final  String? statusMessage;
/// 生年月日の表示用文字列。`birthdayVisibility` を適用済み。
@override final  String? displayBirthday;
/// オンライン状態を誰に見せるか。`PUBLIC` / `FOLLOWERS` / `PRIVATE` など。
@override@JsonKey() final  String onlineStatusVisibility;
@override final  int? profileMinimumAge;
@override final  int? profileMaximumAge;
/// ピン留め。複数対応になったため `pinnedPostId` は残っているだけ。
 final  List<int> _pinnedPostIds;
/// ピン留め。複数対応になったため `pinnedPostId` は残っているだけ。
@override@JsonKey() List<int> get pinnedPostIds {
  if (_pinnedPostIds is EqualUnmodifiableListView) return _pinnedPostIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pinnedPostIds);
}

@override@JsonKey() final  int pinnedPostLimit;
/// 質問箱を開けているか。
@override@JsonKey() final  bool questionsEnabled;
/// いいね欄を公開しているか。
@override@JsonKey() final  bool showLikedPosts;
/// DM の既読を相手に見せるか。
@override@JsonKey() final  bool showReadReceipts;
@override@JsonKey() final  bool levelEnabled;
@override@JsonKey() final  int level;
@override@JsonKey() final  int levelProgress;
@override@JsonKey() final  int experience;
@override@JsonKey() final  int experienceInLevel;
@override@JsonKey() final  int experienceToNextLevel;
@override@JsonKey() final  int experienceRequiredForNextLevel;
@override final  String? cardAccentColor;
@override final  String? profileAccentColor;
@override@JsonKey() final  String premiumBadgeColor;
 final  List<String> _subscriptionBadgeColors;
@override@JsonKey() List<String> get subscriptionBadgeColors {
  if (_subscriptionBadgeColors is EqualUnmodifiableListView) return _subscriptionBadgeColors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subscriptionBadgeColors);
}

@override@JsonKey() final  String subscriptionPlan;
@override@JsonKey() final  String subscriptionStatus;
@override final  DateTime? subscriptionActiveUntil;
@override@JsonKey() final  bool subscriptionCancelAtPeriodEnd;
@override@JsonKey() final  bool showCardDecoration;
@override@JsonKey() final  bool showProfileDecoration;
@override@JsonKey() final  bool showSubscriptionBadges;
@override@JsonKey() final  bool showGreenBadge;
@override@JsonKey() final  bool showPlusBadge;
@override@JsonKey() final  bool showProBadge;
@override@JsonKey() final  bool showRedBadge;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&(identical(other.adminForceParody, adminForceParody) || other.adminForceParody == adminForceParody)&&(identical(other.adminForceBot, adminForceBot) || other.adminForceBot == adminForceBot)&&const DeepCollectionEquality().equals(other._officialMark, _officialMark)&&(identical(other.username, username) || other.username == username)&&(identical(other.pinnedPostId, pinnedPostId) || other.pinnedPostId == pinnedPostId)&&(identical(other.headerUrl, headerUrl) || other.headerUrl == headerUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.birthdayVisibility, birthdayVisibility) || other.birthdayVisibility == birthdayVisibility)&&(identical(other.birthdayBalloonsEnabled, birthdayBalloonsEnabled) || other.birthdayBalloonsEnabled == birthdayBalloonsEnabled)&&(identical(other.hideProfileFromMinors, hideProfileFromMinors) || other.hideProfileFromMinors == hideProfileFromMinors)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.onlineStatus, onlineStatus) || other.onlineStatus == onlineStatus)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.postsCount, postsCount) || other.postsCount == postsCount)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._userBadges, _userBadges)&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other._badges, _badges)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.displayBirthday, displayBirthday) || other.displayBirthday == displayBirthday)&&(identical(other.onlineStatusVisibility, onlineStatusVisibility) || other.onlineStatusVisibility == onlineStatusVisibility)&&(identical(other.profileMinimumAge, profileMinimumAge) || other.profileMinimumAge == profileMinimumAge)&&(identical(other.profileMaximumAge, profileMaximumAge) || other.profileMaximumAge == profileMaximumAge)&&const DeepCollectionEquality().equals(other._pinnedPostIds, _pinnedPostIds)&&(identical(other.pinnedPostLimit, pinnedPostLimit) || other.pinnedPostLimit == pinnedPostLimit)&&(identical(other.questionsEnabled, questionsEnabled) || other.questionsEnabled == questionsEnabled)&&(identical(other.showLikedPosts, showLikedPosts) || other.showLikedPosts == showLikedPosts)&&(identical(other.showReadReceipts, showReadReceipts) || other.showReadReceipts == showReadReceipts)&&(identical(other.levelEnabled, levelEnabled) || other.levelEnabled == levelEnabled)&&(identical(other.level, level) || other.level == level)&&(identical(other.levelProgress, levelProgress) || other.levelProgress == levelProgress)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.experienceInLevel, experienceInLevel) || other.experienceInLevel == experienceInLevel)&&(identical(other.experienceToNextLevel, experienceToNextLevel) || other.experienceToNextLevel == experienceToNextLevel)&&(identical(other.experienceRequiredForNextLevel, experienceRequiredForNextLevel) || other.experienceRequiredForNextLevel == experienceRequiredForNextLevel)&&(identical(other.cardAccentColor, cardAccentColor) || other.cardAccentColor == cardAccentColor)&&(identical(other.profileAccentColor, profileAccentColor) || other.profileAccentColor == profileAccentColor)&&(identical(other.premiumBadgeColor, premiumBadgeColor) || other.premiumBadgeColor == premiumBadgeColor)&&const DeepCollectionEquality().equals(other._subscriptionBadgeColors, _subscriptionBadgeColors)&&(identical(other.subscriptionPlan, subscriptionPlan) || other.subscriptionPlan == subscriptionPlan)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.subscriptionActiveUntil, subscriptionActiveUntil) || other.subscriptionActiveUntil == subscriptionActiveUntil)&&(identical(other.subscriptionCancelAtPeriodEnd, subscriptionCancelAtPeriodEnd) || other.subscriptionCancelAtPeriodEnd == subscriptionCancelAtPeriodEnd)&&(identical(other.showCardDecoration, showCardDecoration) || other.showCardDecoration == showCardDecoration)&&(identical(other.showProfileDecoration, showProfileDecoration) || other.showProfileDecoration == showProfileDecoration)&&(identical(other.showSubscriptionBadges, showSubscriptionBadges) || other.showSubscriptionBadges == showSubscriptionBadges)&&(identical(other.showGreenBadge, showGreenBadge) || other.showGreenBadge == showGreenBadge)&&(identical(other.showPlusBadge, showPlusBadge) || other.showPlusBadge == showPlusBadge)&&(identical(other.showProBadge, showProBadge) || other.showProBadge == showProBadge)&&(identical(other.showRedBadge, showRedBadge) || other.showRedBadge == showRedBadge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,avatarFrameId,avatarUrl,displayName,id,isPrivate,isBotAccount,isParodyAccount,adminForceParody,adminForceBot,const DeepCollectionEquality().hash(_officialMark),username,pinnedPostId,headerUrl,bio,birthday,birthdayVisibility,birthdayBalloonsEnabled,hideProfileFromMinors,websiteUrl,location,onlineStatus,followersCount,followingCount,postsCount,isPremium,createdAt,const DeepCollectionEquality().hash(_userBadges),age,const DeepCollectionEquality().hash(_badges),isBanned,statusMessage,displayBirthday,onlineStatusVisibility,profileMinimumAge,profileMaximumAge,const DeepCollectionEquality().hash(_pinnedPostIds),pinnedPostLimit,questionsEnabled,showLikedPosts,showReadReceipts,levelEnabled,level,levelProgress,experience,experienceInLevel,experienceToNextLevel,experienceRequiredForNextLevel,cardAccentColor,profileAccentColor,premiumBadgeColor,const DeepCollectionEquality().hash(_subscriptionBadgeColors),subscriptionPlan,subscriptionStatus,subscriptionActiveUntil,subscriptionCancelAtPeriodEnd,showCardDecoration,showProfileDecoration,showSubscriptionBadges,showGreenBadge,showPlusBadge,showProBadge,showRedBadge]);

@override
String toString() {
  return 'User(avatarFrameId: $avatarFrameId, avatarUrl: $avatarUrl, displayName: $displayName, id: $id, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, adminForceParody: $adminForceParody, adminForceBot: $adminForceBot, officialMark: $officialMark, username: $username, pinnedPostId: $pinnedPostId, headerUrl: $headerUrl, bio: $bio, birthday: $birthday, birthdayVisibility: $birthdayVisibility, birthdayBalloonsEnabled: $birthdayBalloonsEnabled, hideProfileFromMinors: $hideProfileFromMinors, websiteUrl: $websiteUrl, location: $location, onlineStatus: $onlineStatus, followersCount: $followersCount, followingCount: $followingCount, postsCount: $postsCount, isPremium: $isPremium, createdAt: $createdAt, userBadges: $userBadges, age: $age, badges: $badges, isBanned: $isBanned, statusMessage: $statusMessage, displayBirthday: $displayBirthday, onlineStatusVisibility: $onlineStatusVisibility, profileMinimumAge: $profileMinimumAge, profileMaximumAge: $profileMaximumAge, pinnedPostIds: $pinnedPostIds, pinnedPostLimit: $pinnedPostLimit, questionsEnabled: $questionsEnabled, showLikedPosts: $showLikedPosts, showReadReceipts: $showReadReceipts, levelEnabled: $levelEnabled, level: $level, levelProgress: $levelProgress, experience: $experience, experienceInLevel: $experienceInLevel, experienceToNextLevel: $experienceToNextLevel, experienceRequiredForNextLevel: $experienceRequiredForNextLevel, cardAccentColor: $cardAccentColor, profileAccentColor: $profileAccentColor, premiumBadgeColor: $premiumBadgeColor, subscriptionBadgeColors: $subscriptionBadgeColors, subscriptionPlan: $subscriptionPlan, subscriptionStatus: $subscriptionStatus, subscriptionActiveUntil: $subscriptionActiveUntil, subscriptionCancelAtPeriodEnd: $subscriptionCancelAtPeriodEnd, showCardDecoration: $showCardDecoration, showProfileDecoration: $showProfileDecoration, showSubscriptionBadges: $showSubscriptionBadges, showGreenBadge: $showGreenBadge, showPlusBadge: $showPlusBadge, showProBadge: $showProBadge, showRedBadge: $showRedBadge)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int? avatarFrameId, String? avatarUrl, String displayName, int id, bool isPrivate, bool isBotAccount, bool isParodyAccount, bool adminForceParody, bool adminForceBot,@OfficialMarkListConverter() List<OfficialMark> officialMark, String username, int? pinnedPostId, String? headerUrl, String? bio, String? birthday,@JsonKey(unknownEnumValue: BirthdayVisibility.UNKNOWN) BirthdayVisibility birthdayVisibility, bool birthdayBalloonsEnabled, bool hideProfileFromMinors, String? websiteUrl, String? location,@JsonKey(unknownEnumValue: OnlineStatus.UNKNOWN) OnlineStatus onlineStatus, int followersCount, int followingCount, int postsCount, bool isPremium, DateTime createdAt, List<String> userBadges, int? age, List<String> badges, bool isBanned, String? statusMessage, String? displayBirthday, String onlineStatusVisibility, int? profileMinimumAge, int? profileMaximumAge, List<int> pinnedPostIds, int pinnedPostLimit, bool questionsEnabled, bool showLikedPosts, bool showReadReceipts, bool levelEnabled, int level, int levelProgress, int experience, int experienceInLevel, int experienceToNextLevel, int experienceRequiredForNextLevel, String? cardAccentColor, String? profileAccentColor, String premiumBadgeColor, List<String> subscriptionBadgeColors, String subscriptionPlan, String subscriptionStatus, DateTime? subscriptionActiveUntil, bool subscriptionCancelAtPeriodEnd, bool showCardDecoration, bool showProfileDecoration, bool showSubscriptionBadges, bool showGreenBadge, bool showPlusBadge, bool showProBadge, bool showRedBadge
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
@override @pragma('vm:prefer-inline') $Res call({Object? avatarFrameId = freezed,Object? avatarUrl = freezed,Object? displayName = null,Object? id = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? adminForceParody = null,Object? adminForceBot = null,Object? officialMark = null,Object? username = null,Object? pinnedPostId = freezed,Object? headerUrl = freezed,Object? bio = freezed,Object? birthday = freezed,Object? birthdayVisibility = null,Object? birthdayBalloonsEnabled = null,Object? hideProfileFromMinors = null,Object? websiteUrl = freezed,Object? location = freezed,Object? onlineStatus = null,Object? followersCount = null,Object? followingCount = null,Object? postsCount = null,Object? isPremium = null,Object? createdAt = null,Object? userBadges = null,Object? age = freezed,Object? badges = null,Object? isBanned = null,Object? statusMessage = freezed,Object? displayBirthday = freezed,Object? onlineStatusVisibility = null,Object? profileMinimumAge = freezed,Object? profileMaximumAge = freezed,Object? pinnedPostIds = null,Object? pinnedPostLimit = null,Object? questionsEnabled = null,Object? showLikedPosts = null,Object? showReadReceipts = null,Object? levelEnabled = null,Object? level = null,Object? levelProgress = null,Object? experience = null,Object? experienceInLevel = null,Object? experienceToNextLevel = null,Object? experienceRequiredForNextLevel = null,Object? cardAccentColor = freezed,Object? profileAccentColor = freezed,Object? premiumBadgeColor = null,Object? subscriptionBadgeColors = null,Object? subscriptionPlan = null,Object? subscriptionStatus = null,Object? subscriptionActiveUntil = freezed,Object? subscriptionCancelAtPeriodEnd = null,Object? showCardDecoration = null,Object? showProfileDecoration = null,Object? showSubscriptionBadges = null,Object? showGreenBadge = null,Object? showPlusBadge = null,Object? showProBadge = null,Object? showRedBadge = null,}) {
  return _then(_User(
avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,adminForceParody: null == adminForceParody ? _self.adminForceParody : adminForceParody // ignore: cast_nullable_to_non_nullable
as bool,adminForceBot: null == adminForceBot ? _self.adminForceBot : adminForceBot // ignore: cast_nullable_to_non_nullable
as bool,officialMark: null == officialMark ? _self._officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<OfficialMark>,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,pinnedPostId: freezed == pinnedPostId ? _self.pinnedPostId : pinnedPostId // ignore: cast_nullable_to_non_nullable
as int?,headerUrl: freezed == headerUrl ? _self.headerUrl : headerUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
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
as List<String>,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,displayBirthday: freezed == displayBirthday ? _self.displayBirthday : displayBirthday // ignore: cast_nullable_to_non_nullable
as String?,onlineStatusVisibility: null == onlineStatusVisibility ? _self.onlineStatusVisibility : onlineStatusVisibility // ignore: cast_nullable_to_non_nullable
as String,profileMinimumAge: freezed == profileMinimumAge ? _self.profileMinimumAge : profileMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,profileMaximumAge: freezed == profileMaximumAge ? _self.profileMaximumAge : profileMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,pinnedPostIds: null == pinnedPostIds ? _self._pinnedPostIds : pinnedPostIds // ignore: cast_nullable_to_non_nullable
as List<int>,pinnedPostLimit: null == pinnedPostLimit ? _self.pinnedPostLimit : pinnedPostLimit // ignore: cast_nullable_to_non_nullable
as int,questionsEnabled: null == questionsEnabled ? _self.questionsEnabled : questionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,showLikedPosts: null == showLikedPosts ? _self.showLikedPosts : showLikedPosts // ignore: cast_nullable_to_non_nullable
as bool,showReadReceipts: null == showReadReceipts ? _self.showReadReceipts : showReadReceipts // ignore: cast_nullable_to_non_nullable
as bool,levelEnabled: null == levelEnabled ? _self.levelEnabled : levelEnabled // ignore: cast_nullable_to_non_nullable
as bool,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,levelProgress: null == levelProgress ? _self.levelProgress : levelProgress // ignore: cast_nullable_to_non_nullable
as int,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int,experienceInLevel: null == experienceInLevel ? _self.experienceInLevel : experienceInLevel // ignore: cast_nullable_to_non_nullable
as int,experienceToNextLevel: null == experienceToNextLevel ? _self.experienceToNextLevel : experienceToNextLevel // ignore: cast_nullable_to_non_nullable
as int,experienceRequiredForNextLevel: null == experienceRequiredForNextLevel ? _self.experienceRequiredForNextLevel : experienceRequiredForNextLevel // ignore: cast_nullable_to_non_nullable
as int,cardAccentColor: freezed == cardAccentColor ? _self.cardAccentColor : cardAccentColor // ignore: cast_nullable_to_non_nullable
as String?,profileAccentColor: freezed == profileAccentColor ? _self.profileAccentColor : profileAccentColor // ignore: cast_nullable_to_non_nullable
as String?,premiumBadgeColor: null == premiumBadgeColor ? _self.premiumBadgeColor : premiumBadgeColor // ignore: cast_nullable_to_non_nullable
as String,subscriptionBadgeColors: null == subscriptionBadgeColors ? _self._subscriptionBadgeColors : subscriptionBadgeColors // ignore: cast_nullable_to_non_nullable
as List<String>,subscriptionPlan: null == subscriptionPlan ? _self.subscriptionPlan : subscriptionPlan // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionActiveUntil: freezed == subscriptionActiveUntil ? _self.subscriptionActiveUntil : subscriptionActiveUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,subscriptionCancelAtPeriodEnd: null == subscriptionCancelAtPeriodEnd ? _self.subscriptionCancelAtPeriodEnd : subscriptionCancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool,showCardDecoration: null == showCardDecoration ? _self.showCardDecoration : showCardDecoration // ignore: cast_nullable_to_non_nullable
as bool,showProfileDecoration: null == showProfileDecoration ? _self.showProfileDecoration : showProfileDecoration // ignore: cast_nullable_to_non_nullable
as bool,showSubscriptionBadges: null == showSubscriptionBadges ? _self.showSubscriptionBadges : showSubscriptionBadges // ignore: cast_nullable_to_non_nullable
as bool,showGreenBadge: null == showGreenBadge ? _self.showGreenBadge : showGreenBadge // ignore: cast_nullable_to_non_nullable
as bool,showPlusBadge: null == showPlusBadge ? _self.showPlusBadge : showPlusBadge // ignore: cast_nullable_to_non_nullable
as bool,showProBadge: null == showProBadge ? _self.showProBadge : showProBadge // ignore: cast_nullable_to_non_nullable
as bool,showRedBadge: null == showRedBadge ? _self.showRedBadge : showRedBadge // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AuthUser {

 int get id; String get username; String get displayName; String? get avatarUrl; int? get avatarFrameId; String? get headerUrl; String? get bio; String? get location; String? get websiteUrl; String? get statusMessage; String? get email; bool get emailVerified;/// メールアドレスのハッシュ。アバターの生成などに使われる。
 String get emailHash; bool get hasPassword; bool get twoFactorEnabled; List<String> get linkedOAuthProviders; bool get isPrivate; bool get isBotAccount; bool get isParodyAccount; bool get adminForceParody; bool get adminForceBot; bool get adminForceR18; bool get adminForceHidden; int? get adminForceProfileMinimumAge; int? get adminForceProfileMaximumAge;@OfficialMarkListConverter() List<OfficialMark> get officialMark; bool get isAdmin; bool get isBanned; bool get isRestricted; String? get banReason; DateTime? get bannedUntil; DateTime? get birthday; String? get displayBirthday; String get birthdayVisibility; bool get birthdayBalloonsEnabled; String get gender; DateTime? get createdAt; int get followersCount; int get followingCount; int get postsCount; int get points; int get experience; bool get levelEnabled; bool get isPremium; DateTime? get premiumUntil; bool get hideProfileFromMinors; int? get profileMinimumAge; int? get profileMaximumAge; String get onlineStatus; String get onlineStatusVisibility; bool get questionsEnabled; bool get giftsEnabled; bool get showLikedPosts; bool get showReadReceipts; bool get directMessagesEnabled;/// 誰から DM を受けるか。`EVERYONE` / `FOLLOWING` など。
 String get dmRequestPolicy; bool get showR18Content; bool get showHiddenPosts; bool get showBotAccounts; bool get showParodyAccounts; bool get showReactions; bool get showRepliesInTimeline; bool get showRekarotsInTimeline; bool get hideUnfollowedRekarotsInTimeline; List<String> get mutedKeywords; bool get defaultExcludeReplyTargets; bool get notifyLikes; bool get notifyReplies; bool get notifyRekarots; bool get notifyQuotes; bool get notifyMentions; bool get notifyFollows; bool get notifyReactions; bool get notifyDMs; bool get notifyBoardActivity; bool get notifyNewsOnLaunch; bool get notificationMuteNewAccounts; bool get notificationMuteNoAvatar; bool get notificationMuteNonFollowers; bool get notificationMuteNonFollowing; bool get legalQuizPassed;/// 最後に読んだ利用規約のバージョン。文字列で比較される。
 String? get legalNoticeSeenVersion; String? get cardAccentColor; String? get profileAccentColor; String get premiumBadgeColor; List<String> get subscriptionBadgeColors; String get subscriptionPlan; String get subscriptionStatus; DateTime? get subscriptionActiveUntil; bool get subscriptionCancelAtPeriodEnd; bool get showCardDecoration; bool get showProfileDecoration; bool get showSubscriptionBadges; bool get showGreenBadge; bool get showPlusBadge; bool get showProBadge; bool get showRedBadge;
/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserCopyWith<AuthUser> get copyWith => _$AuthUserCopyWithImpl<AuthUser>(this as AuthUser, _$identity);

  /// Serializes this AuthUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.headerUrl, headerUrl) || other.headerUrl == headerUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.location, location) || other.location == location)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.emailHash, emailHash) || other.emailHash == emailHash)&&(identical(other.hasPassword, hasPassword) || other.hasPassword == hasPassword)&&(identical(other.twoFactorEnabled, twoFactorEnabled) || other.twoFactorEnabled == twoFactorEnabled)&&const DeepCollectionEquality().equals(other.linkedOAuthProviders, linkedOAuthProviders)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&(identical(other.adminForceParody, adminForceParody) || other.adminForceParody == adminForceParody)&&(identical(other.adminForceBot, adminForceBot) || other.adminForceBot == adminForceBot)&&(identical(other.adminForceR18, adminForceR18) || other.adminForceR18 == adminForceR18)&&(identical(other.adminForceHidden, adminForceHidden) || other.adminForceHidden == adminForceHidden)&&(identical(other.adminForceProfileMinimumAge, adminForceProfileMinimumAge) || other.adminForceProfileMinimumAge == adminForceProfileMinimumAge)&&(identical(other.adminForceProfileMaximumAge, adminForceProfileMaximumAge) || other.adminForceProfileMaximumAge == adminForceProfileMaximumAge)&&const DeepCollectionEquality().equals(other.officialMark, officialMark)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.isRestricted, isRestricted) || other.isRestricted == isRestricted)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.bannedUntil, bannedUntil) || other.bannedUntil == bannedUntil)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.displayBirthday, displayBirthday) || other.displayBirthday == displayBirthday)&&(identical(other.birthdayVisibility, birthdayVisibility) || other.birthdayVisibility == birthdayVisibility)&&(identical(other.birthdayBalloonsEnabled, birthdayBalloonsEnabled) || other.birthdayBalloonsEnabled == birthdayBalloonsEnabled)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.postsCount, postsCount) || other.postsCount == postsCount)&&(identical(other.points, points) || other.points == points)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.levelEnabled, levelEnabled) || other.levelEnabled == levelEnabled)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.premiumUntil, premiumUntil) || other.premiumUntil == premiumUntil)&&(identical(other.hideProfileFromMinors, hideProfileFromMinors) || other.hideProfileFromMinors == hideProfileFromMinors)&&(identical(other.profileMinimumAge, profileMinimumAge) || other.profileMinimumAge == profileMinimumAge)&&(identical(other.profileMaximumAge, profileMaximumAge) || other.profileMaximumAge == profileMaximumAge)&&(identical(other.onlineStatus, onlineStatus) || other.onlineStatus == onlineStatus)&&(identical(other.onlineStatusVisibility, onlineStatusVisibility) || other.onlineStatusVisibility == onlineStatusVisibility)&&(identical(other.questionsEnabled, questionsEnabled) || other.questionsEnabled == questionsEnabled)&&(identical(other.giftsEnabled, giftsEnabled) || other.giftsEnabled == giftsEnabled)&&(identical(other.showLikedPosts, showLikedPosts) || other.showLikedPosts == showLikedPosts)&&(identical(other.showReadReceipts, showReadReceipts) || other.showReadReceipts == showReadReceipts)&&(identical(other.directMessagesEnabled, directMessagesEnabled) || other.directMessagesEnabled == directMessagesEnabled)&&(identical(other.dmRequestPolicy, dmRequestPolicy) || other.dmRequestPolicy == dmRequestPolicy)&&(identical(other.showR18Content, showR18Content) || other.showR18Content == showR18Content)&&(identical(other.showHiddenPosts, showHiddenPosts) || other.showHiddenPosts == showHiddenPosts)&&(identical(other.showBotAccounts, showBotAccounts) || other.showBotAccounts == showBotAccounts)&&(identical(other.showParodyAccounts, showParodyAccounts) || other.showParodyAccounts == showParodyAccounts)&&(identical(other.showReactions, showReactions) || other.showReactions == showReactions)&&(identical(other.showRepliesInTimeline, showRepliesInTimeline) || other.showRepliesInTimeline == showRepliesInTimeline)&&(identical(other.showRekarotsInTimeline, showRekarotsInTimeline) || other.showRekarotsInTimeline == showRekarotsInTimeline)&&(identical(other.hideUnfollowedRekarotsInTimeline, hideUnfollowedRekarotsInTimeline) || other.hideUnfollowedRekarotsInTimeline == hideUnfollowedRekarotsInTimeline)&&const DeepCollectionEquality().equals(other.mutedKeywords, mutedKeywords)&&(identical(other.defaultExcludeReplyTargets, defaultExcludeReplyTargets) || other.defaultExcludeReplyTargets == defaultExcludeReplyTargets)&&(identical(other.notifyLikes, notifyLikes) || other.notifyLikes == notifyLikes)&&(identical(other.notifyReplies, notifyReplies) || other.notifyReplies == notifyReplies)&&(identical(other.notifyRekarots, notifyRekarots) || other.notifyRekarots == notifyRekarots)&&(identical(other.notifyQuotes, notifyQuotes) || other.notifyQuotes == notifyQuotes)&&(identical(other.notifyMentions, notifyMentions) || other.notifyMentions == notifyMentions)&&(identical(other.notifyFollows, notifyFollows) || other.notifyFollows == notifyFollows)&&(identical(other.notifyReactions, notifyReactions) || other.notifyReactions == notifyReactions)&&(identical(other.notifyDMs, notifyDMs) || other.notifyDMs == notifyDMs)&&(identical(other.notifyBoardActivity, notifyBoardActivity) || other.notifyBoardActivity == notifyBoardActivity)&&(identical(other.notifyNewsOnLaunch, notifyNewsOnLaunch) || other.notifyNewsOnLaunch == notifyNewsOnLaunch)&&(identical(other.notificationMuteNewAccounts, notificationMuteNewAccounts) || other.notificationMuteNewAccounts == notificationMuteNewAccounts)&&(identical(other.notificationMuteNoAvatar, notificationMuteNoAvatar) || other.notificationMuteNoAvatar == notificationMuteNoAvatar)&&(identical(other.notificationMuteNonFollowers, notificationMuteNonFollowers) || other.notificationMuteNonFollowers == notificationMuteNonFollowers)&&(identical(other.notificationMuteNonFollowing, notificationMuteNonFollowing) || other.notificationMuteNonFollowing == notificationMuteNonFollowing)&&(identical(other.legalQuizPassed, legalQuizPassed) || other.legalQuizPassed == legalQuizPassed)&&(identical(other.legalNoticeSeenVersion, legalNoticeSeenVersion) || other.legalNoticeSeenVersion == legalNoticeSeenVersion)&&(identical(other.cardAccentColor, cardAccentColor) || other.cardAccentColor == cardAccentColor)&&(identical(other.profileAccentColor, profileAccentColor) || other.profileAccentColor == profileAccentColor)&&(identical(other.premiumBadgeColor, premiumBadgeColor) || other.premiumBadgeColor == premiumBadgeColor)&&const DeepCollectionEquality().equals(other.subscriptionBadgeColors, subscriptionBadgeColors)&&(identical(other.subscriptionPlan, subscriptionPlan) || other.subscriptionPlan == subscriptionPlan)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.subscriptionActiveUntil, subscriptionActiveUntil) || other.subscriptionActiveUntil == subscriptionActiveUntil)&&(identical(other.subscriptionCancelAtPeriodEnd, subscriptionCancelAtPeriodEnd) || other.subscriptionCancelAtPeriodEnd == subscriptionCancelAtPeriodEnd)&&(identical(other.showCardDecoration, showCardDecoration) || other.showCardDecoration == showCardDecoration)&&(identical(other.showProfileDecoration, showProfileDecoration) || other.showProfileDecoration == showProfileDecoration)&&(identical(other.showSubscriptionBadges, showSubscriptionBadges) || other.showSubscriptionBadges == showSubscriptionBadges)&&(identical(other.showGreenBadge, showGreenBadge) || other.showGreenBadge == showGreenBadge)&&(identical(other.showPlusBadge, showPlusBadge) || other.showPlusBadge == showPlusBadge)&&(identical(other.showProBadge, showProBadge) || other.showProBadge == showProBadge)&&(identical(other.showRedBadge, showRedBadge) || other.showRedBadge == showRedBadge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,username,displayName,avatarUrl,avatarFrameId,headerUrl,bio,location,websiteUrl,statusMessage,email,emailVerified,emailHash,hasPassword,twoFactorEnabled,const DeepCollectionEquality().hash(linkedOAuthProviders),isPrivate,isBotAccount,isParodyAccount,adminForceParody,adminForceBot,adminForceR18,adminForceHidden,adminForceProfileMinimumAge,adminForceProfileMaximumAge,const DeepCollectionEquality().hash(officialMark),isAdmin,isBanned,isRestricted,banReason,bannedUntil,birthday,displayBirthday,birthdayVisibility,birthdayBalloonsEnabled,gender,createdAt,followersCount,followingCount,postsCount,points,experience,levelEnabled,isPremium,premiumUntil,hideProfileFromMinors,profileMinimumAge,profileMaximumAge,onlineStatus,onlineStatusVisibility,questionsEnabled,giftsEnabled,showLikedPosts,showReadReceipts,directMessagesEnabled,dmRequestPolicy,showR18Content,showHiddenPosts,showBotAccounts,showParodyAccounts,showReactions,showRepliesInTimeline,showRekarotsInTimeline,hideUnfollowedRekarotsInTimeline,const DeepCollectionEquality().hash(mutedKeywords),defaultExcludeReplyTargets,notifyLikes,notifyReplies,notifyRekarots,notifyQuotes,notifyMentions,notifyFollows,notifyReactions,notifyDMs,notifyBoardActivity,notifyNewsOnLaunch,notificationMuteNewAccounts,notificationMuteNoAvatar,notificationMuteNonFollowers,notificationMuteNonFollowing,legalQuizPassed,legalNoticeSeenVersion,cardAccentColor,profileAccentColor,premiumBadgeColor,const DeepCollectionEquality().hash(subscriptionBadgeColors),subscriptionPlan,subscriptionStatus,subscriptionActiveUntil,subscriptionCancelAtPeriodEnd,showCardDecoration,showProfileDecoration,showSubscriptionBadges,showGreenBadge,showPlusBadge,showProBadge,showRedBadge]);

@override
String toString() {
  return 'AuthUser(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, avatarFrameId: $avatarFrameId, headerUrl: $headerUrl, bio: $bio, location: $location, websiteUrl: $websiteUrl, statusMessage: $statusMessage, email: $email, emailVerified: $emailVerified, emailHash: $emailHash, hasPassword: $hasPassword, twoFactorEnabled: $twoFactorEnabled, linkedOAuthProviders: $linkedOAuthProviders, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, adminForceParody: $adminForceParody, adminForceBot: $adminForceBot, adminForceR18: $adminForceR18, adminForceHidden: $adminForceHidden, adminForceProfileMinimumAge: $adminForceProfileMinimumAge, adminForceProfileMaximumAge: $adminForceProfileMaximumAge, officialMark: $officialMark, isAdmin: $isAdmin, isBanned: $isBanned, isRestricted: $isRestricted, banReason: $banReason, bannedUntil: $bannedUntil, birthday: $birthday, displayBirthday: $displayBirthday, birthdayVisibility: $birthdayVisibility, birthdayBalloonsEnabled: $birthdayBalloonsEnabled, gender: $gender, createdAt: $createdAt, followersCount: $followersCount, followingCount: $followingCount, postsCount: $postsCount, points: $points, experience: $experience, levelEnabled: $levelEnabled, isPremium: $isPremium, premiumUntil: $premiumUntil, hideProfileFromMinors: $hideProfileFromMinors, profileMinimumAge: $profileMinimumAge, profileMaximumAge: $profileMaximumAge, onlineStatus: $onlineStatus, onlineStatusVisibility: $onlineStatusVisibility, questionsEnabled: $questionsEnabled, giftsEnabled: $giftsEnabled, showLikedPosts: $showLikedPosts, showReadReceipts: $showReadReceipts, directMessagesEnabled: $directMessagesEnabled, dmRequestPolicy: $dmRequestPolicy, showR18Content: $showR18Content, showHiddenPosts: $showHiddenPosts, showBotAccounts: $showBotAccounts, showParodyAccounts: $showParodyAccounts, showReactions: $showReactions, showRepliesInTimeline: $showRepliesInTimeline, showRekarotsInTimeline: $showRekarotsInTimeline, hideUnfollowedRekarotsInTimeline: $hideUnfollowedRekarotsInTimeline, mutedKeywords: $mutedKeywords, defaultExcludeReplyTargets: $defaultExcludeReplyTargets, notifyLikes: $notifyLikes, notifyReplies: $notifyReplies, notifyRekarots: $notifyRekarots, notifyQuotes: $notifyQuotes, notifyMentions: $notifyMentions, notifyFollows: $notifyFollows, notifyReactions: $notifyReactions, notifyDMs: $notifyDMs, notifyBoardActivity: $notifyBoardActivity, notifyNewsOnLaunch: $notifyNewsOnLaunch, notificationMuteNewAccounts: $notificationMuteNewAccounts, notificationMuteNoAvatar: $notificationMuteNoAvatar, notificationMuteNonFollowers: $notificationMuteNonFollowers, notificationMuteNonFollowing: $notificationMuteNonFollowing, legalQuizPassed: $legalQuizPassed, legalNoticeSeenVersion: $legalNoticeSeenVersion, cardAccentColor: $cardAccentColor, profileAccentColor: $profileAccentColor, premiumBadgeColor: $premiumBadgeColor, subscriptionBadgeColors: $subscriptionBadgeColors, subscriptionPlan: $subscriptionPlan, subscriptionStatus: $subscriptionStatus, subscriptionActiveUntil: $subscriptionActiveUntil, subscriptionCancelAtPeriodEnd: $subscriptionCancelAtPeriodEnd, showCardDecoration: $showCardDecoration, showProfileDecoration: $showProfileDecoration, showSubscriptionBadges: $showSubscriptionBadges, showGreenBadge: $showGreenBadge, showPlusBadge: $showPlusBadge, showProBadge: $showProBadge, showRedBadge: $showRedBadge)';
}


}

/// @nodoc
abstract mixin class $AuthUserCopyWith<$Res>  {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) _then) = _$AuthUserCopyWithImpl;
@useResult
$Res call({
 int id, String username, String displayName, String? avatarUrl, int? avatarFrameId, String? headerUrl, String? bio, String? location, String? websiteUrl, String? statusMessage, String? email, bool emailVerified, String emailHash, bool hasPassword, bool twoFactorEnabled, List<String> linkedOAuthProviders, bool isPrivate, bool isBotAccount, bool isParodyAccount, bool adminForceParody, bool adminForceBot, bool adminForceR18, bool adminForceHidden, int? adminForceProfileMinimumAge, int? adminForceProfileMaximumAge,@OfficialMarkListConverter() List<OfficialMark> officialMark, bool isAdmin, bool isBanned, bool isRestricted, String? banReason, DateTime? bannedUntil, DateTime? birthday, String? displayBirthday, String birthdayVisibility, bool birthdayBalloonsEnabled, String gender, DateTime? createdAt, int followersCount, int followingCount, int postsCount, int points, int experience, bool levelEnabled, bool isPremium, DateTime? premiumUntil, bool hideProfileFromMinors, int? profileMinimumAge, int? profileMaximumAge, String onlineStatus, String onlineStatusVisibility, bool questionsEnabled, bool giftsEnabled, bool showLikedPosts, bool showReadReceipts, bool directMessagesEnabled, String dmRequestPolicy, bool showR18Content, bool showHiddenPosts, bool showBotAccounts, bool showParodyAccounts, bool showReactions, bool showRepliesInTimeline, bool showRekarotsInTimeline, bool hideUnfollowedRekarotsInTimeline, List<String> mutedKeywords, bool defaultExcludeReplyTargets, bool notifyLikes, bool notifyReplies, bool notifyRekarots, bool notifyQuotes, bool notifyMentions, bool notifyFollows, bool notifyReactions, bool notifyDMs, bool notifyBoardActivity, bool notifyNewsOnLaunch, bool notificationMuteNewAccounts, bool notificationMuteNoAvatar, bool notificationMuteNonFollowers, bool notificationMuteNonFollowing, bool legalQuizPassed, String? legalNoticeSeenVersion, String? cardAccentColor, String? profileAccentColor, String premiumBadgeColor, List<String> subscriptionBadgeColors, String subscriptionPlan, String subscriptionStatus, DateTime? subscriptionActiveUntil, bool subscriptionCancelAtPeriodEnd, bool showCardDecoration, bool showProfileDecoration, bool showSubscriptionBadges, bool showGreenBadge, bool showPlusBadge, bool showProBadge, bool showRedBadge
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? displayName = null,Object? avatarUrl = freezed,Object? avatarFrameId = freezed,Object? headerUrl = freezed,Object? bio = freezed,Object? location = freezed,Object? websiteUrl = freezed,Object? statusMessage = freezed,Object? email = freezed,Object? emailVerified = null,Object? emailHash = null,Object? hasPassword = null,Object? twoFactorEnabled = null,Object? linkedOAuthProviders = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? adminForceParody = null,Object? adminForceBot = null,Object? adminForceR18 = null,Object? adminForceHidden = null,Object? adminForceProfileMinimumAge = freezed,Object? adminForceProfileMaximumAge = freezed,Object? officialMark = null,Object? isAdmin = null,Object? isBanned = null,Object? isRestricted = null,Object? banReason = freezed,Object? bannedUntil = freezed,Object? birthday = freezed,Object? displayBirthday = freezed,Object? birthdayVisibility = null,Object? birthdayBalloonsEnabled = null,Object? gender = null,Object? createdAt = freezed,Object? followersCount = null,Object? followingCount = null,Object? postsCount = null,Object? points = null,Object? experience = null,Object? levelEnabled = null,Object? isPremium = null,Object? premiumUntil = freezed,Object? hideProfileFromMinors = null,Object? profileMinimumAge = freezed,Object? profileMaximumAge = freezed,Object? onlineStatus = null,Object? onlineStatusVisibility = null,Object? questionsEnabled = null,Object? giftsEnabled = null,Object? showLikedPosts = null,Object? showReadReceipts = null,Object? directMessagesEnabled = null,Object? dmRequestPolicy = null,Object? showR18Content = null,Object? showHiddenPosts = null,Object? showBotAccounts = null,Object? showParodyAccounts = null,Object? showReactions = null,Object? showRepliesInTimeline = null,Object? showRekarotsInTimeline = null,Object? hideUnfollowedRekarotsInTimeline = null,Object? mutedKeywords = null,Object? defaultExcludeReplyTargets = null,Object? notifyLikes = null,Object? notifyReplies = null,Object? notifyRekarots = null,Object? notifyQuotes = null,Object? notifyMentions = null,Object? notifyFollows = null,Object? notifyReactions = null,Object? notifyDMs = null,Object? notifyBoardActivity = null,Object? notifyNewsOnLaunch = null,Object? notificationMuteNewAccounts = null,Object? notificationMuteNoAvatar = null,Object? notificationMuteNonFollowers = null,Object? notificationMuteNonFollowing = null,Object? legalQuizPassed = null,Object? legalNoticeSeenVersion = freezed,Object? cardAccentColor = freezed,Object? profileAccentColor = freezed,Object? premiumBadgeColor = null,Object? subscriptionBadgeColors = null,Object? subscriptionPlan = null,Object? subscriptionStatus = null,Object? subscriptionActiveUntil = freezed,Object? subscriptionCancelAtPeriodEnd = null,Object? showCardDecoration = null,Object? showProfileDecoration = null,Object? showSubscriptionBadges = null,Object? showGreenBadge = null,Object? showPlusBadge = null,Object? showProBadge = null,Object? showRedBadge = null,}) {
  return _then(AuthUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,headerUrl: freezed == headerUrl ? _self.headerUrl : headerUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,emailHash: null == emailHash ? _self.emailHash : emailHash // ignore: cast_nullable_to_non_nullable
as String,hasPassword: null == hasPassword ? _self.hasPassword : hasPassword // ignore: cast_nullable_to_non_nullable
as bool,twoFactorEnabled: null == twoFactorEnabled ? _self.twoFactorEnabled : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
as bool,linkedOAuthProviders: null == linkedOAuthProviders ? _self.linkedOAuthProviders : linkedOAuthProviders // ignore: cast_nullable_to_non_nullable
as List<String>,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,adminForceParody: null == adminForceParody ? _self.adminForceParody : adminForceParody // ignore: cast_nullable_to_non_nullable
as bool,adminForceBot: null == adminForceBot ? _self.adminForceBot : adminForceBot // ignore: cast_nullable_to_non_nullable
as bool,adminForceR18: null == adminForceR18 ? _self.adminForceR18 : adminForceR18 // ignore: cast_nullable_to_non_nullable
as bool,adminForceHidden: null == adminForceHidden ? _self.adminForceHidden : adminForceHidden // ignore: cast_nullable_to_non_nullable
as bool,adminForceProfileMinimumAge: freezed == adminForceProfileMinimumAge ? _self.adminForceProfileMinimumAge : adminForceProfileMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,adminForceProfileMaximumAge: freezed == adminForceProfileMaximumAge ? _self.adminForceProfileMaximumAge : adminForceProfileMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,officialMark: null == officialMark ? _self.officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<OfficialMark>,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,isRestricted: null == isRestricted ? _self.isRestricted : isRestricted // ignore: cast_nullable_to_non_nullable
as bool,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,bannedUntil: freezed == bannedUntil ? _self.bannedUntil : bannedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,displayBirthday: freezed == displayBirthday ? _self.displayBirthday : displayBirthday // ignore: cast_nullable_to_non_nullable
as String?,birthdayVisibility: null == birthdayVisibility ? _self.birthdayVisibility : birthdayVisibility // ignore: cast_nullable_to_non_nullable
as String,birthdayBalloonsEnabled: null == birthdayBalloonsEnabled ? _self.birthdayBalloonsEnabled : birthdayBalloonsEnabled // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,postsCount: null == postsCount ? _self.postsCount : postsCount // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int,levelEnabled: null == levelEnabled ? _self.levelEnabled : levelEnabled // ignore: cast_nullable_to_non_nullable
as bool,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,premiumUntil: freezed == premiumUntil ? _self.premiumUntil : premiumUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,hideProfileFromMinors: null == hideProfileFromMinors ? _self.hideProfileFromMinors : hideProfileFromMinors // ignore: cast_nullable_to_non_nullable
as bool,profileMinimumAge: freezed == profileMinimumAge ? _self.profileMinimumAge : profileMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,profileMaximumAge: freezed == profileMaximumAge ? _self.profileMaximumAge : profileMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,onlineStatus: null == onlineStatus ? _self.onlineStatus : onlineStatus // ignore: cast_nullable_to_non_nullable
as String,onlineStatusVisibility: null == onlineStatusVisibility ? _self.onlineStatusVisibility : onlineStatusVisibility // ignore: cast_nullable_to_non_nullable
as String,questionsEnabled: null == questionsEnabled ? _self.questionsEnabled : questionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,giftsEnabled: null == giftsEnabled ? _self.giftsEnabled : giftsEnabled // ignore: cast_nullable_to_non_nullable
as bool,showLikedPosts: null == showLikedPosts ? _self.showLikedPosts : showLikedPosts // ignore: cast_nullable_to_non_nullable
as bool,showReadReceipts: null == showReadReceipts ? _self.showReadReceipts : showReadReceipts // ignore: cast_nullable_to_non_nullable
as bool,directMessagesEnabled: null == directMessagesEnabled ? _self.directMessagesEnabled : directMessagesEnabled // ignore: cast_nullable_to_non_nullable
as bool,dmRequestPolicy: null == dmRequestPolicy ? _self.dmRequestPolicy : dmRequestPolicy // ignore: cast_nullable_to_non_nullable
as String,showR18Content: null == showR18Content ? _self.showR18Content : showR18Content // ignore: cast_nullable_to_non_nullable
as bool,showHiddenPosts: null == showHiddenPosts ? _self.showHiddenPosts : showHiddenPosts // ignore: cast_nullable_to_non_nullable
as bool,showBotAccounts: null == showBotAccounts ? _self.showBotAccounts : showBotAccounts // ignore: cast_nullable_to_non_nullable
as bool,showParodyAccounts: null == showParodyAccounts ? _self.showParodyAccounts : showParodyAccounts // ignore: cast_nullable_to_non_nullable
as bool,showReactions: null == showReactions ? _self.showReactions : showReactions // ignore: cast_nullable_to_non_nullable
as bool,showRepliesInTimeline: null == showRepliesInTimeline ? _self.showRepliesInTimeline : showRepliesInTimeline // ignore: cast_nullable_to_non_nullable
as bool,showRekarotsInTimeline: null == showRekarotsInTimeline ? _self.showRekarotsInTimeline : showRekarotsInTimeline // ignore: cast_nullable_to_non_nullable
as bool,hideUnfollowedRekarotsInTimeline: null == hideUnfollowedRekarotsInTimeline ? _self.hideUnfollowedRekarotsInTimeline : hideUnfollowedRekarotsInTimeline // ignore: cast_nullable_to_non_nullable
as bool,mutedKeywords: null == mutedKeywords ? _self.mutedKeywords : mutedKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,defaultExcludeReplyTargets: null == defaultExcludeReplyTargets ? _self.defaultExcludeReplyTargets : defaultExcludeReplyTargets // ignore: cast_nullable_to_non_nullable
as bool,notifyLikes: null == notifyLikes ? _self.notifyLikes : notifyLikes // ignore: cast_nullable_to_non_nullable
as bool,notifyReplies: null == notifyReplies ? _self.notifyReplies : notifyReplies // ignore: cast_nullable_to_non_nullable
as bool,notifyRekarots: null == notifyRekarots ? _self.notifyRekarots : notifyRekarots // ignore: cast_nullable_to_non_nullable
as bool,notifyQuotes: null == notifyQuotes ? _self.notifyQuotes : notifyQuotes // ignore: cast_nullable_to_non_nullable
as bool,notifyMentions: null == notifyMentions ? _self.notifyMentions : notifyMentions // ignore: cast_nullable_to_non_nullable
as bool,notifyFollows: null == notifyFollows ? _self.notifyFollows : notifyFollows // ignore: cast_nullable_to_non_nullable
as bool,notifyReactions: null == notifyReactions ? _self.notifyReactions : notifyReactions // ignore: cast_nullable_to_non_nullable
as bool,notifyDMs: null == notifyDMs ? _self.notifyDMs : notifyDMs // ignore: cast_nullable_to_non_nullable
as bool,notifyBoardActivity: null == notifyBoardActivity ? _self.notifyBoardActivity : notifyBoardActivity // ignore: cast_nullable_to_non_nullable
as bool,notifyNewsOnLaunch: null == notifyNewsOnLaunch ? _self.notifyNewsOnLaunch : notifyNewsOnLaunch // ignore: cast_nullable_to_non_nullable
as bool,notificationMuteNewAccounts: null == notificationMuteNewAccounts ? _self.notificationMuteNewAccounts : notificationMuteNewAccounts // ignore: cast_nullable_to_non_nullable
as bool,notificationMuteNoAvatar: null == notificationMuteNoAvatar ? _self.notificationMuteNoAvatar : notificationMuteNoAvatar // ignore: cast_nullable_to_non_nullable
as bool,notificationMuteNonFollowers: null == notificationMuteNonFollowers ? _self.notificationMuteNonFollowers : notificationMuteNonFollowers // ignore: cast_nullable_to_non_nullable
as bool,notificationMuteNonFollowing: null == notificationMuteNonFollowing ? _self.notificationMuteNonFollowing : notificationMuteNonFollowing // ignore: cast_nullable_to_non_nullable
as bool,legalQuizPassed: null == legalQuizPassed ? _self.legalQuizPassed : legalQuizPassed // ignore: cast_nullable_to_non_nullable
as bool,legalNoticeSeenVersion: freezed == legalNoticeSeenVersion ? _self.legalNoticeSeenVersion : legalNoticeSeenVersion // ignore: cast_nullable_to_non_nullable
as String?,cardAccentColor: freezed == cardAccentColor ? _self.cardAccentColor : cardAccentColor // ignore: cast_nullable_to_non_nullable
as String?,profileAccentColor: freezed == profileAccentColor ? _self.profileAccentColor : profileAccentColor // ignore: cast_nullable_to_non_nullable
as String?,premiumBadgeColor: null == premiumBadgeColor ? _self.premiumBadgeColor : premiumBadgeColor // ignore: cast_nullable_to_non_nullable
as String,subscriptionBadgeColors: null == subscriptionBadgeColors ? _self.subscriptionBadgeColors : subscriptionBadgeColors // ignore: cast_nullable_to_non_nullable
as List<String>,subscriptionPlan: null == subscriptionPlan ? _self.subscriptionPlan : subscriptionPlan // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionActiveUntil: freezed == subscriptionActiveUntil ? _self.subscriptionActiveUntil : subscriptionActiveUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,subscriptionCancelAtPeriodEnd: null == subscriptionCancelAtPeriodEnd ? _self.subscriptionCancelAtPeriodEnd : subscriptionCancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool,showCardDecoration: null == showCardDecoration ? _self.showCardDecoration : showCardDecoration // ignore: cast_nullable_to_non_nullable
as bool,showProfileDecoration: null == showProfileDecoration ? _self.showProfileDecoration : showProfileDecoration // ignore: cast_nullable_to_non_nullable
as bool,showSubscriptionBadges: null == showSubscriptionBadges ? _self.showSubscriptionBadges : showSubscriptionBadges // ignore: cast_nullable_to_non_nullable
as bool,showGreenBadge: null == showGreenBadge ? _self.showGreenBadge : showGreenBadge // ignore: cast_nullable_to_non_nullable
as bool,showPlusBadge: null == showPlusBadge ? _self.showPlusBadge : showPlusBadge // ignore: cast_nullable_to_non_nullable
as bool,showProBadge: null == showProBadge ? _self.showProBadge : showProBadge // ignore: cast_nullable_to_non_nullable
as bool,showRedBadge: null == showRedBadge ? _self.showRedBadge : showRedBadge // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String displayName,  String? avatarUrl,  int? avatarFrameId,  String? headerUrl,  String? bio,  String? location,  String? websiteUrl,  String? statusMessage,  String? email,  bool emailVerified,  String emailHash,  bool hasPassword,  bool twoFactorEnabled,  List<String> linkedOAuthProviders,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot,  bool adminForceR18,  bool adminForceHidden,  int? adminForceProfileMinimumAge,  int? adminForceProfileMaximumAge, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  bool isAdmin,  bool isBanned,  bool isRestricted,  String? banReason,  DateTime? bannedUntil,  DateTime? birthday,  String? displayBirthday,  String birthdayVisibility,  bool birthdayBalloonsEnabled,  String gender,  DateTime? createdAt,  int followersCount,  int followingCount,  int postsCount,  int points,  int experience,  bool levelEnabled,  bool isPremium,  DateTime? premiumUntil,  bool hideProfileFromMinors,  int? profileMinimumAge,  int? profileMaximumAge,  String onlineStatus,  String onlineStatusVisibility,  bool questionsEnabled,  bool giftsEnabled,  bool showLikedPosts,  bool showReadReceipts,  bool directMessagesEnabled,  String dmRequestPolicy,  bool showR18Content,  bool showHiddenPosts,  bool showBotAccounts,  bool showParodyAccounts,  bool showReactions,  bool showRepliesInTimeline,  bool showRekarotsInTimeline,  bool hideUnfollowedRekarotsInTimeline,  List<String> mutedKeywords,  bool defaultExcludeReplyTargets,  bool notifyLikes,  bool notifyReplies,  bool notifyRekarots,  bool notifyQuotes,  bool notifyMentions,  bool notifyFollows,  bool notifyReactions,  bool notifyDMs,  bool notifyBoardActivity,  bool notifyNewsOnLaunch,  bool notificationMuteNewAccounts,  bool notificationMuteNoAvatar,  bool notificationMuteNonFollowers,  bool notificationMuteNonFollowing,  bool legalQuizPassed,  String? legalNoticeSeenVersion,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool subscriptionCancelAtPeriodEnd,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl,_that.avatarFrameId,_that.headerUrl,_that.bio,_that.location,_that.websiteUrl,_that.statusMessage,_that.email,_that.emailVerified,_that.emailHash,_that.hasPassword,_that.twoFactorEnabled,_that.linkedOAuthProviders,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.adminForceR18,_that.adminForceHidden,_that.adminForceProfileMinimumAge,_that.adminForceProfileMaximumAge,_that.officialMark,_that.isAdmin,_that.isBanned,_that.isRestricted,_that.banReason,_that.bannedUntil,_that.birthday,_that.displayBirthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.gender,_that.createdAt,_that.followersCount,_that.followingCount,_that.postsCount,_that.points,_that.experience,_that.levelEnabled,_that.isPremium,_that.premiumUntil,_that.hideProfileFromMinors,_that.profileMinimumAge,_that.profileMaximumAge,_that.onlineStatus,_that.onlineStatusVisibility,_that.questionsEnabled,_that.giftsEnabled,_that.showLikedPosts,_that.showReadReceipts,_that.directMessagesEnabled,_that.dmRequestPolicy,_that.showR18Content,_that.showHiddenPosts,_that.showBotAccounts,_that.showParodyAccounts,_that.showReactions,_that.showRepliesInTimeline,_that.showRekarotsInTimeline,_that.hideUnfollowedRekarotsInTimeline,_that.mutedKeywords,_that.defaultExcludeReplyTargets,_that.notifyLikes,_that.notifyReplies,_that.notifyRekarots,_that.notifyQuotes,_that.notifyMentions,_that.notifyFollows,_that.notifyReactions,_that.notifyDMs,_that.notifyBoardActivity,_that.notifyNewsOnLaunch,_that.notificationMuteNewAccounts,_that.notificationMuteNoAvatar,_that.notificationMuteNonFollowers,_that.notificationMuteNonFollowing,_that.legalQuizPassed,_that.legalNoticeSeenVersion,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.subscriptionCancelAtPeriodEnd,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String displayName,  String? avatarUrl,  int? avatarFrameId,  String? headerUrl,  String? bio,  String? location,  String? websiteUrl,  String? statusMessage,  String? email,  bool emailVerified,  String emailHash,  bool hasPassword,  bool twoFactorEnabled,  List<String> linkedOAuthProviders,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot,  bool adminForceR18,  bool adminForceHidden,  int? adminForceProfileMinimumAge,  int? adminForceProfileMaximumAge, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  bool isAdmin,  bool isBanned,  bool isRestricted,  String? banReason,  DateTime? bannedUntil,  DateTime? birthday,  String? displayBirthday,  String birthdayVisibility,  bool birthdayBalloonsEnabled,  String gender,  DateTime? createdAt,  int followersCount,  int followingCount,  int postsCount,  int points,  int experience,  bool levelEnabled,  bool isPremium,  DateTime? premiumUntil,  bool hideProfileFromMinors,  int? profileMinimumAge,  int? profileMaximumAge,  String onlineStatus,  String onlineStatusVisibility,  bool questionsEnabled,  bool giftsEnabled,  bool showLikedPosts,  bool showReadReceipts,  bool directMessagesEnabled,  String dmRequestPolicy,  bool showR18Content,  bool showHiddenPosts,  bool showBotAccounts,  bool showParodyAccounts,  bool showReactions,  bool showRepliesInTimeline,  bool showRekarotsInTimeline,  bool hideUnfollowedRekarotsInTimeline,  List<String> mutedKeywords,  bool defaultExcludeReplyTargets,  bool notifyLikes,  bool notifyReplies,  bool notifyRekarots,  bool notifyQuotes,  bool notifyMentions,  bool notifyFollows,  bool notifyReactions,  bool notifyDMs,  bool notifyBoardActivity,  bool notifyNewsOnLaunch,  bool notificationMuteNewAccounts,  bool notificationMuteNoAvatar,  bool notificationMuteNonFollowers,  bool notificationMuteNonFollowing,  bool legalQuizPassed,  String? legalNoticeSeenVersion,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool subscriptionCancelAtPeriodEnd,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)  $default,) {final _that = this;
switch (_that) {
case _AuthUser():
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl,_that.avatarFrameId,_that.headerUrl,_that.bio,_that.location,_that.websiteUrl,_that.statusMessage,_that.email,_that.emailVerified,_that.emailHash,_that.hasPassword,_that.twoFactorEnabled,_that.linkedOAuthProviders,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.adminForceR18,_that.adminForceHidden,_that.adminForceProfileMinimumAge,_that.adminForceProfileMaximumAge,_that.officialMark,_that.isAdmin,_that.isBanned,_that.isRestricted,_that.banReason,_that.bannedUntil,_that.birthday,_that.displayBirthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.gender,_that.createdAt,_that.followersCount,_that.followingCount,_that.postsCount,_that.points,_that.experience,_that.levelEnabled,_that.isPremium,_that.premiumUntil,_that.hideProfileFromMinors,_that.profileMinimumAge,_that.profileMaximumAge,_that.onlineStatus,_that.onlineStatusVisibility,_that.questionsEnabled,_that.giftsEnabled,_that.showLikedPosts,_that.showReadReceipts,_that.directMessagesEnabled,_that.dmRequestPolicy,_that.showR18Content,_that.showHiddenPosts,_that.showBotAccounts,_that.showParodyAccounts,_that.showReactions,_that.showRepliesInTimeline,_that.showRekarotsInTimeline,_that.hideUnfollowedRekarotsInTimeline,_that.mutedKeywords,_that.defaultExcludeReplyTargets,_that.notifyLikes,_that.notifyReplies,_that.notifyRekarots,_that.notifyQuotes,_that.notifyMentions,_that.notifyFollows,_that.notifyReactions,_that.notifyDMs,_that.notifyBoardActivity,_that.notifyNewsOnLaunch,_that.notificationMuteNewAccounts,_that.notificationMuteNoAvatar,_that.notificationMuteNonFollowers,_that.notificationMuteNonFollowing,_that.legalQuizPassed,_that.legalNoticeSeenVersion,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.subscriptionCancelAtPeriodEnd,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String displayName,  String? avatarUrl,  int? avatarFrameId,  String? headerUrl,  String? bio,  String? location,  String? websiteUrl,  String? statusMessage,  String? email,  bool emailVerified,  String emailHash,  bool hasPassword,  bool twoFactorEnabled,  List<String> linkedOAuthProviders,  bool isPrivate,  bool isBotAccount,  bool isParodyAccount,  bool adminForceParody,  bool adminForceBot,  bool adminForceR18,  bool adminForceHidden,  int? adminForceProfileMinimumAge,  int? adminForceProfileMaximumAge, @OfficialMarkListConverter()  List<OfficialMark> officialMark,  bool isAdmin,  bool isBanned,  bool isRestricted,  String? banReason,  DateTime? bannedUntil,  DateTime? birthday,  String? displayBirthday,  String birthdayVisibility,  bool birthdayBalloonsEnabled,  String gender,  DateTime? createdAt,  int followersCount,  int followingCount,  int postsCount,  int points,  int experience,  bool levelEnabled,  bool isPremium,  DateTime? premiumUntil,  bool hideProfileFromMinors,  int? profileMinimumAge,  int? profileMaximumAge,  String onlineStatus,  String onlineStatusVisibility,  bool questionsEnabled,  bool giftsEnabled,  bool showLikedPosts,  bool showReadReceipts,  bool directMessagesEnabled,  String dmRequestPolicy,  bool showR18Content,  bool showHiddenPosts,  bool showBotAccounts,  bool showParodyAccounts,  bool showReactions,  bool showRepliesInTimeline,  bool showRekarotsInTimeline,  bool hideUnfollowedRekarotsInTimeline,  List<String> mutedKeywords,  bool defaultExcludeReplyTargets,  bool notifyLikes,  bool notifyReplies,  bool notifyRekarots,  bool notifyQuotes,  bool notifyMentions,  bool notifyFollows,  bool notifyReactions,  bool notifyDMs,  bool notifyBoardActivity,  bool notifyNewsOnLaunch,  bool notificationMuteNewAccounts,  bool notificationMuteNoAvatar,  bool notificationMuteNonFollowers,  bool notificationMuteNonFollowing,  bool legalQuizPassed,  String? legalNoticeSeenVersion,  String? cardAccentColor,  String? profileAccentColor,  String premiumBadgeColor,  List<String> subscriptionBadgeColors,  String subscriptionPlan,  String subscriptionStatus,  DateTime? subscriptionActiveUntil,  bool subscriptionCancelAtPeriodEnd,  bool showCardDecoration,  bool showProfileDecoration,  bool showSubscriptionBadges,  bool showGreenBadge,  bool showPlusBadge,  bool showProBadge,  bool showRedBadge)?  $default,) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.avatarUrl,_that.avatarFrameId,_that.headerUrl,_that.bio,_that.location,_that.websiteUrl,_that.statusMessage,_that.email,_that.emailVerified,_that.emailHash,_that.hasPassword,_that.twoFactorEnabled,_that.linkedOAuthProviders,_that.isPrivate,_that.isBotAccount,_that.isParodyAccount,_that.adminForceParody,_that.adminForceBot,_that.adminForceR18,_that.adminForceHidden,_that.adminForceProfileMinimumAge,_that.adminForceProfileMaximumAge,_that.officialMark,_that.isAdmin,_that.isBanned,_that.isRestricted,_that.banReason,_that.bannedUntil,_that.birthday,_that.displayBirthday,_that.birthdayVisibility,_that.birthdayBalloonsEnabled,_that.gender,_that.createdAt,_that.followersCount,_that.followingCount,_that.postsCount,_that.points,_that.experience,_that.levelEnabled,_that.isPremium,_that.premiumUntil,_that.hideProfileFromMinors,_that.profileMinimumAge,_that.profileMaximumAge,_that.onlineStatus,_that.onlineStatusVisibility,_that.questionsEnabled,_that.giftsEnabled,_that.showLikedPosts,_that.showReadReceipts,_that.directMessagesEnabled,_that.dmRequestPolicy,_that.showR18Content,_that.showHiddenPosts,_that.showBotAccounts,_that.showParodyAccounts,_that.showReactions,_that.showRepliesInTimeline,_that.showRekarotsInTimeline,_that.hideUnfollowedRekarotsInTimeline,_that.mutedKeywords,_that.defaultExcludeReplyTargets,_that.notifyLikes,_that.notifyReplies,_that.notifyRekarots,_that.notifyQuotes,_that.notifyMentions,_that.notifyFollows,_that.notifyReactions,_that.notifyDMs,_that.notifyBoardActivity,_that.notifyNewsOnLaunch,_that.notificationMuteNewAccounts,_that.notificationMuteNoAvatar,_that.notificationMuteNonFollowers,_that.notificationMuteNonFollowing,_that.legalQuizPassed,_that.legalNoticeSeenVersion,_that.cardAccentColor,_that.profileAccentColor,_that.premiumBadgeColor,_that.subscriptionBadgeColors,_that.subscriptionPlan,_that.subscriptionStatus,_that.subscriptionActiveUntil,_that.subscriptionCancelAtPeriodEnd,_that.showCardDecoration,_that.showProfileDecoration,_that.showSubscriptionBadges,_that.showGreenBadge,_that.showPlusBadge,_that.showProBadge,_that.showRedBadge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUser implements AuthUser {
  const _AuthUser({required this.id, required this.username, required this.displayName, this.avatarUrl, this.avatarFrameId, this.headerUrl, this.bio, this.location, this.websiteUrl, this.statusMessage, this.email, this.emailVerified = false, this.emailHash = '', this.hasPassword = false, this.twoFactorEnabled = false,  List<String> linkedOAuthProviders = const [], this.isPrivate = false, this.isBotAccount = false, this.isParodyAccount = false, this.adminForceParody = false, this.adminForceBot = false, this.adminForceR18 = false, this.adminForceHidden = false, this.adminForceProfileMinimumAge, this.adminForceProfileMaximumAge, @OfficialMarkListConverter()  List<OfficialMark> officialMark = const [], this.isAdmin = false, this.isBanned = false, this.isRestricted = false, this.banReason, this.bannedUntil, this.birthday, this.displayBirthday, this.birthdayVisibility = '', this.birthdayBalloonsEnabled = false, this.gender = '', this.createdAt, this.followersCount = 0, this.followingCount = 0, this.postsCount = 0, this.points = 0, this.experience = 0, this.levelEnabled = false, this.isPremium = false, this.premiumUntil, this.hideProfileFromMinors = false, this.profileMinimumAge, this.profileMaximumAge, this.onlineStatus = '', this.onlineStatusVisibility = '', this.questionsEnabled = false, this.giftsEnabled = false, this.showLikedPosts = false, this.showReadReceipts = false, this.directMessagesEnabled = false, this.dmRequestPolicy = '', this.showR18Content = false, this.showHiddenPosts = false, this.showBotAccounts = false, this.showParodyAccounts = false, this.showReactions = false, this.showRepliesInTimeline = false, this.showRekarotsInTimeline = false, this.hideUnfollowedRekarotsInTimeline = false,  List<String> mutedKeywords = const [], this.defaultExcludeReplyTargets = false, this.notifyLikes = false, this.notifyReplies = false, this.notifyRekarots = false, this.notifyQuotes = false, this.notifyMentions = false, this.notifyFollows = false, this.notifyReactions = false, this.notifyDMs = false, this.notifyBoardActivity = false, this.notifyNewsOnLaunch = false, this.notificationMuteNewAccounts = false, this.notificationMuteNoAvatar = false, this.notificationMuteNonFollowers = false, this.notificationMuteNonFollowing = false, this.legalQuizPassed = false, this.legalNoticeSeenVersion, this.cardAccentColor, this.profileAccentColor, this.premiumBadgeColor = '',  List<String> subscriptionBadgeColors = const [], this.subscriptionPlan = '', this.subscriptionStatus = '', this.subscriptionActiveUntil, this.subscriptionCancelAtPeriodEnd = false, this.showCardDecoration = false, this.showProfileDecoration = false, this.showSubscriptionBadges = false, this.showGreenBadge = false, this.showPlusBadge = false, this.showProBadge = false, this.showRedBadge = false}): _linkedOAuthProviders = linkedOAuthProviders,_officialMark = officialMark,_mutedKeywords = mutedKeywords,_subscriptionBadgeColors = subscriptionBadgeColors;
  factory _AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);

@override final  int id;
@override final  String username;
@override final  String displayName;
@override final  String? avatarUrl;
@override final  int? avatarFrameId;
@override final  String? headerUrl;
@override final  String? bio;
@override final  String? location;
@override final  String? websiteUrl;
@override final  String? statusMessage;
@override final  String? email;
@override@JsonKey() final  bool emailVerified;
/// メールアドレスのハッシュ。アバターの生成などに使われる。
@override@JsonKey() final  String emailHash;
@override@JsonKey() final  bool hasPassword;
@override@JsonKey() final  bool twoFactorEnabled;
 final  List<String> _linkedOAuthProviders;
@override@JsonKey() List<String> get linkedOAuthProviders {
  if (_linkedOAuthProviders is EqualUnmodifiableListView) return _linkedOAuthProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_linkedOAuthProviders);
}

@override@JsonKey() final  bool isPrivate;
@override@JsonKey() final  bool isBotAccount;
@override@JsonKey() final  bool isParodyAccount;
@override@JsonKey() final  bool adminForceParody;
@override@JsonKey() final  bool adminForceBot;
@override@JsonKey() final  bool adminForceR18;
@override@JsonKey() final  bool adminForceHidden;
@override final  int? adminForceProfileMinimumAge;
@override final  int? adminForceProfileMaximumAge;
 final  List<OfficialMark> _officialMark;
@override@JsonKey()@OfficialMarkListConverter() List<OfficialMark> get officialMark {
  if (_officialMark is EqualUnmodifiableListView) return _officialMark;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_officialMark);
}

@override@JsonKey() final  bool isAdmin;
@override@JsonKey() final  bool isBanned;
@override@JsonKey() final  bool isRestricted;
@override final  String? banReason;
@override final  DateTime? bannedUntil;
@override final  DateTime? birthday;
@override final  String? displayBirthday;
@override@JsonKey() final  String birthdayVisibility;
@override@JsonKey() final  bool birthdayBalloonsEnabled;
@override@JsonKey() final  String gender;
@override final  DateTime? createdAt;
@override@JsonKey() final  int followersCount;
@override@JsonKey() final  int followingCount;
@override@JsonKey() final  int postsCount;
@override@JsonKey() final  int points;
@override@JsonKey() final  int experience;
@override@JsonKey() final  bool levelEnabled;
@override@JsonKey() final  bool isPremium;
@override final  DateTime? premiumUntil;
@override@JsonKey() final  bool hideProfileFromMinors;
@override final  int? profileMinimumAge;
@override final  int? profileMaximumAge;
@override@JsonKey() final  String onlineStatus;
@override@JsonKey() final  String onlineStatusVisibility;
@override@JsonKey() final  bool questionsEnabled;
@override@JsonKey() final  bool giftsEnabled;
@override@JsonKey() final  bool showLikedPosts;
@override@JsonKey() final  bool showReadReceipts;
@override@JsonKey() final  bool directMessagesEnabled;
/// 誰から DM を受けるか。`EVERYONE` / `FOLLOWING` など。
@override@JsonKey() final  String dmRequestPolicy;
@override@JsonKey() final  bool showR18Content;
@override@JsonKey() final  bool showHiddenPosts;
@override@JsonKey() final  bool showBotAccounts;
@override@JsonKey() final  bool showParodyAccounts;
@override@JsonKey() final  bool showReactions;
@override@JsonKey() final  bool showRepliesInTimeline;
@override@JsonKey() final  bool showRekarotsInTimeline;
@override@JsonKey() final  bool hideUnfollowedRekarotsInTimeline;
 final  List<String> _mutedKeywords;
@override@JsonKey() List<String> get mutedKeywords {
  if (_mutedKeywords is EqualUnmodifiableListView) return _mutedKeywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mutedKeywords);
}

@override@JsonKey() final  bool defaultExcludeReplyTargets;
@override@JsonKey() final  bool notifyLikes;
@override@JsonKey() final  bool notifyReplies;
@override@JsonKey() final  bool notifyRekarots;
@override@JsonKey() final  bool notifyQuotes;
@override@JsonKey() final  bool notifyMentions;
@override@JsonKey() final  bool notifyFollows;
@override@JsonKey() final  bool notifyReactions;
@override@JsonKey() final  bool notifyDMs;
@override@JsonKey() final  bool notifyBoardActivity;
@override@JsonKey() final  bool notifyNewsOnLaunch;
@override@JsonKey() final  bool notificationMuteNewAccounts;
@override@JsonKey() final  bool notificationMuteNoAvatar;
@override@JsonKey() final  bool notificationMuteNonFollowers;
@override@JsonKey() final  bool notificationMuteNonFollowing;
@override@JsonKey() final  bool legalQuizPassed;
/// 最後に読んだ利用規約のバージョン。文字列で比較される。
@override final  String? legalNoticeSeenVersion;
@override final  String? cardAccentColor;
@override final  String? profileAccentColor;
@override@JsonKey() final  String premiumBadgeColor;
 final  List<String> _subscriptionBadgeColors;
@override@JsonKey() List<String> get subscriptionBadgeColors {
  if (_subscriptionBadgeColors is EqualUnmodifiableListView) return _subscriptionBadgeColors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subscriptionBadgeColors);
}

@override@JsonKey() final  String subscriptionPlan;
@override@JsonKey() final  String subscriptionStatus;
@override final  DateTime? subscriptionActiveUntil;
@override@JsonKey() final  bool subscriptionCancelAtPeriodEnd;
@override@JsonKey() final  bool showCardDecoration;
@override@JsonKey() final  bool showProfileDecoration;
@override@JsonKey() final  bool showSubscriptionBadges;
@override@JsonKey() final  bool showGreenBadge;
@override@JsonKey() final  bool showPlusBadge;
@override@JsonKey() final  bool showProBadge;
@override@JsonKey() final  bool showRedBadge;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarFrameId, avatarFrameId) || other.avatarFrameId == avatarFrameId)&&(identical(other.headerUrl, headerUrl) || other.headerUrl == headerUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.location, location) || other.location == location)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.emailHash, emailHash) || other.emailHash == emailHash)&&(identical(other.hasPassword, hasPassword) || other.hasPassword == hasPassword)&&(identical(other.twoFactorEnabled, twoFactorEnabled) || other.twoFactorEnabled == twoFactorEnabled)&&const DeepCollectionEquality().equals(other._linkedOAuthProviders, _linkedOAuthProviders)&&(identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate)&&(identical(other.isBotAccount, isBotAccount) || other.isBotAccount == isBotAccount)&&(identical(other.isParodyAccount, isParodyAccount) || other.isParodyAccount == isParodyAccount)&&(identical(other.adminForceParody, adminForceParody) || other.adminForceParody == adminForceParody)&&(identical(other.adminForceBot, adminForceBot) || other.adminForceBot == adminForceBot)&&(identical(other.adminForceR18, adminForceR18) || other.adminForceR18 == adminForceR18)&&(identical(other.adminForceHidden, adminForceHidden) || other.adminForceHidden == adminForceHidden)&&(identical(other.adminForceProfileMinimumAge, adminForceProfileMinimumAge) || other.adminForceProfileMinimumAge == adminForceProfileMinimumAge)&&(identical(other.adminForceProfileMaximumAge, adminForceProfileMaximumAge) || other.adminForceProfileMaximumAge == adminForceProfileMaximumAge)&&const DeepCollectionEquality().equals(other._officialMark, _officialMark)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.isRestricted, isRestricted) || other.isRestricted == isRestricted)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.bannedUntil, bannedUntil) || other.bannedUntil == bannedUntil)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.displayBirthday, displayBirthday) || other.displayBirthday == displayBirthday)&&(identical(other.birthdayVisibility, birthdayVisibility) || other.birthdayVisibility == birthdayVisibility)&&(identical(other.birthdayBalloonsEnabled, birthdayBalloonsEnabled) || other.birthdayBalloonsEnabled == birthdayBalloonsEnabled)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.followersCount, followersCount) || other.followersCount == followersCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.postsCount, postsCount) || other.postsCount == postsCount)&&(identical(other.points, points) || other.points == points)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.levelEnabled, levelEnabled) || other.levelEnabled == levelEnabled)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.premiumUntil, premiumUntil) || other.premiumUntil == premiumUntil)&&(identical(other.hideProfileFromMinors, hideProfileFromMinors) || other.hideProfileFromMinors == hideProfileFromMinors)&&(identical(other.profileMinimumAge, profileMinimumAge) || other.profileMinimumAge == profileMinimumAge)&&(identical(other.profileMaximumAge, profileMaximumAge) || other.profileMaximumAge == profileMaximumAge)&&(identical(other.onlineStatus, onlineStatus) || other.onlineStatus == onlineStatus)&&(identical(other.onlineStatusVisibility, onlineStatusVisibility) || other.onlineStatusVisibility == onlineStatusVisibility)&&(identical(other.questionsEnabled, questionsEnabled) || other.questionsEnabled == questionsEnabled)&&(identical(other.giftsEnabled, giftsEnabled) || other.giftsEnabled == giftsEnabled)&&(identical(other.showLikedPosts, showLikedPosts) || other.showLikedPosts == showLikedPosts)&&(identical(other.showReadReceipts, showReadReceipts) || other.showReadReceipts == showReadReceipts)&&(identical(other.directMessagesEnabled, directMessagesEnabled) || other.directMessagesEnabled == directMessagesEnabled)&&(identical(other.dmRequestPolicy, dmRequestPolicy) || other.dmRequestPolicy == dmRequestPolicy)&&(identical(other.showR18Content, showR18Content) || other.showR18Content == showR18Content)&&(identical(other.showHiddenPosts, showHiddenPosts) || other.showHiddenPosts == showHiddenPosts)&&(identical(other.showBotAccounts, showBotAccounts) || other.showBotAccounts == showBotAccounts)&&(identical(other.showParodyAccounts, showParodyAccounts) || other.showParodyAccounts == showParodyAccounts)&&(identical(other.showReactions, showReactions) || other.showReactions == showReactions)&&(identical(other.showRepliesInTimeline, showRepliesInTimeline) || other.showRepliesInTimeline == showRepliesInTimeline)&&(identical(other.showRekarotsInTimeline, showRekarotsInTimeline) || other.showRekarotsInTimeline == showRekarotsInTimeline)&&(identical(other.hideUnfollowedRekarotsInTimeline, hideUnfollowedRekarotsInTimeline) || other.hideUnfollowedRekarotsInTimeline == hideUnfollowedRekarotsInTimeline)&&const DeepCollectionEquality().equals(other._mutedKeywords, _mutedKeywords)&&(identical(other.defaultExcludeReplyTargets, defaultExcludeReplyTargets) || other.defaultExcludeReplyTargets == defaultExcludeReplyTargets)&&(identical(other.notifyLikes, notifyLikes) || other.notifyLikes == notifyLikes)&&(identical(other.notifyReplies, notifyReplies) || other.notifyReplies == notifyReplies)&&(identical(other.notifyRekarots, notifyRekarots) || other.notifyRekarots == notifyRekarots)&&(identical(other.notifyQuotes, notifyQuotes) || other.notifyQuotes == notifyQuotes)&&(identical(other.notifyMentions, notifyMentions) || other.notifyMentions == notifyMentions)&&(identical(other.notifyFollows, notifyFollows) || other.notifyFollows == notifyFollows)&&(identical(other.notifyReactions, notifyReactions) || other.notifyReactions == notifyReactions)&&(identical(other.notifyDMs, notifyDMs) || other.notifyDMs == notifyDMs)&&(identical(other.notifyBoardActivity, notifyBoardActivity) || other.notifyBoardActivity == notifyBoardActivity)&&(identical(other.notifyNewsOnLaunch, notifyNewsOnLaunch) || other.notifyNewsOnLaunch == notifyNewsOnLaunch)&&(identical(other.notificationMuteNewAccounts, notificationMuteNewAccounts) || other.notificationMuteNewAccounts == notificationMuteNewAccounts)&&(identical(other.notificationMuteNoAvatar, notificationMuteNoAvatar) || other.notificationMuteNoAvatar == notificationMuteNoAvatar)&&(identical(other.notificationMuteNonFollowers, notificationMuteNonFollowers) || other.notificationMuteNonFollowers == notificationMuteNonFollowers)&&(identical(other.notificationMuteNonFollowing, notificationMuteNonFollowing) || other.notificationMuteNonFollowing == notificationMuteNonFollowing)&&(identical(other.legalQuizPassed, legalQuizPassed) || other.legalQuizPassed == legalQuizPassed)&&(identical(other.legalNoticeSeenVersion, legalNoticeSeenVersion) || other.legalNoticeSeenVersion == legalNoticeSeenVersion)&&(identical(other.cardAccentColor, cardAccentColor) || other.cardAccentColor == cardAccentColor)&&(identical(other.profileAccentColor, profileAccentColor) || other.profileAccentColor == profileAccentColor)&&(identical(other.premiumBadgeColor, premiumBadgeColor) || other.premiumBadgeColor == premiumBadgeColor)&&const DeepCollectionEquality().equals(other._subscriptionBadgeColors, _subscriptionBadgeColors)&&(identical(other.subscriptionPlan, subscriptionPlan) || other.subscriptionPlan == subscriptionPlan)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.subscriptionActiveUntil, subscriptionActiveUntil) || other.subscriptionActiveUntil == subscriptionActiveUntil)&&(identical(other.subscriptionCancelAtPeriodEnd, subscriptionCancelAtPeriodEnd) || other.subscriptionCancelAtPeriodEnd == subscriptionCancelAtPeriodEnd)&&(identical(other.showCardDecoration, showCardDecoration) || other.showCardDecoration == showCardDecoration)&&(identical(other.showProfileDecoration, showProfileDecoration) || other.showProfileDecoration == showProfileDecoration)&&(identical(other.showSubscriptionBadges, showSubscriptionBadges) || other.showSubscriptionBadges == showSubscriptionBadges)&&(identical(other.showGreenBadge, showGreenBadge) || other.showGreenBadge == showGreenBadge)&&(identical(other.showPlusBadge, showPlusBadge) || other.showPlusBadge == showPlusBadge)&&(identical(other.showProBadge, showProBadge) || other.showProBadge == showProBadge)&&(identical(other.showRedBadge, showRedBadge) || other.showRedBadge == showRedBadge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,username,displayName,avatarUrl,avatarFrameId,headerUrl,bio,location,websiteUrl,statusMessage,email,emailVerified,emailHash,hasPassword,twoFactorEnabled,const DeepCollectionEquality().hash(_linkedOAuthProviders),isPrivate,isBotAccount,isParodyAccount,adminForceParody,adminForceBot,adminForceR18,adminForceHidden,adminForceProfileMinimumAge,adminForceProfileMaximumAge,const DeepCollectionEquality().hash(_officialMark),isAdmin,isBanned,isRestricted,banReason,bannedUntil,birthday,displayBirthday,birthdayVisibility,birthdayBalloonsEnabled,gender,createdAt,followersCount,followingCount,postsCount,points,experience,levelEnabled,isPremium,premiumUntil,hideProfileFromMinors,profileMinimumAge,profileMaximumAge,onlineStatus,onlineStatusVisibility,questionsEnabled,giftsEnabled,showLikedPosts,showReadReceipts,directMessagesEnabled,dmRequestPolicy,showR18Content,showHiddenPosts,showBotAccounts,showParodyAccounts,showReactions,showRepliesInTimeline,showRekarotsInTimeline,hideUnfollowedRekarotsInTimeline,const DeepCollectionEquality().hash(_mutedKeywords),defaultExcludeReplyTargets,notifyLikes,notifyReplies,notifyRekarots,notifyQuotes,notifyMentions,notifyFollows,notifyReactions,notifyDMs,notifyBoardActivity,notifyNewsOnLaunch,notificationMuteNewAccounts,notificationMuteNoAvatar,notificationMuteNonFollowers,notificationMuteNonFollowing,legalQuizPassed,legalNoticeSeenVersion,cardAccentColor,profileAccentColor,premiumBadgeColor,const DeepCollectionEquality().hash(_subscriptionBadgeColors),subscriptionPlan,subscriptionStatus,subscriptionActiveUntil,subscriptionCancelAtPeriodEnd,showCardDecoration,showProfileDecoration,showSubscriptionBadges,showGreenBadge,showPlusBadge,showProBadge,showRedBadge]);

@override
String toString() {
  return 'AuthUser(id: $id, username: $username, displayName: $displayName, avatarUrl: $avatarUrl, avatarFrameId: $avatarFrameId, headerUrl: $headerUrl, bio: $bio, location: $location, websiteUrl: $websiteUrl, statusMessage: $statusMessage, email: $email, emailVerified: $emailVerified, emailHash: $emailHash, hasPassword: $hasPassword, twoFactorEnabled: $twoFactorEnabled, linkedOAuthProviders: $linkedOAuthProviders, isPrivate: $isPrivate, isBotAccount: $isBotAccount, isParodyAccount: $isParodyAccount, adminForceParody: $adminForceParody, adminForceBot: $adminForceBot, adminForceR18: $adminForceR18, adminForceHidden: $adminForceHidden, adminForceProfileMinimumAge: $adminForceProfileMinimumAge, adminForceProfileMaximumAge: $adminForceProfileMaximumAge, officialMark: $officialMark, isAdmin: $isAdmin, isBanned: $isBanned, isRestricted: $isRestricted, banReason: $banReason, bannedUntil: $bannedUntil, birthday: $birthday, displayBirthday: $displayBirthday, birthdayVisibility: $birthdayVisibility, birthdayBalloonsEnabled: $birthdayBalloonsEnabled, gender: $gender, createdAt: $createdAt, followersCount: $followersCount, followingCount: $followingCount, postsCount: $postsCount, points: $points, experience: $experience, levelEnabled: $levelEnabled, isPremium: $isPremium, premiumUntil: $premiumUntil, hideProfileFromMinors: $hideProfileFromMinors, profileMinimumAge: $profileMinimumAge, profileMaximumAge: $profileMaximumAge, onlineStatus: $onlineStatus, onlineStatusVisibility: $onlineStatusVisibility, questionsEnabled: $questionsEnabled, giftsEnabled: $giftsEnabled, showLikedPosts: $showLikedPosts, showReadReceipts: $showReadReceipts, directMessagesEnabled: $directMessagesEnabled, dmRequestPolicy: $dmRequestPolicy, showR18Content: $showR18Content, showHiddenPosts: $showHiddenPosts, showBotAccounts: $showBotAccounts, showParodyAccounts: $showParodyAccounts, showReactions: $showReactions, showRepliesInTimeline: $showRepliesInTimeline, showRekarotsInTimeline: $showRekarotsInTimeline, hideUnfollowedRekarotsInTimeline: $hideUnfollowedRekarotsInTimeline, mutedKeywords: $mutedKeywords, defaultExcludeReplyTargets: $defaultExcludeReplyTargets, notifyLikes: $notifyLikes, notifyReplies: $notifyReplies, notifyRekarots: $notifyRekarots, notifyQuotes: $notifyQuotes, notifyMentions: $notifyMentions, notifyFollows: $notifyFollows, notifyReactions: $notifyReactions, notifyDMs: $notifyDMs, notifyBoardActivity: $notifyBoardActivity, notifyNewsOnLaunch: $notifyNewsOnLaunch, notificationMuteNewAccounts: $notificationMuteNewAccounts, notificationMuteNoAvatar: $notificationMuteNoAvatar, notificationMuteNonFollowers: $notificationMuteNonFollowers, notificationMuteNonFollowing: $notificationMuteNonFollowing, legalQuizPassed: $legalQuizPassed, legalNoticeSeenVersion: $legalNoticeSeenVersion, cardAccentColor: $cardAccentColor, profileAccentColor: $profileAccentColor, premiumBadgeColor: $premiumBadgeColor, subscriptionBadgeColors: $subscriptionBadgeColors, subscriptionPlan: $subscriptionPlan, subscriptionStatus: $subscriptionStatus, subscriptionActiveUntil: $subscriptionActiveUntil, subscriptionCancelAtPeriodEnd: $subscriptionCancelAtPeriodEnd, showCardDecoration: $showCardDecoration, showProfileDecoration: $showProfileDecoration, showSubscriptionBadges: $showSubscriptionBadges, showGreenBadge: $showGreenBadge, showPlusBadge: $showPlusBadge, showProBadge: $showProBadge, showRedBadge: $showRedBadge)';
}


}

/// @nodoc
abstract mixin class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) _then) = __$AuthUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String displayName, String? avatarUrl, int? avatarFrameId, String? headerUrl, String? bio, String? location, String? websiteUrl, String? statusMessage, String? email, bool emailVerified, String emailHash, bool hasPassword, bool twoFactorEnabled, List<String> linkedOAuthProviders, bool isPrivate, bool isBotAccount, bool isParodyAccount, bool adminForceParody, bool adminForceBot, bool adminForceR18, bool adminForceHidden, int? adminForceProfileMinimumAge, int? adminForceProfileMaximumAge,@OfficialMarkListConverter() List<OfficialMark> officialMark, bool isAdmin, bool isBanned, bool isRestricted, String? banReason, DateTime? bannedUntil, DateTime? birthday, String? displayBirthday, String birthdayVisibility, bool birthdayBalloonsEnabled, String gender, DateTime? createdAt, int followersCount, int followingCount, int postsCount, int points, int experience, bool levelEnabled, bool isPremium, DateTime? premiumUntil, bool hideProfileFromMinors, int? profileMinimumAge, int? profileMaximumAge, String onlineStatus, String onlineStatusVisibility, bool questionsEnabled, bool giftsEnabled, bool showLikedPosts, bool showReadReceipts, bool directMessagesEnabled, String dmRequestPolicy, bool showR18Content, bool showHiddenPosts, bool showBotAccounts, bool showParodyAccounts, bool showReactions, bool showRepliesInTimeline, bool showRekarotsInTimeline, bool hideUnfollowedRekarotsInTimeline, List<String> mutedKeywords, bool defaultExcludeReplyTargets, bool notifyLikes, bool notifyReplies, bool notifyRekarots, bool notifyQuotes, bool notifyMentions, bool notifyFollows, bool notifyReactions, bool notifyDMs, bool notifyBoardActivity, bool notifyNewsOnLaunch, bool notificationMuteNewAccounts, bool notificationMuteNoAvatar, bool notificationMuteNonFollowers, bool notificationMuteNonFollowing, bool legalQuizPassed, String? legalNoticeSeenVersion, String? cardAccentColor, String? profileAccentColor, String premiumBadgeColor, List<String> subscriptionBadgeColors, String subscriptionPlan, String subscriptionStatus, DateTime? subscriptionActiveUntil, bool subscriptionCancelAtPeriodEnd, bool showCardDecoration, bool showProfileDecoration, bool showSubscriptionBadges, bool showGreenBadge, bool showPlusBadge, bool showProBadge, bool showRedBadge
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? displayName = null,Object? avatarUrl = freezed,Object? avatarFrameId = freezed,Object? headerUrl = freezed,Object? bio = freezed,Object? location = freezed,Object? websiteUrl = freezed,Object? statusMessage = freezed,Object? email = freezed,Object? emailVerified = null,Object? emailHash = null,Object? hasPassword = null,Object? twoFactorEnabled = null,Object? linkedOAuthProviders = null,Object? isPrivate = null,Object? isBotAccount = null,Object? isParodyAccount = null,Object? adminForceParody = null,Object? adminForceBot = null,Object? adminForceR18 = null,Object? adminForceHidden = null,Object? adminForceProfileMinimumAge = freezed,Object? adminForceProfileMaximumAge = freezed,Object? officialMark = null,Object? isAdmin = null,Object? isBanned = null,Object? isRestricted = null,Object? banReason = freezed,Object? bannedUntil = freezed,Object? birthday = freezed,Object? displayBirthday = freezed,Object? birthdayVisibility = null,Object? birthdayBalloonsEnabled = null,Object? gender = null,Object? createdAt = freezed,Object? followersCount = null,Object? followingCount = null,Object? postsCount = null,Object? points = null,Object? experience = null,Object? levelEnabled = null,Object? isPremium = null,Object? premiumUntil = freezed,Object? hideProfileFromMinors = null,Object? profileMinimumAge = freezed,Object? profileMaximumAge = freezed,Object? onlineStatus = null,Object? onlineStatusVisibility = null,Object? questionsEnabled = null,Object? giftsEnabled = null,Object? showLikedPosts = null,Object? showReadReceipts = null,Object? directMessagesEnabled = null,Object? dmRequestPolicy = null,Object? showR18Content = null,Object? showHiddenPosts = null,Object? showBotAccounts = null,Object? showParodyAccounts = null,Object? showReactions = null,Object? showRepliesInTimeline = null,Object? showRekarotsInTimeline = null,Object? hideUnfollowedRekarotsInTimeline = null,Object? mutedKeywords = null,Object? defaultExcludeReplyTargets = null,Object? notifyLikes = null,Object? notifyReplies = null,Object? notifyRekarots = null,Object? notifyQuotes = null,Object? notifyMentions = null,Object? notifyFollows = null,Object? notifyReactions = null,Object? notifyDMs = null,Object? notifyBoardActivity = null,Object? notifyNewsOnLaunch = null,Object? notificationMuteNewAccounts = null,Object? notificationMuteNoAvatar = null,Object? notificationMuteNonFollowers = null,Object? notificationMuteNonFollowing = null,Object? legalQuizPassed = null,Object? legalNoticeSeenVersion = freezed,Object? cardAccentColor = freezed,Object? profileAccentColor = freezed,Object? premiumBadgeColor = null,Object? subscriptionBadgeColors = null,Object? subscriptionPlan = null,Object? subscriptionStatus = null,Object? subscriptionActiveUntil = freezed,Object? subscriptionCancelAtPeriodEnd = null,Object? showCardDecoration = null,Object? showProfileDecoration = null,Object? showSubscriptionBadges = null,Object? showGreenBadge = null,Object? showPlusBadge = null,Object? showProBadge = null,Object? showRedBadge = null,}) {
  return _then(_AuthUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarFrameId: freezed == avatarFrameId ? _self.avatarFrameId : avatarFrameId // ignore: cast_nullable_to_non_nullable
as int?,headerUrl: freezed == headerUrl ? _self.headerUrl : headerUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,statusMessage: freezed == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,emailHash: null == emailHash ? _self.emailHash : emailHash // ignore: cast_nullable_to_non_nullable
as String,hasPassword: null == hasPassword ? _self.hasPassword : hasPassword // ignore: cast_nullable_to_non_nullable
as bool,twoFactorEnabled: null == twoFactorEnabled ? _self.twoFactorEnabled : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
as bool,linkedOAuthProviders: null == linkedOAuthProviders ? _self._linkedOAuthProviders : linkedOAuthProviders // ignore: cast_nullable_to_non_nullable
as List<String>,isPrivate: null == isPrivate ? _self.isPrivate : isPrivate // ignore: cast_nullable_to_non_nullable
as bool,isBotAccount: null == isBotAccount ? _self.isBotAccount : isBotAccount // ignore: cast_nullable_to_non_nullable
as bool,isParodyAccount: null == isParodyAccount ? _self.isParodyAccount : isParodyAccount // ignore: cast_nullable_to_non_nullable
as bool,adminForceParody: null == adminForceParody ? _self.adminForceParody : adminForceParody // ignore: cast_nullable_to_non_nullable
as bool,adminForceBot: null == adminForceBot ? _self.adminForceBot : adminForceBot // ignore: cast_nullable_to_non_nullable
as bool,adminForceR18: null == adminForceR18 ? _self.adminForceR18 : adminForceR18 // ignore: cast_nullable_to_non_nullable
as bool,adminForceHidden: null == adminForceHidden ? _self.adminForceHidden : adminForceHidden // ignore: cast_nullable_to_non_nullable
as bool,adminForceProfileMinimumAge: freezed == adminForceProfileMinimumAge ? _self.adminForceProfileMinimumAge : adminForceProfileMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,adminForceProfileMaximumAge: freezed == adminForceProfileMaximumAge ? _self.adminForceProfileMaximumAge : adminForceProfileMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,officialMark: null == officialMark ? _self._officialMark : officialMark // ignore: cast_nullable_to_non_nullable
as List<OfficialMark>,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,isRestricted: null == isRestricted ? _self.isRestricted : isRestricted // ignore: cast_nullable_to_non_nullable
as bool,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,bannedUntil: freezed == bannedUntil ? _self.bannedUntil : bannedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,displayBirthday: freezed == displayBirthday ? _self.displayBirthday : displayBirthday // ignore: cast_nullable_to_non_nullable
as String?,birthdayVisibility: null == birthdayVisibility ? _self.birthdayVisibility : birthdayVisibility // ignore: cast_nullable_to_non_nullable
as String,birthdayBalloonsEnabled: null == birthdayBalloonsEnabled ? _self.birthdayBalloonsEnabled : birthdayBalloonsEnabled // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,followersCount: null == followersCount ? _self.followersCount : followersCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,postsCount: null == postsCount ? _self.postsCount : postsCount // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int,levelEnabled: null == levelEnabled ? _self.levelEnabled : levelEnabled // ignore: cast_nullable_to_non_nullable
as bool,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,premiumUntil: freezed == premiumUntil ? _self.premiumUntil : premiumUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,hideProfileFromMinors: null == hideProfileFromMinors ? _self.hideProfileFromMinors : hideProfileFromMinors // ignore: cast_nullable_to_non_nullable
as bool,profileMinimumAge: freezed == profileMinimumAge ? _self.profileMinimumAge : profileMinimumAge // ignore: cast_nullable_to_non_nullable
as int?,profileMaximumAge: freezed == profileMaximumAge ? _self.profileMaximumAge : profileMaximumAge // ignore: cast_nullable_to_non_nullable
as int?,onlineStatus: null == onlineStatus ? _self.onlineStatus : onlineStatus // ignore: cast_nullable_to_non_nullable
as String,onlineStatusVisibility: null == onlineStatusVisibility ? _self.onlineStatusVisibility : onlineStatusVisibility // ignore: cast_nullable_to_non_nullable
as String,questionsEnabled: null == questionsEnabled ? _self.questionsEnabled : questionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,giftsEnabled: null == giftsEnabled ? _self.giftsEnabled : giftsEnabled // ignore: cast_nullable_to_non_nullable
as bool,showLikedPosts: null == showLikedPosts ? _self.showLikedPosts : showLikedPosts // ignore: cast_nullable_to_non_nullable
as bool,showReadReceipts: null == showReadReceipts ? _self.showReadReceipts : showReadReceipts // ignore: cast_nullable_to_non_nullable
as bool,directMessagesEnabled: null == directMessagesEnabled ? _self.directMessagesEnabled : directMessagesEnabled // ignore: cast_nullable_to_non_nullable
as bool,dmRequestPolicy: null == dmRequestPolicy ? _self.dmRequestPolicy : dmRequestPolicy // ignore: cast_nullable_to_non_nullable
as String,showR18Content: null == showR18Content ? _self.showR18Content : showR18Content // ignore: cast_nullable_to_non_nullable
as bool,showHiddenPosts: null == showHiddenPosts ? _self.showHiddenPosts : showHiddenPosts // ignore: cast_nullable_to_non_nullable
as bool,showBotAccounts: null == showBotAccounts ? _self.showBotAccounts : showBotAccounts // ignore: cast_nullable_to_non_nullable
as bool,showParodyAccounts: null == showParodyAccounts ? _self.showParodyAccounts : showParodyAccounts // ignore: cast_nullable_to_non_nullable
as bool,showReactions: null == showReactions ? _self.showReactions : showReactions // ignore: cast_nullable_to_non_nullable
as bool,showRepliesInTimeline: null == showRepliesInTimeline ? _self.showRepliesInTimeline : showRepliesInTimeline // ignore: cast_nullable_to_non_nullable
as bool,showRekarotsInTimeline: null == showRekarotsInTimeline ? _self.showRekarotsInTimeline : showRekarotsInTimeline // ignore: cast_nullable_to_non_nullable
as bool,hideUnfollowedRekarotsInTimeline: null == hideUnfollowedRekarotsInTimeline ? _self.hideUnfollowedRekarotsInTimeline : hideUnfollowedRekarotsInTimeline // ignore: cast_nullable_to_non_nullable
as bool,mutedKeywords: null == mutedKeywords ? _self._mutedKeywords : mutedKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,defaultExcludeReplyTargets: null == defaultExcludeReplyTargets ? _self.defaultExcludeReplyTargets : defaultExcludeReplyTargets // ignore: cast_nullable_to_non_nullable
as bool,notifyLikes: null == notifyLikes ? _self.notifyLikes : notifyLikes // ignore: cast_nullable_to_non_nullable
as bool,notifyReplies: null == notifyReplies ? _self.notifyReplies : notifyReplies // ignore: cast_nullable_to_non_nullable
as bool,notifyRekarots: null == notifyRekarots ? _self.notifyRekarots : notifyRekarots // ignore: cast_nullable_to_non_nullable
as bool,notifyQuotes: null == notifyQuotes ? _self.notifyQuotes : notifyQuotes // ignore: cast_nullable_to_non_nullable
as bool,notifyMentions: null == notifyMentions ? _self.notifyMentions : notifyMentions // ignore: cast_nullable_to_non_nullable
as bool,notifyFollows: null == notifyFollows ? _self.notifyFollows : notifyFollows // ignore: cast_nullable_to_non_nullable
as bool,notifyReactions: null == notifyReactions ? _self.notifyReactions : notifyReactions // ignore: cast_nullable_to_non_nullable
as bool,notifyDMs: null == notifyDMs ? _self.notifyDMs : notifyDMs // ignore: cast_nullable_to_non_nullable
as bool,notifyBoardActivity: null == notifyBoardActivity ? _self.notifyBoardActivity : notifyBoardActivity // ignore: cast_nullable_to_non_nullable
as bool,notifyNewsOnLaunch: null == notifyNewsOnLaunch ? _self.notifyNewsOnLaunch : notifyNewsOnLaunch // ignore: cast_nullable_to_non_nullable
as bool,notificationMuteNewAccounts: null == notificationMuteNewAccounts ? _self.notificationMuteNewAccounts : notificationMuteNewAccounts // ignore: cast_nullable_to_non_nullable
as bool,notificationMuteNoAvatar: null == notificationMuteNoAvatar ? _self.notificationMuteNoAvatar : notificationMuteNoAvatar // ignore: cast_nullable_to_non_nullable
as bool,notificationMuteNonFollowers: null == notificationMuteNonFollowers ? _self.notificationMuteNonFollowers : notificationMuteNonFollowers // ignore: cast_nullable_to_non_nullable
as bool,notificationMuteNonFollowing: null == notificationMuteNonFollowing ? _self.notificationMuteNonFollowing : notificationMuteNonFollowing // ignore: cast_nullable_to_non_nullable
as bool,legalQuizPassed: null == legalQuizPassed ? _self.legalQuizPassed : legalQuizPassed // ignore: cast_nullable_to_non_nullable
as bool,legalNoticeSeenVersion: freezed == legalNoticeSeenVersion ? _self.legalNoticeSeenVersion : legalNoticeSeenVersion // ignore: cast_nullable_to_non_nullable
as String?,cardAccentColor: freezed == cardAccentColor ? _self.cardAccentColor : cardAccentColor // ignore: cast_nullable_to_non_nullable
as String?,profileAccentColor: freezed == profileAccentColor ? _self.profileAccentColor : profileAccentColor // ignore: cast_nullable_to_non_nullable
as String?,premiumBadgeColor: null == premiumBadgeColor ? _self.premiumBadgeColor : premiumBadgeColor // ignore: cast_nullable_to_non_nullable
as String,subscriptionBadgeColors: null == subscriptionBadgeColors ? _self._subscriptionBadgeColors : subscriptionBadgeColors // ignore: cast_nullable_to_non_nullable
as List<String>,subscriptionPlan: null == subscriptionPlan ? _self.subscriptionPlan : subscriptionPlan // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionActiveUntil: freezed == subscriptionActiveUntil ? _self.subscriptionActiveUntil : subscriptionActiveUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,subscriptionCancelAtPeriodEnd: null == subscriptionCancelAtPeriodEnd ? _self.subscriptionCancelAtPeriodEnd : subscriptionCancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool,showCardDecoration: null == showCardDecoration ? _self.showCardDecoration : showCardDecoration // ignore: cast_nullable_to_non_nullable
as bool,showProfileDecoration: null == showProfileDecoration ? _self.showProfileDecoration : showProfileDecoration // ignore: cast_nullable_to_non_nullable
as bool,showSubscriptionBadges: null == showSubscriptionBadges ? _self.showSubscriptionBadges : showSubscriptionBadges // ignore: cast_nullable_to_non_nullable
as bool,showGreenBadge: null == showGreenBadge ? _self.showGreenBadge : showGreenBadge // ignore: cast_nullable_to_non_nullable
as bool,showPlusBadge: null == showPlusBadge ? _self.showPlusBadge : showPlusBadge // ignore: cast_nullable_to_non_nullable
as bool,showProBadge: null == showProBadge ? _self.showProBadge : showProBadge // ignore: cast_nullable_to_non_nullable
as bool,showRedBadge: null == showRedBadge ? _self.showRedBadge : showRedBadge // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
