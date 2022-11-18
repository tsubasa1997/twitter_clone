import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({
    super.key,
    required this.userInfoName,
    required this.userInfoBio,
  });

  final String userInfoName;
  final String userInfoBio;

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
              Text(
                '編集',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 100,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.blue,
          height: 150,
        ),
        Container(
          transform: Matrix4.translationValues(0.0, -40.0, 0.0),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(''),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '名前',
                ),
                Container(
                  width: 220,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: widget.userInfoName,
                      hintStyle: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
              ],
            ),
            Divider(
              thickness: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '自己紹介',
                ),
                Container(
                  width: 220,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: widget.userInfoBio,
                      hintStyle: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
