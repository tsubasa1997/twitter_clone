import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserCard extends ConsumerWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: const NetworkImage(''),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Name',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text('UserId'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'UserBio',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
