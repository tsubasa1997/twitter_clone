import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/exceptions/not_find_store_exception.dart';
import 'package:twitter_clone/models/user_info.dart';

import '../datasource/auth_datasource.dart';
import '../datasource/firebase_datasource.dart';
import '../models/user.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(ref: ref),
);

class AuthRepository {
  const AuthRepository({required this.ref});

  final Ref ref;

  AuthDatasource get _auth => ref.read(authDatasourceProvider);

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Future<void> createUser({
    required String email,
    required String password,
    required String name,
    required String bio,
  }) async {
    _auth.createUser(email, password, name, bio);
  }

  Stream<String?> uid() async* {
    yield* _auth.getUid().map((event) => event);
  }

  Stream<User> listenLoginUser(String uid) async* {
    final userInfo = await _remote.fetchUserInfo(uid);
    yield* _remote.listenUserInfo(uid).map(
          (event) => User(id: uid, info: userInfo),
        );
  }

  Future<void> signIn({required String email, required String password}) async {
    await _auth.signIn(email, password);
  }

  Future<void> signOut() => _auth.signOut();
}
