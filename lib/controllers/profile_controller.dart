import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/profile_repository.dart';

final profileProvider = Provider(
  (ref) => ProfileController(ref: ref),
);

class ProfileController {
  const ProfileController({required this.ref});

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
