import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_transform/stream_transform.dart';
import '../common/exceptions/not_find_store_exception.dart';
import '../datasource/firebase_datasource.dart';
import '../models/user.dart';

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(ref: ref),
);

class HomeRepository {
  const HomeRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Stream<User> listenUserTweet(String userId) async* {
    final info = await _remote.fetchUserInfo(userId);
    if (info == null) {
      throw NotFindReferenceException(ref: null!);
    }
    yield* _remote.listenPosts(userId).map(
          (event) => User(info: info, post: event, id: userId),
        );
  }

  Stream<User> listenUserInfo(String userId) async* {
    final info = await _remote.fetchUserInfo(userId);
    if (info == null) {
      throw NotFindReferenceException(ref: null!);
    }
    yield* _remote.listenUserInfo(userId).map(
          (event) => User(info: info, id: userId),
        );
  }

  Stream<User> listenUserFollowing(String userId) async* {
    final info = await _remote.fetchUserInfo(userId);
    if (info == null) {
      throw NotFindReferenceException(ref: null!);
    }
    yield* _remote.listenFollowing(userId).map(
          (event) => User(info: info, id: userId, following: event),
        );
  }

  Stream<User> listenUserFollower(String userId) async* {
    final info = await _remote.fetchUserInfo(userId);
    if (info == null) {
      throw NotFindReferenceException(ref: null!);
    }
    yield* _remote.listenFollower(userId).map(
          (event) => User(info: info, id: userId, follower: event),
        );
  }
}
