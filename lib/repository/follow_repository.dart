
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/follower.dart';
import 'package:twitter_clone/models/user_info.dart';
import '../datasource/firebase_datasource.dart';
import '../models/following.dart';

final usersRepositoryProvider = Provider(
  (ref) => UsersRepository(ref: ref),
);

class UsersRepository {
  const UsersRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Future<List<UserInfo>> searchUsers({
    required String userName,
  }) async {
    final info = await _remote.searchUsers(userName);
    return info;
  }

  Future<void> addFollowing({
    required String myUid,
    required String userId,
    required String bio,
    required String name,
  }) async {
    final following = Following(
      id: userId,
      bio: bio,
      name: name,
    );
    await _remote.createFollowing(myUid, following);
  }

  Future<void> addFollower(
      {required String userId,
      required String bio,
      required String name,
      required String uid}) async {
    final follower = Follower(id: uid, name: name, bio: bio);
    await _remote.addFollower(userId, follower);
  }

  Future<void> deleteFollowing({
    required String myUid,
    required String userId,
  }) async {
    await _remote.deleteFollowing(myUid, userId);
  }

  Future<void> deleteFollower({
    required String myUid,
    required String userId,
  }) async {
    await _remote.deleteFollower(myUid, userId);
  }

  Stream<bool> isFollowUser(
      {required String userId, required String uid}) async* {
    final follow = _remote.isFollow(uid, userId);
    yield* follow;
  }
}
