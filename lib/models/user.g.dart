// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      info: UserInfo.fromJson(json['info'] as Map<String, dynamic>),
      post: (json['post'] as List<dynamic>?)
              ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Post>[],
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => Following.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Following>[],
      follower: (json['follower'] as List<dynamic>?)
              ?.map((e) => Follower.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Follower>[],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'info': instance.info,
      'post': instance.post,
      'following': instance.following,
      'follower': instance.follower,
    };
