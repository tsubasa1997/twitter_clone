import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/my_page/my_profile_page.dart';
import 'package:twitter_clone/providers/user_follower_providers.dart';
import 'package:twitter_clone/providers/user_following_providers.dart';
import 'package:twitter_clone/providers/user_info_providers.dart';
import 'package:twitter_clone/controllers/auth_controller.dart';
import 'package:twitter_clone/ui/sign_in/welcome_page.dart';

class UserDrawer extends ConsumerStatefulWidget {
  const UserDrawer({super.key, required this.userId});

  final String userId;

  @override
  ConsumerState<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends ConsumerState<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userInfoProvider(widget.userId));
    final following = ref.watch(userFollowingProvider(widget.userId));
    final follower = ref.watch(userFollowerProvider(widget.userId));

    return user.when(
      data: (user) {
        return Drawer(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push<void>(
                            MaterialPageRoute(
                              builder: (context) {
                                return MyProfilePage(
                                  userId: widget.userId,
                                );
                              },
                            ),
                          );
                        },
                        icon: const CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      Text(
                        user.info.name,
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: const Text('ログアウトしますか？'),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      ref.read(authProvider).signOut();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const WelcomePage();
                                          },
                                        ),
                                      );
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.pending),
                  ),
                ],
              ),
              Row(
                children: [
                  following.when(
                    data: (user) {
                      return Text('${user.following.length}フォロー');
                    },
                    error: (e, _) => const Text('e'),
                    loading: () => const CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  follower.when(
                    data: (user) {
                      return Text('${user.follower.length}フォロワー');
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
  }
}
