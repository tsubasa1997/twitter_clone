import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/post.dart';

import '../datasource/firebase_datasource.dart';

final tweetRepositoryProvider = Provider(
  (ref) => TweetRepository(ref: ref),
);

class TweetRepository {
  const TweetRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Future<void> createTweet({
    required String tweet,
    required String userId,
    required DateTime createAt,
  }) async {
    final post = Post(
      id: _remote.createPostId(userId),
      tweet: tweet,
      createdAt: createAt,
    );
    await _remote.createPost(userId, post);
  }

  Future<void> deletePost({
    required String userId,
    required String postId,
  }) async {
    await _remote.deletePost(userId, postId);
  }

}
