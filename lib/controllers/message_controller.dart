import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/chat_room.dart';

import '../repository/message_repository.dart';


final messageProvider = Provider(
  (ref) => MessageController(ref: ref),
);

class MessageController {
  const MessageController({required this.ref});

  final Ref ref;

  MessageRepository get _repository => ref.read(messageRepositoryProvider);

  Future<Chatroom> createChatRoomId({required String uid,required String receiverId}) async {
    final chatRoom =  await _repository.createChatRoomId(uid: uid, receiverId: receiverId,);
    return chatRoom;
  }

  Future<void> addMessage({
    required String chatroomId,
    required String uid,
    required String receiverId,
    required String textMessage,
    required DateTime createAt,
  }) async {
    await _repository.addMessage(
      chatroomId: chatroomId,
      uid: uid,
      receiverId: receiverId,
      textMessage: textMessage,
      createAt: createAt,
    );
  }
}
