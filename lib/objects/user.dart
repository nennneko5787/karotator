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
    @Default(false) bool isPrivate,
    @Default("NONE") String officialMark,
    required String username,
  }) = _Author;

  factory Author.fromJson(Map<String, Object?> json) => _$AuthorFromJson(json);

  factory Author.empty(int id) {
    return Author(displayName: "", id: id, username: "");
  }
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
