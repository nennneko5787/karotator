import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/user.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
abstract class RecommendedPagination with _$RecommendedPagination {
  const factory RecommendedPagination({required int limit, required int page}) =
      _RecommendedPagination;

  factory RecommendedPagination.fromJson(Map<String, Object?> json) =>
      _$RecommendedPaginationFromJson(json);
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
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String accessToken,
    required String deviceId,
    required String sessionId,
    required AuthUser gender,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
