import 'package:flutter/material.dart';

import '../widget/user_drawer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 45,
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              hintText: '検索',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.amber,
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.amber,
                  )
              ),
            ),
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
