import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'chat_room.freezed.dart';

part 'chat_room.g.dart';

@freezed
class Chatroom with _$Chatroom {
  const factory Chatroom({
    required String roomId,
    required String uid,
    required String receiverId,
    @Default(<Message>[]) List<Message> message,
  }) = _Chatroom;

  factory Chatroom.fromJson(Map<String, dynamic> json) => _$ChatroomFromJson(json);
}