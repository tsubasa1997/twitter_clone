import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/home/controller/tweet_controller.dart';

class TweetCart extends ConsumerStatefulWidget {
  const TweetCart({Key? key}) : super(key: key);

  @override
  ConsumerState<TweetCart> createState() => _TweetCartState();
}

class _TweetCartState extends ConsumerState<TweetCart> {
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
                  child: Text(
                    'キャンセル',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('下書き'),
                    ),
                    SizedBox(
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
                          ref.read(tweetStateProvider.notifier).createTweet(
                                tweet: _tweetController.text,
                                createdAt: DateTime.now(),
                              );
                          Navigator.of(context).pop();
                        },
                        child: Text('ツイートする'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(''),
                ),
                SizedBox(
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
              padding: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: TextField(
                controller: _tweetController,
                style: TextStyle(
                  fontSize: 25,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
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
