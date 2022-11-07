import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/home/user_page.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            return UserPage();
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
    );
  }
}
