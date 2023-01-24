import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/tweet_repository.dart';

final tweetProvider = Provider(
  (ref) => TweetController(ref: ref),
);

class TweetController {
  const TweetController({required this.ref});

  final Ref ref;

  TweetRepository get _repository => ref.read(tweetRepositoryProvider);

  Future<void> createTweet({
    required String tweet,
    required String userId,
    required DateTime createdAt,
  }) async {
    await _repository.createTweet(
      tweet: tweet,
      userId: userId,
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
