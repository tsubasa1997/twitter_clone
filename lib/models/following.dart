import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'following.freezed.dart';

part 'following.g.dart';

@freezed
class Following with _$Following {
  const factory Following({
    required String id,
    required String name,
    required String bio,
  }) = _Following;

  factory Following.fromJson(Map<String, dynamic> json) => _$FollowingFromJson(json);
}