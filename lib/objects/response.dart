import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/objects/notification.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/user.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
abstract class TimeLinePagination with _$TimeLinePagination {
  const factory TimeLinePagination({
    required int limit,
    required int page,
    required String mode,
  }) = _TimeLinePagination;

  factory TimeLinePagination.fromJson(Map<String, Object?> json) =>
      _$TimeLinePaginationFromJson(json);
}

@freezed
abstract class RecommendedPagination with _$RecommendedPagination {
  const factory RecommendedPagination({required int limit, required int page}) =
      _RecommendedPagination;

  factory RecommendedPagination.fromJson(Map<String, Object?> json) =>
      _$RecommendedPaginationFromJson(json);
}

@freezed
abstract class RecommendedPaginationLatest with _$RecommendedPaginationLatest {
  const factory RecommendedPaginationLatest({
    required int limit,
    required int page,
    required bool hasNext,
    required int nextCursor,
  }) = _RecommendedPaginationLatest;

  factory RecommendedPaginationLatest.fromJson(Map<String, Object?> json) =>
      _$RecommendedPaginationLatestFromJson(json);
}

@freezed
abstract class RepliesPagination with _$RepliesPagination {
  const factory RepliesPagination({
    required int limit,
    required int page,
    required int total,
    required int pages,
  }) = _RepliesPagination;

  factory RepliesPagination.fromJson(Map<String, Object?> json) =>
      _$RepliesPaginationFromJson(json);
}

@freezed
abstract class RecommendedResponse with _$RecommendedResponse {
  const factory RecommendedResponse({
    required RecommendedPagination pagination,
    required List<Post> posts,
  }) = _RecommendedResponse;

  factory RecommendedResponse.fromJson(Map<String, Object?> json) =>
      _$RecommendedResponseFromJson(json);
}

@freezed
abstract class RecommendedResponseLatest with _$RecommendedResponseLatest {
  const factory RecommendedResponseLatest({
    required RecommendedPaginationLatest pagination,
    required List<Post> posts,
  }) = _RecommendedResponseLatest;

  factory RecommendedResponseLatest.fromJson(Map<String, Object?> json) =>
      _$RecommendedResponseLatestFromJson(json);
}

@freezed
abstract class TimeLineResponse with _$TimeLineResponse {
  const factory TimeLineResponse({
    required TimeLinePagination pagination,
    required List<Post> posts,
  }) = _TimeLineResponse;

  factory TimeLineResponse.fromJson(Map<String, Object?> json) =>
      _$TimeLineResponseFromJson(json);
}

@freezed
abstract class RepliesResponse with _$RepliesResponse {
  const factory RepliesResponse({
    required RepliesPagination pagination,
    required List<Post> replies,
  }) = _RepliesResponse;

  factory RepliesResponse.fromJson(Map<String, Object?> json) =>
      _$RepliesResponseFromJson(json);
}

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String accessToken,
    required String deviceId,
    required String sessionId,
    required AuthUser user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class RefreshResponse with _$RefreshResponse {
  const factory RefreshResponse({
    required String accessToken,
    required String sessionId,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(Map<String, Object?> json) =>
      _$RefreshResponseFromJson(json);
}

@freezed
abstract class UserResponse with _$UserResponse {
  const factory UserResponse({
    required User user,
    QuotedPost? pinnedPost,
    required bool isFollowing,
    required bool isFollowedBy,
    required bool isBlocked,
    required bool hasBlocked,
    required bool isBlockedBy,
    required bool isMuted,
    required bool hasPendingRequest,
    required List<Author> mutualFollowersPreview,
    required int mutualFollowersCount,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, Object?> json) =>
      _$UserResponseFromJson(json);

  factory UserResponse.empty() => UserResponse(
    user: User.empty(),
    pinnedPost: null,
    isFollowing: false,
    isFollowedBy: false,
    isBlocked: false,
    hasBlocked: false,
    isBlockedBy: false,
    isMuted: false,
    hasPendingRequest: false,
    mutualFollowersPreview: [],
    mutualFollowersCount: 0,
  );
}

@freezed
abstract class NotificationPagination with _$NotificationPagination {
  const factory NotificationPagination({
    required bool hasMore,
    required int limit,
    required int nextPage,
    required int page,
  }) = _NotificationPagination;

  factory NotificationPagination.fromJson(Map<String, Object?> json) =>
      _$NotificationPaginationFromJson(json);
}

@freezed
abstract class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    required NotificationPagination pagination,
    required List<Notification> notifications,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, Object?> json) =>
      _$NotificationResponseFromJson(json);
}
