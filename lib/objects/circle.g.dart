// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CircleCountMeta _$CircleCountMetaFromJson(Map<String, dynamic> json) =>
    _CircleCountMeta(
      posts: (json['posts'] as num).toInt(),
      stories: (json['stories'] as num).toInt(),
    );

Map<String, dynamic> _$CircleCountMetaToJson(_CircleCountMeta instance) =>
    <String, dynamic>{'posts': instance.posts, 'stories': instance.stories};

_Circle _$CircleFromJson(Map<String, dynamic> json) => _Circle(
  id: (json['id'] as num).toInt(),
  ownerId: (json['ownerId'] as num).toInt(),
  name: json['name'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  description: json['description'] as String?,
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: CircleCountMeta.fromJson(json['_count'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CircleToJson(_Circle instance) => <String, dynamic>{
  'id': instance.id,
  'ownerId': instance.ownerId,
  'name': instance.name,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'description': instance.description,
  'members': instance.members,
  '_count': instance.meta,
};
