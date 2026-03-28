import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karotator/enum.dart';

part 'state.freezed.dart';

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
