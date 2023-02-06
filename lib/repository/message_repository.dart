import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/chat_room.dart';
import 'package:twitter_clone/models/message.dart';
import 'package:twitter_clone/models/user.dart';
import '../datasource/firebase_datasource.dart';

final messageRepositoryProvider = Provider(
  (ref) => MessageRepository(ref: ref),
);

class MessageRepository {
  const MessageRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Future<Chatroom> createChatRoomId({required String uid,required String receiverId,}) async {
    final chatRoom = Chatroom(
      roomId: _remote.createChatroomId(uid), receiverId: receiverId, uid: uid,
    );
    return chatRoom;
  }

  Stream<Chatroom> listenUserMessage({required String uid, required String roomId,required String receiverId,}) async* {
    yield* _remote.listenMessages(uid, roomId).map(
          (event) => Chatroom(roomId: roomId, message: event, uid: uid, receiverId: receiverId),
        );
  }

  Stream<List<Chatroom>> listenUserChatRoom({required String uid}) async* {
    yield* _remote.listenChatRoomList(uid);
  }

  Stream<Chatroom> listenChatRoom({required String uid, required String roomId}) async* {
    yield* _remote.listenChatRoom(uid, roomId);
  }


  Future<void> addMessage({
    required String chatroomId,
    required String uid,
    required String receiverId,
    required String textMessage,
    required DateTime createAt,
  }) async {
    final message = Message(
      id: _remote.createMessageId(chatroomId),
      userId: uid,
      message: textMessage,
      createdAt: createAt,
    );
    final userChatRoom = Chatroom(roomId: chatroomId, receiverId: receiverId, uid: uid,);
    final receiverChatRoom = Chatroom(roomId: chatroomId, uid: receiverId, receiverId: uid);
    await _remote.createChatRoom(uid, userChatRoom);
    await _remote.createReceiverChatRoom(receiverId, receiverChatRoom);
    await _remote.addMessage(uid, chatroomId, message);
    await _remote.receiveMessage(receiverId, chatroomId, message);
  }
}
