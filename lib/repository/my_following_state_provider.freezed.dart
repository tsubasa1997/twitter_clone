// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../providers/my_following_state_provider.dart';

// **************************************************************************
// FrozeGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyFollowingState {
  String get userId => throw _privateConstructorUsedError;
  String get myUid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyFollowingStateCopyWith<MyFollowingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyFollowingStateCopyWith<$Res> {
  factory $MyFollowingStateCopyWith(
          MyFollowingState value, $Res Function(MyFollowingState) then) =
      _$MyFollowingStateCopyWithImpl<$Res, MyFollowingState>;
  @useResult
  $Res call({String userId, String myUid});
}

/// @nodoc
class _$MyFollowingStateCopyWithImpl<$Res, $Val extends MyFollowingState>
    implements $MyFollowingStateCopyWith<$Res> {
  _$MyFollowingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? myUid = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      myUid: null == myUid
          ? _value.myUid
          : myUid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyFollowingStateCopyWith<$Res>
    implements $MyFollowingStateCopyWith<$Res> {
  factory _$$_MyFollowingStateCopyWith(
          _$_MyFollowingState value, $Res Function(_$_MyFollowingState) then) =
      __$$_MyFollowingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String myUid});
}

/// @nodoc
class __$$_MyFollowingStateCopyWithImpl<$Res>
    extends _$MyFollowingStateCopyWithImpl<$Res, _$_MyFollowingState>
    implements _$$_MyFollowingStateCopyWith<$Res> {
  __$$_MyFollowingStateCopyWithImpl(
      _$_MyFollowingState _value, $Res Function(_$_MyFollowingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? myUid = null,
  }) {
    return _then(_$_MyFollowingState(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      myUid: null == myUid
          ? _value.myUid
          : myUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MyFollowingState
    with DiagnosticableTreeMixin
    implements _MyFollowingState {
  const _$_MyFollowingState({required this.userId, required this.myUid});

  @override
  final String userId;
  @override
  final String myUid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyFollowingState(userId: $userId, myUid: $myUid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyFollowingState'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('myUid', myUid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyFollowingState &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.myUid, myUid) || other.myUid == myUid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, myUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyFollowingStateCopyWith<_$_MyFollowingState> get copyWith =>
      __$$_MyFollowingStateCopyWithImpl<_$_MyFollowingState>(this, _$identity);
}

abstract class _MyFollowingState implements MyFollowingState {
  const factory _MyFollowingState(
      {required final String userId,
      required final String myUid}) = _$_MyFollowingState;

  @override
  String get userId;
  @override
  String get myUid;
  @override
  @JsonKey(ignore: true)
  _$$_MyFollowingStateCopyWith<_$_MyFollowingState> get copyWith =>
      throw _privateConstructorUsedError;
}
