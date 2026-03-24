// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendedPagination _$RecommendedPaginationFromJson(
  Map<String, dynamic> json,
) => _RecommendedPagination(
  limit: (json['limit'] as num).toInt(),
  page: (json['page'] as num).toInt(),
);

Map<String, dynamic> _$RecommendedPaginationToJson(
  _RecommendedPagination instance,
) => <String, dynamic>{'limit': instance.limit, 'page': instance.page};

_RecommendedResponse _$RecommendedResponseFromJson(Map<String, dynamic> json) =>
    _RecommendedResponse(
      pagination: RecommendedPagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
      posts: (json['posts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendedResponseToJson(
  _RecommendedResponse instance,
) => <String, dynamic>{
  'pagination': instance.pagination,
  'posts': instance.posts,
};
