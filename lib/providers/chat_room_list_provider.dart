import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/chat_room.dart';
import 'package:twitter_clone/repository/message_repository.dart';

import '../datasource/firebase_datasource.dart';
import '../models/user.dart';

final chatRoomListProvider = StreamProvider.autoDispose.family<List<Chatroom>, String>(
      (ref, uid) => ref.watch(firestoreDatasourceProvider).listenChatRoomList(uid),
);

// final chatRoomListProvider = StreamProvider.autoDispose.family<List<Chatroom>, String>(
//       (ref, uid) => ref.watch(messageRepositoryProvider).listenUserChatRoom(uid: uid),
// );