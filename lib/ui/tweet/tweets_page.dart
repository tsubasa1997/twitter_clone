import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/providers/auth_user_providers.dart';
import 'package:twitter_clone/providers/user_info_providers.dart';
import 'package:twitter_clone/ui/widget/tweet_card.dart';
import 'package:twitter_clone/ui/widget/tweeting_page.dart';
import 'package:twitter_clone/ui/tweet/widgets/user_drawer.dart';
import '../../providers/user_tweet_providers.dart';

class TweetsPage extends ConsumerStatefulWidget {
  const TweetsPage({super.key, required this.uid});

  final String uid;

  @override
  ConsumerState<TweetsPage> createState() => _TwitPageState();
}


class _TwitPageState extends ConsumerState<TweetsPage> {

  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(authUserProvider);
    final post = ref.watch(userTweetProvider(widget.uid));
    final info = ref.watch(userInfoProvider(widget.uid));


    return uid.when(
      data: (uid) {
        if (uid != null) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TweetingPage(
                        userId: uid,
                      );
                    },
                  ),
                );
              },
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: info.when(
                data: (user) {
                  return Text(user.info.name);
                },
                error: (e, _) => const Text('e'),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
            drawer: info.when(
              data: (user) {
                return UserDrawer(
                  userId: user.info.id,
                );
              },
              error: (e, _) => const Text('error'),
              loading: () => const CircularProgressIndicator(),
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    post.when(
                      data: (user) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: user.post.length,
                          itemBuilder: (context, index) => TweetCard(
                            post: user.post[index],
                            onPressed: () {},
                            userInfo: user.info,
                          ),
                        );
                      },
                      error: (e, _) => const Text('error'),
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
      error: (e, _) => const Text('e'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
