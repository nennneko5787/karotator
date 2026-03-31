import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/objects/post.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
abstract class BoardCreator with _$BoardCreator {
  const factory BoardCreator({
    required int id,
    required String username,
    required String displayName,
  }) = _BoardCreator;

  factory BoardCreator.fromJson(Map<String, Object?> json) =>
      _$BoardCreatorFromJson(json);
}

@freezed
abstract class Board with _$Board {
  const factory Board({
    required int id,
    required String slug,
    required String title,
    String? description,
    required int minimumAge,
    required int threadCount,
    required int replyCount,
    required DateTime lastPostAt,
    required DateTime createdAt,
    required BoardCreator creator,
    required bool followed,
  }) = _Board;

  factory Board.fromJson(Map<String, Object?> json) => _$BoardFromJson(json);
}

@freezed
abstract class ThreadAuthor with _$ThreadAuthor {
  const factory ThreadAuthor({
    required int id,
    required String username,
    required String displayName,
  }) = _ThreadAuthor;

  factory ThreadAuthor.fromJson(Map<String, Object?> json) =>
      _$ThreadAuthorFromJson(json);
}

@freezed
abstract class Thread with _$Thread {
  const factory Thread({
    required int id,
    required int boardId,
    required int authorId,
    required String title,
    required String content,
    required List<String> imageUrls,
    required List<String> imageTypes,
    required int replyCount,
    required DateTime lastReplyAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    required ThreadAuthor author,
    required List<ReactionSummary> reactionSummary,
    required bool followed,
  }) = _Thread;

  factory Thread.fromJson(Map<String, Object?> json) => _$ThreadFromJson(json);
}

@freezed
abstract class ThreadReply with _$ThreadReply {
  const factory ThreadReply({
    required int id,
    required int boardId,
    required int threadId,
    required int authorId,
    required int replyNumber,
    required String content,
    required List<String> imageUrls,
    required List<String> imageTypes,
    int? replyCount,
    DateTime? lastReplyAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    required ThreadAuthor author,
    required List<ReactionSummary> reactionSummary,
  }) = _ThreadReply;

  factory ThreadReply.fromJson(Map<String, Object?> json) =>
      _$ThreadReplyFromJson(json);
}
