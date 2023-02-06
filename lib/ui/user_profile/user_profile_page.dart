import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/controllers/message_controller.dart';
import 'package:twitter_clone/providers/user_tweet_providers.dart';
import 'package:twitter_clone/ui/home/home_page.dart';
import 'package:twitter_clone/ui/message/widget/chat_room.dart';
import 'package:twitter_clone/ui/widget/my_following_user_page.dart';
import 'package:twitter_clone/providers/auth_user_info_provider.dart';
import 'package:twitter_clone/providers/auth_user_providers.dart';
import 'package:twitter_clone/providers/user_follower_providers.dart';
import 'package:twitter_clone/providers/user_following_providers.dart';
import 'package:twitter_clone/ui/widget/tweeting_page.dart';
import '../../controllers/follow_controller.dart';
import '../../providers/my_following_state_provider.dart';
import '../../providers/user_info_providers.dart';
import '../widget/tweet_card.dart';

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({
    super.key,
    required this.userId,
    required this.uid,
  });

  final String userId;
  final String uid;

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(authUserProvider);
    final userFollowing = ref.watch(userFollowingProvider(widget.userId));
    final userFollower = ref.watch(userFollowerProvider(widget.userId));
    final userTweets = ref.watch(userTweetProvider(widget.userId));
    final followingUser = ref.watch(userInfoProvider(widget.uid));

    return uid.when(
      data: (uid) {
        if (uid != null) {
          return ref.watch(userInfoProvider(widget.userId)).when(
                data: (user) {
                  return Scaffold(
                    floatingActionButton: FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return TweetingPage(
                                userId: user.id,
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
                              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                                            backgroundImage: NetworkImage(''),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  final chatRoom = await ref.read(messageProvider).createChatRoomId(
                                                        uid: uid,
                                                        receiverId: user.id,
                                                      );

                                                  if (mounted) {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return ChatRoom(
                                                            receiverId: user.id,
                                                            roomId: chatRoom.roomId,
                                                            uid: uid,
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  }
                                                },
                                                icon: const Icon(Icons.mail),
                                              ),
                                              ref.watch(authLoginUserProvider(uid)).when(
                                                    data: (loginUser) {
                                                      if (loginUser != null) {
                                                        final isFollowing = ref.watch(
                                                          followProvider(
                                                            MyFollowingState(
                                                              userId: widget.userId,
                                                              myUid: loginUser.id,
                                                            ),
                                                          ),
                                                        );
                                                        return isFollowing.when(
                                                          data: (isFollowing) {
                                                            return Container(
                                                              width: 120,
                                                              height: 45,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(color: Colors.blue),
                                                                borderRadius: BorderRadius.circular(40),
                                                                color: isFollowing ? Colors.blue : Colors.white,
                                                              ),
                                                              child: isFollowing
                                                                  ? TextButton(
                                                                      onPressed: () {
                                                                        ref.watch(isFollowProvider).deleteFollowing(
                                                                              myUid: loginUser.id,
                                                                              userId: user.id,
                                                                            );

                                                                        ref.watch(isFollowProvider).deleteFollower(
                                                                              myUid: loginUser.id,
                                                                              userId: user.id,
                                                                            );
                                                                      },
                                                                      child: const Text(
                                                                        'フォローなう',
                                                                        style: TextStyle(
                                                                          fontSize: 15,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : followingUser.when(
                                                                      data: (followingUser) {
                                                                        return TextButton(
                                                                          onPressed: () {
                                                                            ref.watch(isFollowProvider).createFollowing(
                                                                                  myUid: uid,
                                                                                  userId: user.id,
                                                                                  bio: user.info.bio,
                                                                                  name: user.info.name,
                                                                                );

                                                                            ref.watch(isFollowProvider).addFollower(
                                                                                  userId: user.id,
                                                                                  bio: followingUser.info.bio,
                                                                                  name: followingUser.info.name,
                                                                                  uid: uid,
                                                                                );
                                                                          },
                                                                          child: const Text(
                                                                            'フォロー',
                                                                            style: TextStyle(
                                                                              fontSize: 20,
                                                                              color: Colors.blue,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      error: (e, _) => const Text('e'),
                                                                      loading: () => const CircularProgressIndicator(),
                                                                    ),
                                                            );
                                                          },
                                                          error: (e, _) => const Text(
                                                            'e',
                                                            style: TextStyle(color: Colors.blue),
                                                          ),
                                                          loading: () => const CircularProgressIndicator(),
                                                        );
                                                      } else {
                                                        return const Text('unk');
                                                      }
                                                    },
                                                    error: (e, _) => const Text('e'),
                                                    loading: () => const CircularProgressIndicator(),
                                                  ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        user.info.name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        user.info.bio,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          userFollowing.when(
                                            data: (user) {
                                              return TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return MyFollowingUserPage(userId: user.id);
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  '${user.following.length} フォロー',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 2,
                                                  ),
                                                ),
                                              );
                                            },
                                            error: (e, _) => const Text('e'),
                                            loading: () => const CircularProgressIndicator(),
                                          ),
                                          const SizedBox(width: 20),
                                          userFollower.when(
                                            data: (user) {
                                              return TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return MyFollowingUserPage(userId: user.id);
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  '${user.follower.length} フォロワー',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 2,
                                                  ),
                                                ),
                                              );
                                            },
                                            error: (e, _) => const Text('e'),
                                            loading: () => const CircularProgressIndicator(),
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
                            userTweets.when(
                              data: (user) {
                                return ListView.builder(
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  itemCount: user.post.length,
                                  itemBuilder: (context, index) => TweetCard(
                                    post: user.post[index],
                                    onPressed: () {},
                                    userInfo: user.info,
                                  ),
                                );
                              },
                              error: (e, _) => const Text('e'),
                              loading: () => const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                error: (e, _) => const Text('e'),
                loading: () => const CircularProgressIndicator(),
              );
        } else {
          return const HomePage();
        }
      },
      error: (e, _) => const Text('e'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
