import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/objects/user.dart';

part 'circle.freezed.dart';
part 'circle.g.dart';

@freezed
abstract class CircleCountMeta with _$CircleCountMeta {
  const factory CircleCountMeta({required int posts, required int stories}) =
      _CircleCountMeta;

  factory CircleCountMeta.fromJson(Map<String, Object?> json) =>
      _$CircleCountMetaFromJson(json);
}

@freezed
abstract class Circle with _$Circle {
  const factory Circle({
    required int id,
    required int ownerId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    String? description,
    required List<Author> members,
    @JsonKey(name: '_count') required CircleCountMeta meta,
  }) = _Circle;

  factory Circle.fromJson(Map<String, Object?> json) => _$CircleFromJson(json);
}
