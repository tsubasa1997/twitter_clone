import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/chat_room.dart';
import '../repository/message_repository.dart';

part 'discrimination_chat_providers.freezed.dart';


@freezed
class DiscriminationChatState with _$DiscriminationChatState {
  const factory DiscriminationChatState({
    required String uid,
    required String roomId,
  }) = _DiscriminationChatState;
}

final discriminationChatProvider = StreamProvider.autoDispose.family<Chatroom, DiscriminationChatState>(
      (ref, messageState) => ref.watch(messageRepositoryProvider).listenChatRoom(
    uid: messageState.uid,
    roomId: messageState.roomId,
  ),
);