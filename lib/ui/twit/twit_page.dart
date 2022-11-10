import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/home/provider/home_providers.dart';
import 'package:twitter_clone/ui/widget/post_card.dart';
import 'package:twitter_clone/ui/widget/tweet_card.dart';
import 'package:twitter_clone/ui/widget/user_drawer.dart';
import '../utils/logger.dart';

class TwitPage extends ConsumerStatefulWidget {
  const TwitPage({super.key, required this.userId});

  final String userId;

  @override
  ConsumerState<TwitPage> createState() => _TwitPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _TwitPageState extends ConsumerState<TwitPage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(homeProvider(widget.userId)).when(
          data: (user) {
            final posts = user.post;

            return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.comment),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return TweetCart();
                      },
                    ),
                  );
                },
              ),
              backgroundColor: Colors.white,
              key: _scaffoldKey,
              appBar: AppBar(
                title: Text(
                  'home',
                ),
                leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/9b/47/a0/9b47a023caf29f113237d61170f34ad9.jpg'),
                    radius: 16,
                  ),
                ),
              ),
              drawer: const UserDrawer(),
              body: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: posts.length,
                    itemBuilder: (context, index) => PostCard(
                      post: posts[index],
                      onPressed: () {},
                      userInfo: user.info,
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, __) {
            logger.warning(error);
            return const Center(
              child: Text('error'),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
