import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    required String name,
    required String bio,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  factory UserInfo.fromDoc(DocumentSnapshot doc) {
    return UserInfo(
      id: doc.id,
      name: doc['name'],
      bio: doc['bio'],
    );
  }
}