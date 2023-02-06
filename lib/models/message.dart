import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../Annotation/created_at_field.dart';

part 'message.freezed.dart';

part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String userId,
    required String message,
    @CreatedAtField() DateTime? createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}