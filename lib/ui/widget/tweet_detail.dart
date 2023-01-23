import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/controllers/tweet_controller.dart';

import '../../models/post.dart';
import '../../models/user_info.dart';

class PostDetail extends ConsumerStatefulWidget {
  const PostDetail({
    super.key,
    required this.onPressed,
    required this.userInfo,
    required this.post,
  });

  final UserInfo userInfo;
  final Post post;
  final VoidCallback onPressed;

  @override
  ConsumerState<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends ConsumerState<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ツイート'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.userInfo.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  child: Text(
                    widget.post.tweet,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Text(
                    widget.post.createdAt.toString(),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.repeat),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.upload),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
