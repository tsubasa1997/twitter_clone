import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/user_info.dart';

import '../datasource/firebase_datasource.dart';

final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(ref: ref),
);

class ProfileRepository {
  const ProfileRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Future<void> updateProfile({
    required String id,
    required String name,
    required String bio,
  }) async {
    final userInfo = UserInfo(
      id: id,
      name: name,
      bio: bio,
    );
    await _remote.updateProfile(userInfo, userInfo);
  }
}
