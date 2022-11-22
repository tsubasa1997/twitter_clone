import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../Annotation/created_at_field.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    @CreatedAtField() DateTime? createdAt,
    @Default('') String tweet,
  }) = _Post;


  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

