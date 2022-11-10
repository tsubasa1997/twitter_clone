import 'package:flutter/material.dart';

class TweetCart extends StatefulWidget {
  const TweetCart({Key? key}) : super(key: key);

  @override
  State<TweetCart> createState() => _TweetCartState();
}

class _TweetCartState extends State<TweetCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('キャンセル'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
