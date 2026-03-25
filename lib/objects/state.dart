import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    required int id,
    required bool rekaroted,
    required int rekarotsCount,
    required bool liked,
    required int likesCount,
    required bool bookmarked,
    required int bookmarksCount,
  }) = _PostState;

  factory PostState.fromJson(Map<String, Object?> json) =>
      _$PostStateFromJson(json);
}
