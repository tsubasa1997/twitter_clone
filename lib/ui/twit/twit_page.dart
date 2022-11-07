import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/widget/user_drawer.dart';

import '../home/user_page.dart';

class TwitPage extends StatefulWidget {
  const TwitPage({Key? key}) : super(key: key);

  @override
  State<TwitPage> createState() => _TwitPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _TwitPageState extends State<TwitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'home',
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
      drawer: UserDrawer(),
    );
  }
}
