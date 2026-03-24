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
  officialMark: json['officialMark'] as String? ?? "NONE",
  username: json['username'] as String,
);

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
  'avatarFrameId': instance.avatarFrameId,
  'avatarUrl': instance.avatarUrl,
  'displayName': instance.displayName,
  'id': instance.id,
  'isPrivate': instance.isPrivate,
  'officialMark': instance.officialMark,
  'username': instance.username,
};
