import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/providers/user_follower_providers.dart';
import 'package:twitter_clone/providers/user_following_providers.dart';
import 'package:twitter_clone/providers/user_info_providers.dart';
import 'package:twitter_clone/ui/widget/follower_user_card.dart';
import 'package:twitter_clone/ui/widget/following_user_card.dart';

class MyFollowingUserPage extends ConsumerStatefulWidget {
  const MyFollowingUserPage({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  ConsumerState<MyFollowingUserPage> createState() =>
      _MyFollowingUserPageState();
}

class _MyFollowingUserPageState extends ConsumerState<MyFollowingUserPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final info = ref.watch(userInfoProvider(widget.userId));
    final following = ref.watch(userFollowingProvider(widget.userId));
    final follower = ref.watch(userFollowerProvider(widget.userId));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: info.when(
            data: (user) {
              return Text(user.info.name);
            },
            error: (e, _) => const Text('error'),
            loading: () => const CircularProgressIndicator(),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('Follow'),
              ),
              Tab(
                child: Text('Follower'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                following.when(
                  data: (user) {
                    if (user.following.isEmpty) {
                      return const Center(
                        child: Text(
                          '0 follower',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: user.following.length,
                        itemBuilder: (context, index) {
                          return FollowingUserCard(
                            following: user.following[index],
                          );
                        },
                      );
                    }
                  },
                  error: (e, _) => const Text('error'),
                  loading: () => const CircularProgressIndicator(),
                ),
              ],
            ),
            Column(
              children: [
                follower.when(
                  data: (user) {
                    if (user.follower.isEmpty) {
                      return const Center(
                        child: Text(
                          '0 follower',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: user.follower.length,
                        itemBuilder: (context, index) {
                          return FollowerUserCard(
                              follower: user.follower[index]);
                        },
                      );
                    }
                  },
                  error: (e, _) => const Text('e'),
                  loading: () => const CircularProgressIndicator(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
