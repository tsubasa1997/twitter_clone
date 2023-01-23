import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/controllers/tweet_controller.dart';

class TweetingPage extends ConsumerStatefulWidget {
  const TweetingPage({super.key, required this.userId});

  final String userId;


  @override
  ConsumerState<TweetingPage> createState() => _TweetingPageState();
}


class _TweetingPageState extends ConsumerState<TweetingPage> {
  final _tweetController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _tweetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('キャンセル'),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('下書き'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextButton(
                        onPressed: () {
                          ref.read(tweetProvider).createTweet(
                                tweet: _tweetController.text,
                                createdAt: DateTime.now(),
                                userId: widget.userId,
                              );
                          Navigator.of(context).pop();
                        },
                        child: const Text('ツイートする'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextButton(
                    child: const Text(
                      '公開',
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: TextField(
                controller: _tweetController,
                style: const TextStyle(
                  fontSize: 25,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'いまなにしてる？',
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
