import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/controllers/message_controller.dart';

class InputChatText extends ConsumerStatefulWidget {
  const InputChatText({
    super.key,
    required this.textEditingController,
    required this.uid,
    required this.receiverId,
    required this.roomId,
  });

  final TextEditingController textEditingController;
  final String uid;
  final String receiverId;
  final String roomId;

  @override
  ConsumerState<InputChatText> createState() => _InputChatTextState();
}

class _InputChatTextState extends ConsumerState<InputChatText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.photo),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                controller: widget.textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(messageProvider).addMessage(
                    chatroomId: widget.roomId,
                    uid: widget.uid,
                    receiverId: widget.receiverId,
                    textMessage: widget.textEditingController.text,
                    createAt: DateTime.now(),
                  );
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
