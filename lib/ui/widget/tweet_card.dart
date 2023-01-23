import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/controllers/tweet_controller.dart';
import 'package:twitter_clone/ui/widget/tweet_detail.dart';

import '../../models/post.dart';
import '../../models/user_info.dart';

class TweetCard extends ConsumerStatefulWidget {
  const TweetCard({
    super.key,
    required this.post,
    required this.userInfo,
    required this.onPressed,
  });

  final UserInfo userInfo;
  final Post post;
  final VoidCallback onPressed;

  @override
  ConsumerState<TweetCard> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<TweetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push<void>(
            MaterialPageRoute(
              builder: (context) {
                return PostDetail(
                  onPressed: () {},
                  userInfo: widget.userInfo,
                  post: widget.post,
                );
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.userInfo.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    widget.userInfo.id,
                    style: const TextStyle(fontSize: 10),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            children: [
                              SimpleDialogOption(
                                onPressed: () {
                                  ref.read(tweetProvider).deleteTweet(
                                        userId: widget.userInfo.id,
                                        postId: widget.post.id,
                                      );
                                  Navigator.of(context).pop();
                                },
                                child: const Text('ツイートを削除'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.pending),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  widget.post.tweet,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.post.createdAt.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
