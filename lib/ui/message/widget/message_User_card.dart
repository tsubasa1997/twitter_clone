import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/chat_room.dart';
import 'package:twitter_clone/providers/discrimination_chat_providers.dart';
import 'package:twitter_clone/providers/message_state_provider.dart';
import 'package:twitter_clone/providers/user_info_providers.dart';
import 'package:twitter_clone/ui/message/widget/chat_room.dart';

class MessageUserCard extends ConsumerWidget {
  const MessageUserCard({
    super.key,
    required this.uid,
    required this.chatroom,
  });

  final String uid;
  final Chatroom chatroom;

  // final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoom = ref.watch(discriminationChatProvider(DiscriminationChatState(
      uid: uid,
      roomId: chatroom.roomId,
    )));

    return chatRoom.when(
      data: (chatRoom) {
        final message = ref.watch(messageProvider(MessageState(
          uid: chatRoom.uid,
          roomId: chatRoom.roomId,
          receiverId: chatRoom.receiverId,
        )));

        if (chatroom.receiverId == uid) {
          final info = ref.watch(userInfoProvider(chatroom.uid));
          return Container(
            width: 200,
            height: 80,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return ChatRoom(receiverId: chatroom.receiverId, roomId: chatroom.roomId, uid: uid);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          info.when(
                            data: (user) {
                              return Text(user.info.name);
                            },
                            error: (e, _) => const Text('e'),
                            loading: () => const CircularProgressIndicator(),
                          ),
                          message.when(
                            data: (message) {
                              return Text(message.message.last.message);
                            },
                            error: (e, _) => const Text('e'),
                            loading: () => const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (chatroom.uid == uid) {
          final info = ref.watch(userInfoProvider(chatroom.receiverId));
          return Container(
            width: 200,
            height: 80,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return ChatRoom(receiverId: chatroom.receiverId, roomId: chatroom.roomId, uid: uid);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          info.when(
                            data: (user) {
                              return Text(user.info.name);
                            },
                            error: (e, _) => const Text('e'),
                            loading: () => const CircularProgressIndicator(),
                          ),
                          message.when(
                            data: (message) {
                              return Text(message.message.last.message);
                            },
                            error: (e, _) => const Text('e'),
                            loading: () => const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: Text('メッセージはありません'),
        );
      },
      error: (e, _) => const Text('e'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
