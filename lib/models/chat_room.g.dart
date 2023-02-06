// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chatroom _$$_ChatroomFromJson(Map<String, dynamic> json) => _$_Chatroom(
      roomId: json['roomId'] as String,
      uid: json['uid'] as String,
      receiverId: json['receiverId'] as String,
      message: (json['message'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Message>[],
    );

Map<String, dynamic> _$$_ChatroomToJson(_$_Chatroom instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'uid': instance.uid,
      'receiverId': instance.receiverId,
      'message': instance.message,
    };
