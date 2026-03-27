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
  isPrivate: json['isPrivate'] as bool,
  isBotAccount: json['isBotAccount'] as bool,
  isParodyAccount: json['isParodyAccount'] as bool,
  officialMark: json['officialMark'] as String? ?? "NONE",
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
