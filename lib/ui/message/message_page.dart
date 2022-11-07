import 'package:flutter/material.dart';

import '../widget/user_drawer.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'メッセージ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
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
      drawer: const UserDrawer(),
    );
  }
}
