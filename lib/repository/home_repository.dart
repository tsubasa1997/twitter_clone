import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Stream<User> listenUser(String userId) async* {
    final info = await _remote.fetchUserInfo(userId);
    if (info == null) {
      throw NotFindReferenceException(ref: null!);
    }
    yield* _remote.listenPosts(userId).map(
          (event) => User(info: info, post: event, id: ''),
    );
  }
}