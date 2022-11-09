import 'package:flutter/material.dart';

import '../../models/post.dart';
import '../../models/user_info.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.userInfo,
    required this.onPressed,
  });

  final UserInfo userInfo;
  final Post post;
  final VoidCallback onPressed;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(''),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.userInfo.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.userInfo.id),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  widget.post.tweet,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
