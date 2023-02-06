import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/following.dart';
import 'package:twitter_clone/models/message.dart';

import '../common/exceptions/not_find_store_exception.dart';
import '../models/chat_room.dart';
import '../models/follower.dart';
import '../models/post.dart';
import '../models/user_info.dart';

final firestoreDatasourceProvider = Provider(
  (_) => FirestoreDatasource(),
);

class FirestoreDatasource {
  final _db = FirebaseFirestore.instance;

  static const usersCollectionId = 'users';
  static const postsCollectionId = 'posts';
  static const followingCollectionId = 'following';
  static const followerCollectionId = 'follower';
  static const chatroomCollectionId = 'chatroom';
  static const messageCollectionId = 'message';

  String createUserId() => _db.collection(usersCollectionId).doc().id;

  String createPostId(String userId) => _db
      .collection(usersCollectionId)
      .doc(userId)
      .collection(postsCollectionId)
      .doc()
      .id;

  String createChatroomId(String uid) => _db
      .collection(usersCollectionId)
      .doc(uid)
      .collection(chatroomCollectionId)
      .doc()
      .id;

  String createMessageId(String chatRoomId) => _db
      .collection(chatroomCollectionId)
      .doc(chatRoomId)
      .collection(messageCollectionId)
      .doc()
      .id;

  Future<void> createChatRoom(String uid,Chatroom chatroom) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(chatroomCollectionId)
        .doc(chatroom.roomId);
    await ref.set(chatroom.toJson());
  }

  Future<void> createReceiverChatRoom(String receiverId,Chatroom chatroom) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(receiverId)
        .collection(chatroomCollectionId)
        .doc(chatroom.roomId);
    await ref.set(chatroom.toJson());
  }

  Future<void> addMessage(String uid,String chatroomId,Message message) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(chatroomCollectionId)
        .doc(chatroomId)
        .collection(messageCollectionId)
        .doc(message.id);
    await ref.set(message.toJson());
  }

  Future<void> receiveMessage(String receiverId, String chatroomId, Message message) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(receiverId)
        .collection(chatroomCollectionId)
        .doc(chatroomId)
        .collection(messageCollectionId)
        .doc(message.id);
    await ref.set(message.toJson());
  }

  Future<void> createPost(String userId, Post post) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(postsCollectionId)
        .doc(post.id);
    await ref.set(post.toJson());
  }

  Future<void> deletePost(String userId, String postId) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(postsCollectionId)
        .doc(postId);
    await ref.delete();
  }

  Future<void> updateProfile(UserInfo info, UserInfo userInfo) async {
    final ref = _db.collection(usersCollectionId).doc(info.id);
    await ref.update(info.toJson());
  }

  Future<UserInfo> fetchUserInfo(String userId) async {
    final ref = _db.collection(usersCollectionId).doc(userId);
    final doc = await ref.get();
    final json = doc.data();
    if (json == null) {
      throw NotFindReferenceException(ref: ref);
    }
    return UserInfo.fromJson(json);
  }

  Future<List<UserInfo>> searchUsers(String userName) async {
    final ref =
        _db.collection(usersCollectionId).where('name', isEqualTo: userName);
    final snapShot = await ref.get();
    final users = snapShot.docs.map((e) {
      final json = e.data();
      return UserInfo.fromJson(json);
    });
    return users.toList();
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

  Stream<bool> isFollow(String uid, String userId) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(followingCollectionId)
        .doc(userId);
    yield* ref.snapshots().map((event) {
      final json = event.data();
      if (json == null) {
        return false;
      }
      return true;
    });
  }

  Stream<List<Post>> listenPosts(String userId) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(postsCollectionId)
        .orderBy('createdAt', descending: true);
    yield* ref.snapshots().map((event) {
      return event.docs.map((e) {
        final json = e.data();
        return Post.fromJson(json);
      }).toList();
    });
  }

  Stream<List<Message>> listenMessages(String uid,String roomId,) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(chatroomCollectionId)
        .doc(roomId)
        .collection(messageCollectionId)
        .orderBy('createdAt');
    yield* ref.snapshots().map((event) {
      return event.docs.map((e) {
        final json = e.data();
        return Message.fromJson(json);
      }).toList();
    });
  }

  Stream<List<Chatroom>> listenChatRoomList(String uid) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(chatroomCollectionId);
    yield* ref.snapshots().map((event) {
      return event.docs.map((e) {
        final json = e.data();
        return Chatroom.fromJson(json);
      }).toList();
    });
  }

  Stream<Chatroom> listenChatRoom (String uid, String roomId,) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(chatroomCollectionId)
        .doc(roomId);
    yield* ref.snapshots().map((event) {
      final json = event.data();
      if(json == null) {
        throw NotFindReferenceException(ref: ref);
      }
      return Chatroom.fromJson(json);
    });
  }

  Stream<List<Following>> listenFollowing(String userId) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(followingCollectionId);
    yield* ref.snapshots().map((event) {
      return event.docs.map((e) {
        final json = e.data();
        return Following.fromJson(json);
      }).toList();
    });
  }

  Stream<List<Follower>> listenFollower(String userId) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(followerCollectionId);
    yield* ref.snapshots().map((event) {
      return event.docs.map((e) {
        final json = e.data();
        return Follower.fromJson(json);
      }).toList();
    });
  }

  Future<void> createFollowing(String myUid, Following following) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(myUid)
        .collection(followingCollectionId)
        .doc(following.id);
    await ref.set(following.toJson());
  }

  Future<void> addFollower(String userId, Follower follower) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(followerCollectionId)
        .doc(follower.id);
    await ref.set(follower.toJson());
  }

  Future<void> deleteFollowing(String myUid, String userId) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(myUid)
        .collection(followingCollectionId)
        .doc(userId);
    await ref.delete();
  }

  Future<void> deleteFollower(String myUid, String userId) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(followerCollectionId)
        .doc(myUid);
    await ref.delete();
  }
}
