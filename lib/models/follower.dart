import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower.freezed.dart';

part 'follower.g.dart';

@freezed
class Follower with _$Follower {
  const factory Follower({
    required String id,
    required String name,
    required String bio,
  }) = _Follower;

  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);
}
