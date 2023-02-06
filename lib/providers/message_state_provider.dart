import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone/models/chat_room.dart';

import '../repository/message_repository.dart';

part 'message_state_provider.freezed.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState({
    required String uid,
    required String roomId,
    required String receiverId,
  }) = _MessageState;
}

final messageProvider = StreamProvider.autoDispose.family<Chatroom, MessageState>(
  (ref, messageState) => ref.watch(messageRepositoryProvider).listenUserMessage(
        uid: messageState.uid,
        roomId: messageState.roomId,
        receiverId: messageState.receiverId,
      ),
);
