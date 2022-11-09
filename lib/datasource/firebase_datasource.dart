

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/exceptions/not_find_store_exception.dart';
import '../models/post.dart';
import '../models/user_info.dart';

final firestoreDatasourceProvider = Provider((_) => FirestoreDatasource(),);

class FirestoreDatasource {
  final _db = FirebaseFirestore.instance;

  static const usersCollectionId = 'users';
  static const postsCollectionId = 'posts';


  Future<UserInfo> fetchUserInfo(String userId) async {
    final ref = _db.collection(usersCollectionId).doc(userId);
    final doc = await ref.get();
    final json = doc.data();
    if (json == null) {
      throw NotFindReferenceException(ref: ref);
    }
    return UserInfo.fromJson(json);
  }

  Stream<UserInfo> listenUserInfo(String userId) async* {
    final ref = _db.collection(usersCollectionId).doc(userId);
    final snap = ref.snapshots();
    yield* snap.map((event) {
      final json = event.data();
      if (json == null) {
        throw NotFindReferenceException(ref: ref);
      }
      return UserInfo.fromJson(json);
    });
  }

  Future<Post> fetchPost(String userId, String postId) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(postsCollectionId)
        .doc(postId);
    final doc = await ref.get();
    final json = doc.data();
    if (json == null) {
      throw NotFindReferenceException(ref: ref);
    }
    return Post.fromJson(json);
  }

  Stream<List<Post>> listenPosts(String userId) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(postsCollectionId);
    yield* ref.snapshots().map((event) {
      return event.docs.map((e) {
        final json = e.data();
        return Post.fromJson(json);
      }).toList();
    });
  }
}