// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String,
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
      tweet: json['tweet'] as String? ?? '',
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
      'tweet': instance.tweet,
    };
