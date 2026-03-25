// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostState _$PostStateFromJson(Map<String, dynamic> json) => _PostState(
  id: (json['id'] as num).toInt(),
  rekaroted: json['rekaroted'] as bool,
  rekarotsCount: (json['rekarotsCount'] as num).toInt(),
  liked: json['liked'] as bool,
  likesCount: (json['likesCount'] as num).toInt(),
  bookmarked: json['bookmarked'] as bool,
  bookmarksCount: (json['bookmarksCount'] as num).toInt(),
);

Map<String, dynamic> _$PostStateToJson(_PostState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rekaroted': instance.rekaroted,
      'rekarotsCount': instance.rekarotsCount,
      'liked': instance.liked,
      'likesCount': instance.likesCount,
      'bookmarked': instance.bookmarked,
      'bookmarksCount': instance.bookmarksCount,
    };
