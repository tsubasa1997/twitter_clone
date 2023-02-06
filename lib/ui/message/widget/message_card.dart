import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/message.dart';

class MessageCard extends ConsumerWidget {
  const MessageCard({super.key, required this.message, required this.uid});

  final Message message;
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (message.userId == uid) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(message.message),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Colors.blue[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(message.message),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      );
    }
  }
}
