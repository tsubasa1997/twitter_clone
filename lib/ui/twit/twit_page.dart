import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/home/provider/home_providers.dart';
import 'package:twitter_clone/ui/twit/widgets/post_card.dart';
import 'package:twitter_clone/ui/widget/user_drawer.dart';

import '../home/user_page.dart';
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
            final userName = user.info.name;
            final posts = user.post;

            return Scaffold(
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
                    backgroundImage: const NetworkImage(
                        'https://i.pinimg.com/564x/9b/47/a0/9b47a023caf29f113237d61170f34ad9.jpg'),
                    radius: 16,
                  ),
                ),
              ),
              drawer: UserDrawer(),
              body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemCount: posts.length,
                itemBuilder: (context, index) => PostCard(
                  post: posts[index],
                  onPressed: () {},
                ),
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
