// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'discrimination_chat_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscriminationChatState {
  String get uid => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscriminationChatStateCopyWith<DiscriminationChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscriminationChatStateCopyWith<$Res> {
  factory $DiscriminationChatStateCopyWith(DiscriminationChatState value,
          $Res Function(DiscriminationChatState) then) =
      _$DiscriminationChatStateCopyWithImpl<$Res, DiscriminationChatState>;
  @useResult
  $Res call({String uid, String roomId});
}

/// @nodoc
class _$DiscriminationChatStateCopyWithImpl<$Res,
        $Val extends DiscriminationChatState>
    implements $DiscriminationChatStateCopyWith<$Res> {
  _$DiscriminationChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? roomId = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscriminationChatStateCopyWith<$Res>
    implements $DiscriminationChatStateCopyWith<$Res> {
  factory _$$_DiscriminationChatStateCopyWith(_$_DiscriminationChatState value,
          $Res Function(_$_DiscriminationChatState) then) =
      __$$_DiscriminationChatStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String roomId});
}

/// @nodoc
class __$$_DiscriminationChatStateCopyWithImpl<$Res>
    extends _$DiscriminationChatStateCopyWithImpl<$Res,
        _$_DiscriminationChatState>
    implements _$$_DiscriminationChatStateCopyWith<$Res> {
  __$$_DiscriminationChatStateCopyWithImpl(_$_DiscriminationChatState _value,
      $Res Function(_$_DiscriminationChatState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? roomId = null,
  }) {
    return _then(_$_DiscriminationChatState(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DiscriminationChatState
    with DiagnosticableTreeMixin
    implements _DiscriminationChatState {
  const _$_DiscriminationChatState({required this.uid, required this.roomId});

  @override
  final String uid;
  @override
  final String roomId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DiscriminationChatState(uid: $uid, roomId: $roomId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DiscriminationChatState'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('roomId', roomId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscriminationChatState &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscriminationChatStateCopyWith<_$_DiscriminationChatState>
      get copyWith =>
          __$$_DiscriminationChatStateCopyWithImpl<_$_DiscriminationChatState>(
              this, _$identity);
}

abstract class _DiscriminationChatState implements DiscriminationChatState {
  const factory _DiscriminationChatState(
      {required final String uid,
      required final String roomId}) = _$_DiscriminationChatState;

  @override
  String get uid;
  @override
  String get roomId;
  @override
  @JsonKey(ignore: true)
  _$$_DiscriminationChatStateCopyWith<_$_DiscriminationChatState>
      get copyWith => throw _privateConstructorUsedError;
}
