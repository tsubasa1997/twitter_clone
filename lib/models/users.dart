import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone/models/user.dart';

part 'users.freezed.dart';

part 'users.g.dart';

@freezed
class Users with _$Users {
  const factory Users({
    @Default(<User>[]) List<User> users,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}