import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/follow_repository.dart';

final isFollowProvider = Provider(
  (ref) => FollowController(ref: ref),
);

class FollowController {
  const FollowController({required this.ref});

  final Ref ref;

  UsersRepository get _repository => ref.read(usersRepositoryProvider);

  Future<void> createFollowing({
    required String myUid,
    required String userId,
    required String bio,
    required String name,
  }) async {
    await _repository.addFollowing(
        userId: userId, bio: bio, name: name, myUid: myUid);
  }

  Future<void> addFollower({
    required String userId,
    required String bio,
    required String name,
    required String uid,
  }) async {
    await _repository.addFollower(
        userId: userId, bio: bio, name: name, uid: uid);
  }

  Future<void> deleteFollowing({
    required String myUid,
    required String userId,
  }) async {
    await _repository.deleteFollowing(myUid: myUid, userId: userId);
  }

  Future<void> deleteFollower({
    required String myUid,
    required String userId,
  }) async {
    await _repository.deleteFollower(myUid: myUid, userId: userId);
  }
}
