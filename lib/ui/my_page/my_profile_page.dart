import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/widget/my_following_user_page.dart';
import 'package:twitter_clone/providers/user_tweet_providers.dart';
import 'package:twitter_clone/providers/user_following_providers.dart';
import 'package:twitter_clone/providers/user_info_providers.dart';
import 'package:twitter_clone/ui/my_page/widgets/edit_profile.dart';
import 'package:twitter_clone/ui/widget/tweet_card.dart';
import 'package:twitter_clone/ui/widget/tweeting_page.dart';
import '../widget/tweet_card.dart';

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key, required this.userId});

  final String userId;

  @override
  ConsumerState<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final following = ref.watch(userFollowingProvider(widget.userId));
    final post = ref.watch(userTweetProvider(widget.userId));
    final info = ref.watch(userInfoProvider(widget.userId));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TweetingPage(
                  userId: widget.userId,
                );
              },
            ),
          );
        },
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox.shrink(),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.blue,
                            ),
                            Container(
                              width: 120,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: info.when(
                                data: (user) {
                                  return TextButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return EditProfile(
                                            userInfoName: user.info.name,
                                            userInfoBio: user.info.bio,
                                            userInfoId: user.info.id,
                                            userId: user.id,
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      '編集',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  );
                                },
                                error: (e, _) => const Text('error'),
                                loading: () =>
                                    const CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        info.when(
                          data: (user) {
                            return Column(
                              children: [
                                Text(
                                  user.info.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  user.info.bio,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            );
                          },
                          error: (e, _) => const Text('error'),
                          loading: () => const CircularProgressIndicator(),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MyFollowingUserPage(
                                          userId: widget.userId);
                                    },
                                  ),
                                );
                              },
                              child: following.when(
                                data: (user) {
                                  return Text(
                                    '${user.following.length} フォロー',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2,
                                      color: Colors.black,
                                    ),
                                  );
                                },
                                error: (error, __) => const Text('error'),
                                loading: () =>
                                    const CircularProgressIndicator(),
                              ),
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MyFollowingUserPage(
                                          userId: widget.userId);
                                    },
                                  ),
                                );
                              },
                              child: following.when(
                                data: (user) {
                                  return Text(
                                    '${user.follower.length} フォロワー',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2,
                                      color: Colors.black,
                                    ),
                                  );
                                },
                                error: (error, __) => const Text('error'),
                                loading: () =>
                                    const CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              post.when(
                data: (user) {
                  return Scrollbar(
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: user.post.length,
                      itemBuilder: (context, index) => TweetCard(
                        post: user.post[index],
                        onPressed: () {},
                        userInfo: user.info,
                      ),
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
  }
}
