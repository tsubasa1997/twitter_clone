import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../repository/profile_repository.dart';

part 'profile_controller.freezed.dart';

final profileStateProvider =
    StateNotifierProvider<ProfileStateNotifier, ProfileState>(
  (ref) => ProfileStateNotifier(ref: ref),
);

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    String? id,
    String? name,
    String? bio,
  }) = _ProfileState;
}

class ProfileStateNotifier extends StateNotifier<ProfileState> {
  ProfileStateNotifier({required this.ref}) : super(const ProfileState());
  final Ref ref;

  ProfileRepository get _repository => ref.read(profileRepositoryProvider);

  Future<void> updateProfile({
    required String id,
    required String name,
    required String bio,
  }) async {
    await _repository.updateProfile(
      id: id,
      name: name,
      bio: bio,
    );
  }
}
