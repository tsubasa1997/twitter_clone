import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/app.dart';
import 'package:twitter_clone/providers/auth_user_providers.dart';
import 'package:twitter_clone/ui/message/message_page.dart';
import 'package:twitter_clone/ui/notifications/notifications_page.dart';
import 'package:twitter_clone/ui/search/search_page.dart';
import 'package:twitter_clone/controllers/auth_controller.dart';
import 'package:twitter_clone/controllers/home_controller.dart';
import '../sign_in/widget/text_field_input.dart';
import '../tweet/tweets_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });


  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(authUserProvider);
    final index = ref.watch(homeStateProvider);
    return uid.when(
      data: (uid) {
        if (uid != null) {
          return Scaffold(
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
                TweetsPage(
                  uid: uid,
                ),
                SearchPage(
                  uid: uid,
                ),
                NotificationsPage(
                  uid: uid,
                ),
                MessagePage(
                  uid: uid,
                ),
                //'ve2eJV57E94sY7NSJs7z'
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Log In'),
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    TextFieldInput(
                      hintText: 'Enter your e-mail',
                      textEditingController: _emailController,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFieldInput(
                      hintText: 'Enter your password',
                      textEditingController: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(authProvider).signIn(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                      },
                      child: Container(
                        width: 250,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          color: Colors.blue,
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      error: (e, _) => Container(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
