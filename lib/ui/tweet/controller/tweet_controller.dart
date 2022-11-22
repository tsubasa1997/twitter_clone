import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone/repository/tweet_repository.dart';

part 'tweet_controller.freezed.dart';

final tweetStateProvider =
    StateNotifierProvider<TweetStateNotifier, TweetState>(
  (ref) => TweetStateNotifier(ref: ref),
);

@freezed
class TweetState with _$TweetState {
  const factory TweetState({
    String? id,
    String? tweet,
  }) = _TweetState;
}

class TweetStateNotifier extends StateNotifier<TweetState> {
  TweetStateNotifier({required this.ref}) : super(const TweetState());
  final Ref ref;

  TweetRepository get _repository => ref.read(tweetRepositoryProvider);

  Future<void> createTweet({
    required String tweet,
    required DateTime createdAt,
  }) async {
    await _repository.createTweet(
      tweet: tweet,
      userId: "ve2eJV57E94sY7NSJs7z",
      createAt: createdAt,
    );
  }

  Future<void> deleteTweet({
    required String userId,
    required String postId,
  }) async {
    await _repository.deletePost(
      userId: userId,
      postId: postId,
    );
  }
}
