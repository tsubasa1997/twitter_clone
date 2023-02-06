// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chatroom _$ChatroomFromJson(Map<String, dynamic> json) {
  return _Chatroom.fromJson(json);
}

/// @nodoc
mixin _$Chatroom {
  String get roomId => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  List<Message> get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatroomCopyWith<Chatroom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatroomCopyWith<$Res> {
  factory $ChatroomCopyWith(Chatroom value, $Res Function(Chatroom) then) =
      _$ChatroomCopyWithImpl<$Res, Chatroom>;
  @useResult
  $Res call(
      {String roomId, String uid, String receiverId, List<Message> message});
}

/// @nodoc
class _$ChatroomCopyWithImpl<$Res, $Val extends Chatroom>
    implements $ChatroomCopyWith<$Res> {
  _$ChatroomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? uid = null,
    Object? receiverId = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatroomCopyWith<$Res> implements $ChatroomCopyWith<$Res> {
  factory _$$_ChatroomCopyWith(
          _$_Chatroom value, $Res Function(_$_Chatroom) then) =
      __$$_ChatroomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId, String uid, String receiverId, List<Message> message});
}

/// @nodoc
class __$$_ChatroomCopyWithImpl<$Res>
    extends _$ChatroomCopyWithImpl<$Res, _$_Chatroom>
    implements _$$_ChatroomCopyWith<$Res> {
  __$$_ChatroomCopyWithImpl(
      _$_Chatroom _value, $Res Function(_$_Chatroom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? uid = null,
    Object? receiverId = null,
    Object? message = null,
  }) {
    return _then(_$_Chatroom(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chatroom with DiagnosticableTreeMixin implements _Chatroom {
  const _$_Chatroom(
      {required this.roomId,
      required this.uid,
      required this.receiverId,
      final List<Message> message = const <Message>[]})
      : _message = message;

  factory _$_Chatroom.fromJson(Map<String, dynamic> json) =>
      _$$_ChatroomFromJson(json);

  @override
  final String roomId;
  @override
  final String uid;
  @override
  final String receiverId;
  final List<Message> _message;
  @override
  @JsonKey()
  List<Message> get message {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Chatroom(roomId: $roomId, uid: $uid, receiverId: $receiverId, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Chatroom'))
      ..add(DiagnosticsProperty('roomId', roomId))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('receiverId', receiverId))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chatroom &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, uid, receiverId,
      const DeepCollectionEquality().hash(_message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatroomCopyWith<_$_Chatroom> get copyWith =>
      __$$_ChatroomCopyWithImpl<_$_Chatroom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatroomToJson(
      this,
    );
  }
}

abstract class _Chatroom implements Chatroom {
  const factory _Chatroom(
      {required final String roomId,
      required final String uid,
      required final String receiverId,
      final List<Message> message}) = _$_Chatroom;

  factory _Chatroom.fromJson(Map<String, dynamic> json) = _$_Chatroom.fromJson;

  @override
  String get roomId;
  @override
  String get uid;
  @override
  String get receiverId;
  @override
  List<Message> get message;
  @override
  @JsonKey(ignore: true)
  _$$_ChatroomCopyWith<_$_Chatroom> get copyWith =>
      throw _privateConstructorUsedError;
}
