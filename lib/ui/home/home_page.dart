<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/home/widgets/bottom_Navi.dart';

class UserPage extends ConsumerWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox.shrink(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -40.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/9b/47/a0/9b47a023caf29f113237d61170f34ad9.jpg',
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '@xxxxxxxxx',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Hello Japan'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('200フォロー'),
                    SizedBox(
                      width: 10,
                    ),
                    Text('2000フォロワー'),
                  ],
                ),
              ],
            ),
          ),
=======


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

  var _scaffoldKey = GlobalKey<ScaffoldState>();

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
>>>>>>> Stashed changes
        ],
      ),
    );
  }
}
