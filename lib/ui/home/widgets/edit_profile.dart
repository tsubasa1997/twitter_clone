import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/home/controller/profile_controller.dart';
import 'package:twitter_clone/ui/home/my_profile_page.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({
    super.key,
    required this.userInfoId,
    required this.userInfoName,
    required this.userInfoBio,
    required this.userId,
  });

  final String userId;
  final String userInfoId;
  final String userInfoName;
  final String userInfoBio;

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  final _NameController = TextEditingController();
  final _BioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _NameController.dispose();
    _BioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('編集'),
        leading: Container(
          margin: const EdgeInsets.only(
            left: 15,
          ),
          child: OverflowBox(
            maxWidth: 90,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'キャンセル',
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(profileStateProvider.notifier).updateProfile(
                    id: widget.userInfoId,
                    name: _NameController.text,
                    bio: _BioController.text,
                  );
              Navigator.of(context).pop();
            },
            child: const Text(
              '保存',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
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
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(''),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    '名前',
                  ),
                  Container(
                    width: 220,
                    child: TextField(
                      controller: _NameController,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: widget.userInfoName,
                        hintStyle: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    '自己紹介',
                  ),
                  Container(
                    width: 220,
                    child: TextField(
                      controller: _BioController,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: widget.userInfoBio,
                        hintStyle: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
