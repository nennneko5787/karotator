import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class Author with _$Author {
  const factory Author({
    int? avatarFrameId,
    String? avatarUrl,
    required String displayName,
    required int id,
    required bool isPrivate,
    required bool isBotAccount,
    required bool isParodyAccount,
    @Default("NONE") String officialMark,
    required String username,
  }) = _Author;

  factory Author.fromJson(Map<String, Object?> json) => _$AuthorFromJson(json);
}

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    String? avatarUrl,
    required String displayName,
    required int id,
    String? email,
    required bool emailVerified,
    required String username,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, Object?> json) =>
      _$AuthUserFromJson(json);
}
