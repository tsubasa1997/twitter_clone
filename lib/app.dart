import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/sign_in/log_in_page.dart';
import 'package:twitter_clone/ui/sign_in/welcome_page.dart';


class AppColor {
  static const brand = Colors.blue;
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.brand,
        appBarTheme: const AppBarTheme(color: AppColor.brand),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.brand),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.brand,
        ),
        // textTheme: Theme.of(context)
        //     .textTheme
        //     .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: WelcomePage(),
    );
  }
}
