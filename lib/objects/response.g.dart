// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeLinePagination _$TimeLinePaginationFromJson(Map<String, dynamic> json) =>
    _TimeLinePagination(
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      mode: json['mode'] as String,
    );

Map<String, dynamic> _$TimeLinePaginationToJson(_TimeLinePagination instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'mode': instance.mode,
    };

_RecommendedPagination _$RecommendedPaginationFromJson(
  Map<String, dynamic> json,
) => _RecommendedPagination(
  limit: (json['limit'] as num).toInt(),
  page: (json['page'] as num).toInt(),
);

Map<String, dynamic> _$RecommendedPaginationToJson(
  _RecommendedPagination instance,
) => <String, dynamic>{'limit': instance.limit, 'page': instance.page};

_RecommendedPaginationLatest _$RecommendedPaginationLatestFromJson(
  Map<String, dynamic> json,
) => _RecommendedPaginationLatest(
  limit: (json['limit'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  hasNext: json['hasNext'] as bool,
  nextCursor: (json['nextCursor'] as num).toInt(),
);

Map<String, dynamic> _$RecommendedPaginationLatestToJson(
  _RecommendedPaginationLatest instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'page': instance.page,
  'hasNext': instance.hasNext,
  'nextCursor': instance.nextCursor,
};

_RepliesPagination _$RepliesPaginationFromJson(Map<String, dynamic> json) =>
    _RepliesPagination(
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$RepliesPaginationToJson(_RepliesPagination instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'total': instance.total,
      'pages': instance.pages,
    };

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

_RecommendedResponseLatest _$RecommendedResponseLatestFromJson(
  Map<String, dynamic> json,
) => _RecommendedResponseLatest(
  pagination: RecommendedPaginationLatest.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  posts: (json['posts'] as List<dynamic>)
      .map((e) => Post.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecommendedResponseLatestToJson(
  _RecommendedResponseLatest instance,
) => <String, dynamic>{
  'pagination': instance.pagination,
  'posts': instance.posts,
};

_TimeLineResponse _$TimeLineResponseFromJson(Map<String, dynamic> json) =>
    _TimeLineResponse(
      pagination: TimeLinePagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
      posts: (json['posts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeLineResponseToJson(_TimeLineResponse instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'posts': instance.posts,
    };

_RepliesResponse _$RepliesResponseFromJson(Map<String, dynamic> json) =>
    _RepliesResponse(
      pagination: RepliesPagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
      replies: (json['replies'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepliesResponseToJson(_RepliesResponse instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'replies': instance.replies,
    };

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      accessToken: json['accessToken'] as String,
      deviceId: json['deviceId'] as String,
      sessionId: json['sessionId'] as String,
      user: AuthUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'deviceId': instance.deviceId,
      'sessionId': instance.sessionId,
      'user': instance.user,
    };

_RefreshResponse _$RefreshResponseFromJson(Map<String, dynamic> json) =>
    _RefreshResponse(
      accessToken: json['accessToken'] as String,
      sessionId: json['sessionId'] as String,
    );

Map<String, dynamic> _$RefreshResponseToJson(_RefreshResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'sessionId': instance.sessionId,
    };
