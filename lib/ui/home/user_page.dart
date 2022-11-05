import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPage extends ConsumerWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -40.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(radius: 45, backgroundImage: NetworkImage('')),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Hello japan',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      '200 フォロー',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '2000 フォロワー',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}