// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tweet_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TweetState {
  String? get id => throw _privateConstructorUsedError;
  String? get tweet => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TweetStateCopyWith<TweetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetStateCopyWith<$Res> {
  factory $TweetStateCopyWith(
          TweetState value, $Res Function(TweetState) then) =
      _$TweetStateCopyWithImpl<$Res, TweetState>;
  @useResult
  $Res call({String? id, String? tweet});
}

/// @nodoc
class _$TweetStateCopyWithImpl<$Res, $Val extends TweetState>
    implements $TweetStateCopyWith<$Res> {
  _$TweetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tweet = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tweet: freezed == tweet
          ? _value.tweet
          : tweet // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TweetStateCopyWith<$Res>
    implements $TweetStateCopyWith<$Res> {
  factory _$$_TweetStateCopyWith(
          _$_TweetState value, $Res Function(_$_TweetState) then) =
      __$$_TweetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? tweet});
}

/// @nodoc
class __$$_TweetStateCopyWithImpl<$Res>
    extends _$TweetStateCopyWithImpl<$Res, _$_TweetState>
    implements _$$_TweetStateCopyWith<$Res> {
  __$$_TweetStateCopyWithImpl(
      _$_TweetState _value, $Res Function(_$_TweetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tweet = freezed,
  }) {
    return _then(_$_TweetState(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tweet: freezed == tweet
          ? _value.tweet
          : tweet // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TweetState with DiagnosticableTreeMixin implements _TweetState {
  const _$_TweetState({this.id, this.tweet});

  @override
  final String? id;
  @override
  final String? tweet;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TweetState(id: $id, tweet: $tweet)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TweetState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('tweet', tweet));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TweetState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tweet, tweet) || other.tweet == tweet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, tweet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TweetStateCopyWith<_$_TweetState> get copyWith =>
      __$$_TweetStateCopyWithImpl<_$_TweetState>(this, _$identity);
}

abstract class _TweetState implements TweetState {
  const factory _TweetState({final String? id, final String? tweet}) =
      _$_TweetState;

  @override
  String? get id;
  @override
  String? get tweet;
  @override
  @JsonKey(ignore: true)
  _$$_TweetStateCopyWith<_$_TweetState> get copyWith =>
      throw _privateConstructorUsedError;
}
