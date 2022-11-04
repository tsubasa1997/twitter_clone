
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/exceptions/not_find_user_exception.dart';

import '../datasource/firestore_datasource.dart';
import '../models/user.dart';

final userRepositoryProvider = Provider(
      (ref) => UserRepository(read: ref.read),
);

class UserRepository {
  const UserRepository({required this.read});

  final Reader read;

  FirestoreDatasource get _remoto => read(firestoreDatasourceProvider);

  Stream<User> listenUser(String userId) async* {
    final info = await _remoto.fetchUserInfo(userId);
    if (info == null) {
      throw NotFindReferenceException(ref: null!);
    }
    yield* _remoto.listenPostInfo(userId).map((event) =>
        User(id: '', name: '', imageUrl: '', profile: '', info: info,),);
  }
}
