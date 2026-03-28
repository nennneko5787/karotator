// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Author _$AuthorFromJson(Map<String, dynamic> json) => _Author(
  avatarFrameId: (json['avatarFrameId'] as num?)?.toInt(),
  avatarUrl: json['avatarUrl'] as String?,
  displayName: json['displayName'] as String,
  id: (json['id'] as num).toInt(),
  isPrivate: json['isPrivate'] as bool? ?? false,
  isBotAccount: json['isBotAccount'] as bool? ?? false,
  isParodyAccount: json['isParodyAccount'] as bool? ?? false,
  officialMark:
      (json['officialMark'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  username: json['username'] as String,
);

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
  'avatarFrameId': instance.avatarFrameId,
  'avatarUrl': instance.avatarUrl,
  'displayName': instance.displayName,
  'id': instance.id,
  'isPrivate': instance.isPrivate,
  'isBotAccount': instance.isBotAccount,
  'isParodyAccount': instance.isParodyAccount,
  'officialMark': instance.officialMark,
  'username': instance.username,
};

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  avatarUrl: json['avatarUrl'] as String?,
  displayName: json['displayName'] as String,
  id: (json['id'] as num).toInt(),
  email: json['email'] as String?,
  emailVerified: json['emailVerified'] as bool,
  username: json['username'] as String,
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'avatarUrl': instance.avatarUrl,
  'displayName': instance.displayName,
  'id': instance.id,
  'email': instance.email,
  'emailVerified': instance.emailVerified,
  'username': instance.username,
};

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  avatarFrameId: (json['avatarFrameId'] as num?)?.toInt(),
  avatarUrl: json['avatarUrl'] as String?,
  displayName: json['displayName'] as String,
  id: (json['id'] as num).toInt(),
  isPrivate: json['isPrivate'] as bool,
  isBotAccount: json['isBotAccount'] as bool,
  isParodyAccount: json['isParodyAccount'] as bool,
  officialMark: (json['officialMark'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  username: json['username'] as String,
  pinnedPostId: (json['pinnedPostId'] as num?)?.toInt(),
  headerUrl: json['headerUrl'] as String?,
  bio: json['bio'] as String?,
  birthday: json['birthday'] as String?,
  birthdayVisibility: $enumDecode(
    _$BirthdayVisibilityEnumMap,
    json['birthdayVisibility'],
  ),
  birthdayBalloonsEnabled: json['birthdayBalloonsEnabled'] as bool,
  hideProfileFromMinors: json['hideProfileFromMinors'] as bool,
  websiteUrl: json['websiteUrl'] as String?,
  location: json['location'] as String?,
  onlineStatus: $enumDecode(_$OnlineStatusEnumMap, json['onlineStatus']),
  followersCount: (json['followersCount'] as num).toInt(),
  followingCount: (json['followingCount'] as num).toInt(),
  postsCount: (json['postsCount'] as num).toInt(),
  isPremium: json['isPremium'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  userBadges: (json['userBadges'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  age: (json['age'] as num?)?.toInt(),
  badges: (json['badges'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'avatarFrameId': instance.avatarFrameId,
  'avatarUrl': instance.avatarUrl,
  'displayName': instance.displayName,
  'id': instance.id,
  'isPrivate': instance.isPrivate,
  'isBotAccount': instance.isBotAccount,
  'isParodyAccount': instance.isParodyAccount,
  'officialMark': instance.officialMark,
  'username': instance.username,
  'pinnedPostId': instance.pinnedPostId,
  'headerUrl': instance.headerUrl,
  'bio': instance.bio,
  'birthday': instance.birthday,
  'birthdayVisibility':
      _$BirthdayVisibilityEnumMap[instance.birthdayVisibility]!,
  'birthdayBalloonsEnabled': instance.birthdayBalloonsEnabled,
  'hideProfileFromMinors': instance.hideProfileFromMinors,
  'websiteUrl': instance.websiteUrl,
  'location': instance.location,
  'onlineStatus': _$OnlineStatusEnumMap[instance.onlineStatus]!,
  'followersCount': instance.followersCount,
  'followingCount': instance.followingCount,
  'postsCount': instance.postsCount,
  'isPremium': instance.isPremium,
  'createdAt': instance.createdAt.toIso8601String(),
  'userBadges': instance.userBadges,
  'age': instance.age,
  'badges': instance.badges,
};

const _$BirthdayVisibilityEnumMap = {
  BirthdayVisibility.FULL_DATE: 'FULL_DATE',
  BirthdayVisibility.MONTH_DAY: 'MONTH_DAY',
  BirthdayVisibility.PRIVATE: 'PRIVATE',
};

const _$OnlineStatusEnumMap = {
  OnlineStatus.ONLINE: 'ONLINE',
  OnlineStatus.IDLE: 'IDLE',
  OnlineStatus.DND: 'DND',
  OnlineStatus.OFFLINE: 'OFFLINE',
};
