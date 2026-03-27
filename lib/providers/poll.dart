import 'package:flutter/material.dart';
import 'package:karotator/http.dart';
import 'package:karotator/objects/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'poll.g.dart';

@riverpod
class PollNotifier extends _$PollNotifier {
  @override
  PollState build(PollState post) => post;

  Future<void> poll(int optionId) async {
    final current = state;

    try {
      final poll = await HTTPClient().poll(current.id, optionId: optionId);
      state = current.copyWith(poll: poll);
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      rethrow;
    }
  }
}
