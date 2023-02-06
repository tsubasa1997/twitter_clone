import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/providers/chat_room_list_provider.dart';
import 'package:twitter_clone/ui/message/widget/message_User_card.dart';
import '../utils/logger.dart';

class MessagePage extends ConsumerStatefulWidget {
  const MessagePage({super.key, required this.uid});

  final String uid;

  @override
  ConsumerState<MessagePage> createState() => _MessagePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _MessagePageState extends ConsumerState<MessagePage> {
  @override
  Widget build(BuildContext context) {
    final chatRoom = ref.watch(chatRoomListProvider(widget.uid));

    return chatRoom.when(
      data: (chatRoom) {
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
          ),
          body: ListView.builder(
              itemCount: chatRoom.length,
              itemBuilder: (context, index) {
                return MessageUserCard(
                  uid: widget.uid,
                  chatroom: chatRoom[index],
                );
              }),
        );
      },
      error: (error, __) {
        logger.warning(error);
        return const Center(
          child: Text('error'),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
