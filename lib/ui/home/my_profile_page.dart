import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/post.dart';
import 'package:twitter_clone/models/user.dart';
import 'package:twitter_clone/models/user_info.dart';
import 'package:twitter_clone/ui/home/provider/home_providers.dart';
import 'package:twitter_clone/ui/home/widgets/edit_profile.dart';
import 'package:twitter_clone/ui/widget/post_card.dart';

import '../utils/logger.dart';
import '../widget/tweet_card.dart';

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key, required this.userId});

  final String userId;

  @override
  ConsumerState<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ref.watch(homeProvider(widget.userId)).when(
          data: (user) {
            final userName = user.info.name;
            final userBio = user.info.bio;
            final posts = user.post;

            return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
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
                            transform:
                                Matrix4.translationValues(0.0, -40.0, 0.0),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const CircleAvatar(
                                        radius: 45,
                                        backgroundImage:
                                            const NetworkImage('')),
                                    Container(
                                      width: 120,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return EditProfile(
                                               userInfoName: user.info.name, userInfoBio: user.info.bio,
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          '編集',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  userName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  userBio != null
                                  ? userBio
                                  : '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: const [
                                    Text(
                                      '200 フォロー',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      '2000 フォロワー',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2,
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
                      ListView.builder(
                        controller: _scrollController,
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
