import 'package:flutter/material.dart';
import 'package:karotator/exceptions.dart';
import 'package:karotator/http.dart';
import 'package:karotator/objects/response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
class UserResponseNotifier extends _$UserResponseNotifier {
  bool _initialize = false;

  @override
  UserResponse build(int userId) => UserResponse.empty();

  void initialize(UserResponse response) {
    if (_initialize) return;
    _initialize = true;

    state = response;
  }

  Future<void> toggleFollow() async {
    final current = state;

    state = current.copyWith(isFollowing: !current.isFollowing);

    try {
      if (!current.isFollowing) {
        await HTTPClient().follow(current.user.id);
      } else {
        await HTTPClient().unfollow(current.user.id);
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if ((e is! KarotterClientException) || (e.statusCode != 400)) {
        state = current.copyWith(isFollowing: !current.isFollowing);
        rethrow;
      }
    }
  }
}
