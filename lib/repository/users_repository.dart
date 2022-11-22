import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/users.dart';

import '../common/exceptions/not_find_store_exception.dart';
import '../datasource/firebase_datasource.dart';

final usersRepositoryProvider = Provider(
  (ref) => UsersRepository(ref: ref),
);

class UsersRepository {
  const UsersRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);


  Stream<Users> allUsers() async* {
    final info = await _remote.allUsers();
    if (info == null) {
      throw NotFindReferenceException(ref: null!);
    }
    yield* _remote.allUsers().map(
          (event) => Users(),
    );
  }
}
