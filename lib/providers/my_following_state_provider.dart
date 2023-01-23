import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/follow_repository.dart';

part '../repository/my_following_state_provider.freezed.dart';

@freezed
class MyFollowingState with _$MyFollowingState {
  const factory MyFollowingState({
    required String userId,
    required String myUid,
  }) = _MyFollowingState;
}

final followProvider =
    StreamProvider.autoDispose.family<bool, MyFollowingState>(
  (ref, usersState) => ref
      .watch(usersRepositoryProvider)
      .isFollowUser(userId: usersState.userId, uid: usersState.myUid),
);
