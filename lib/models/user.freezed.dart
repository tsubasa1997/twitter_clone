// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  UserInfo get info => throw _privateConstructorUsedError;
  List<Post> get post => throw _privateConstructorUsedError;
  List<Following> get following => throw _privateConstructorUsedError;
  List<Follower> get follower => throw _privateConstructorUsedError;
  List<Chatroom> get chatroom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      UserInfo info,
      List<Post> post,
      List<Following> following,
      List<Follower> follower,
      List<Chatroom> chatroom});

  $UserInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? info = null,
    Object? post = null,
    Object? following = null,
    Object? follower = null,
    Object? chatroom = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<Following>,
      follower: null == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as List<Follower>,
      chatroom: null == chatroom
          ? _value.chatroom
          : chatroom // ignore: cast_nullable_to_non_nullable
              as List<Chatroom>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get info {
    return $UserInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      UserInfo info,
      List<Post> post,
      List<Following> following,
      List<Follower> follower,
      List<Chatroom> chatroom});

  @override
  $UserInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? info = null,
    Object? post = null,
    Object? following = null,
    Object? follower = null,
    Object? chatroom = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      post: null == post
          ? _value._post
          : post // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<Following>,
      follower: null == follower
          ? _value._follower
          : follower // ignore: cast_nullable_to_non_nullable
              as List<Follower>,
      chatroom: null == chatroom
          ? _value._chatroom
          : chatroom // ignore: cast_nullable_to_non_nullable
              as List<Chatroom>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {required this.id,
      required this.info,
      final List<Post> post = const <Post>[],
      final List<Following> following = const <Following>[],
      final List<Follower> follower = const <Follower>[],
      final List<Chatroom> chatroom = const <Chatroom>[]})
      : _post = post,
        _following = following,
        _follower = follower,
        _chatroom = chatroom;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final UserInfo info;
  final List<Post> _post;
  @override
  @JsonKey()
  List<Post> get post {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_post);
  }

  final List<Following> _following;
  @override
  @JsonKey()
  List<Following> get following {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  final List<Follower> _follower;
  @override
  @JsonKey()
  List<Follower> get follower {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_follower);
  }

  final List<Chatroom> _chatroom;
  @override
  @JsonKey()
  List<Chatroom> get chatroom {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatroom);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, info: $info, post: $post, following: $following, follower: $follower, chatroom: $chatroom)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('post', post))
      ..add(DiagnosticsProperty('following', following))
      ..add(DiagnosticsProperty('follower', follower))
      ..add(DiagnosticsProperty('chatroom', chatroom));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._post, _post) &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            const DeepCollectionEquality().equals(other._follower, _follower) &&
            const DeepCollectionEquality().equals(other._chatroom, _chatroom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      info,
      const DeepCollectionEquality().hash(_post),
      const DeepCollectionEquality().hash(_following),
      const DeepCollectionEquality().hash(_follower),
      const DeepCollectionEquality().hash(_chatroom));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      required final UserInfo info,
      final List<Post> post,
      final List<Following> following,
      final List<Follower> follower,
      final List<Chatroom> chatroom}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  UserInfo get info;
  @override
  List<Post> get post;
  @override
  List<Following> get following;
  @override
  List<Follower> get follower;
  @override
  List<Chatroom> get chatroom;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
