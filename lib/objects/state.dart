import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/post.dart';

part 'state.freezed.dart';

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
}

@unfreezed
abstract class MediaState with _$MediaState {
  factory MediaState({
    required File file,
    Uint8List? thumbnail,
    required MediaType type,
    @Default("") String alt,
    @Default(false) bool spoiler,
    @Default(false) bool nsfw,
  }) = _MediaState;
}

@freezed
abstract class PollState with _$PollState {
  const factory PollState({required int id, required Poll poll}) = _PollState;
}
