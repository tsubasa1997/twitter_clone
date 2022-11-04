import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter_clone/models/user_info.dart';

import '../exceptions/not_find_user_exception.dart';
import '../models/user.dart';

final firestoreDatasourceProvider = Provider(
  (_) => FirestoreDatasource(),
);

class FirestoreDatasource {
  final _db = FirebaseFirestore.instance;

  static const usersCollectionId = 'users';
  static const postsCollectionId = 'posts';

  String createUserId() => _db.collection(usersCollectionId).doc().id;

  Future<UserInfo> fetchUserInfo(String userId) async {
    final ref = _db.collection(usersCollectionId).doc(userId);
    final doc = await ref.get();
    final json = doc.data();
    if (json == null) {
      throw NotFindReferenceException(ref: ref);
    }
    return UserInfo.fromJson(json);
  }

  Stream<UserInfo> listenPostInfo(String postId) async* {
    final ref = _db.collection(postsCollectionId).doc(postId);
    final snap = ref.snapshots();
    yield* snap.map((event) {
      final json = event.data();
      if (json == null) {
        throw NotFindReferenceException(ref: ref);
      }
      return UserInfo.fromJson(json);
    });
  }

}
