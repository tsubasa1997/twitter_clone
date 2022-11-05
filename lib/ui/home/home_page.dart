

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/app.dart';
import 'package:twitter_clone/ui/home/user_page.dart';
import 'package:twitter_clone/ui/message/message_page.dart';
import 'package:twitter_clone/ui/notifications/notifications_page.dart';
import 'package:twitter_clone/ui/search/search_page.dart';
import 'package:twitter_clone/ui/twit/twit_page.dart';

import 'controller/home_controller.dart';


class HomePage extends ConsumerWidget {
   HomePage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  String getPage(int index) {
    switch (index) {
      case 0:
        return 'twit';
      case 1:
        return 'search';
      case 2:
        return 'notification';
      case 3:
        return 'message';
      default:
        return '';
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeStateProvider);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          userId,
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
      drawer: Drawer(
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
                              return const UserPage();
                            },
                          ),
                        );
                      },
                      icon: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/564x/9b/47/a0/9b47a023caf29f113237d61170f34ad9.jpg',
                        ),
                      ),
                    ),
                    const Text(
                      'Name',
                      style: const TextStyle(fontSize: 25),
                    ),
                    const Text(
                      '@xxxxxx',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.pending),
                ),
              ],
            ),
            Row(
              children: [
                Text('200フォロー'),
                SizedBox(
                  width: 15,
                ),
                Text('2000フォロワー'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: index == 0 ? AppColor.brand : Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: index == 1 ? AppColor.brand : Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: index == 2 ? AppColor.brand : Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: index == 3 ? AppColor.brand : Colors.blue,
            ),
          ),
        ],
        onTap: (value) =>
            ref.read(homeStateProvider.notifier).onNavigationTap(value),
        currentIndex: index,
      ),
      body: PageView(
        controller: ref.watch(homeStateProvider.notifier).pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const TwitPage(),
          const SearchPage(),
          const NotificationsPage(),
          const MessagePage(),
        ],
      ),
    );
  }
}
