import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/app.dart';
import 'package:twitter_clone/ui/message/message_page.dart';
import 'package:twitter_clone/ui/notifications/notifications_page.dart';
import 'package:twitter_clone/ui/search/search_page.dart';
import 'package:twitter_clone/ui/twit/twit_page.dart';

import 'controller/home_controller.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getPage(index),
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
        physics:  const NeverScrollableScrollPhysics(),
        children: [
          TwitPage(),
          SearchPage(),
          NotificationsPage(),
          MessagePage(),
        ],
      ),
    );
  }
}
