// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_state_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageState {
  String get uid => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageStateCopyWith<MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res, MessageState>;
  @useResult
  $Res call({String uid, String roomId, String receiverId});
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res, $Val extends MessageState>
    implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? roomId = null,
    Object? receiverId = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageStateCopyWith<$Res>
    implements $MessageStateCopyWith<$Res> {
  factory _$$_MessageStateCopyWith(
          _$_MessageState value, $Res Function(_$_MessageState) then) =
      __$$_MessageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String roomId, String receiverId});
}

/// @nodoc
class __$$_MessageStateCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$_MessageState>
    implements _$$_MessageStateCopyWith<$Res> {
  __$$_MessageStateCopyWithImpl(
      _$_MessageState _value, $Res Function(_$_MessageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? roomId = null,
    Object? receiverId = null,
  }) {
    return _then(_$_MessageState(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MessageState with DiagnosticableTreeMixin implements _MessageState {
  const _$_MessageState(
      {required this.uid, required this.roomId, required this.receiverId});

  @override
  final String uid;
  @override
  final String roomId;
  @override
  final String receiverId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageState(uid: $uid, roomId: $roomId, receiverId: $receiverId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageState'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('roomId', roomId))
      ..add(DiagnosticsProperty('receiverId', receiverId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageState &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, roomId, receiverId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageStateCopyWith<_$_MessageState> get copyWith =>
      __$$_MessageStateCopyWithImpl<_$_MessageState>(this, _$identity);
}

abstract class _MessageState implements MessageState {
  const factory _MessageState(
      {required final String uid,
      required final String roomId,
      required final String receiverId}) = _$_MessageState;

  @override
  String get uid;
  @override
  String get roomId;
  @override
  String get receiverId;
  @override
  @JsonKey(ignore: true)
  _$$_MessageStateCopyWith<_$_MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}
