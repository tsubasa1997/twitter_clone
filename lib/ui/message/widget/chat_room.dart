import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/providers/message_state_provider.dart';
import 'package:twitter_clone/providers/user_info_providers.dart';
import 'package:twitter_clone/ui/message/widget/input_chat_text.dart';
import 'package:twitter_clone/ui/message/widget/message_card.dart';

class ChatRoom extends ConsumerStatefulWidget {
  const ChatRoom({super.key, required this.receiverId, required this.roomId, required this.uid});

  final String receiverId;
  final String uid;
  final String roomId;

  @override
  ConsumerState<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends ConsumerState<ChatRoom> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final chatUser = ref.watch(userInfoProvider(widget.receiverId));
    final myUser = ref.watch(userInfoProvider(widget.uid));
    final chatRoom = ref.watch(messageProvider(MessageState(
      uid: widget.uid,
      roomId: widget.roomId,
      receiverId: widget.receiverId,
    )));
    final TextEditingController messageController = TextEditingController();

    return myUser.when(
      data: (uid) {
        return Scaffold(
          appBar: AppBar(
            title: chatUser.when(
              data: (chatUser) {
                return Text(chatUser.info.name);
              },
              error: (e, _) => const Text('e'),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
          body: chatUser.when(
            data: (chatUser) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 32,
                      ),
                      child: chatRoom.when(
                        data: (chatRoom) {
                          if (chatRoom.message.isNotEmpty) {
                            return ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: chatRoom.message.length,
                              itemBuilder: (context, index) => MessageCard(
                                message: chatRoom.message[index],
                                uid: widget.uid,
                              ),
                            );
                          }
                          return null;
                        },
                        error: (e, _) => const Text('e'),
                        loading: () => const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InputChatText(
                    textEditingController: messageController,
                    uid: uid.id,
                    receiverId: chatUser.id,
                    roomId: widget.roomId,
                  ),
                ],
              );
            },
            error: (e, _) => const Text('e'),
            loading: () => const CircularProgressIndicator(),
          ),
        );
      },
      error: (e, _) => const Text('e'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
