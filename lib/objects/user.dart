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
}
