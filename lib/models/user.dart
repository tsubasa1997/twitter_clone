import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone/models/following.dart';
import 'package:twitter_clone/models/post.dart';
import 'package:twitter_clone/models/user_info.dart';

import 'follower.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required UserInfo info,
    @Default(<Post>[]) List<Post> post,
    @Default(<Following>[]) List<Following> following,
    @Default(<Follower>[]) List<Follower> follower,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
