// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'following.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Following _$FollowingFromJson(Map<String, dynamic> json) {
  return _Following.fromJson(json);
}

/// @nodoc
mixin _$Following {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingCopyWith<Following> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingCopyWith<$Res> {
  factory $FollowingCopyWith(Following value, $Res Function(Following) then) =
      _$FollowingCopyWithImpl<$Res, Following>;
  @useResult
  $Res call({String id, String name, String bio});
}

/// @nodoc
class _$FollowingCopyWithImpl<$Res, $Val extends Following>
    implements $FollowingCopyWith<$Res> {
  _$FollowingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bio = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FollowingCopyWith<$Res> implements $FollowingCopyWith<$Res> {
  factory _$$_FollowingCopyWith(
          _$_Following value, $Res Function(_$_Following) then) =
      __$$_FollowingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String bio});
}

/// @nodoc
class __$$_FollowingCopyWithImpl<$Res>
    extends _$FollowingCopyWithImpl<$Res, _$_Following>
    implements _$$_FollowingCopyWith<$Res> {
  __$$_FollowingCopyWithImpl(
      _$_Following _value, $Res Function(_$_Following) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bio = null,
  }) {
    return _then(_$_Following(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Following with DiagnosticableTreeMixin implements _Following {
  const _$_Following({required this.id, required this.name, required this.bio});

  factory _$_Following.fromJson(Map<String, dynamic> json) =>
      _$$_FollowingFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String bio;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Following(id: $id, name: $name, bio: $bio)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Following'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('bio', bio));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Following &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, bio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowingCopyWith<_$_Following> get copyWith =>
      __$$_FollowingCopyWithImpl<_$_Following>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowingToJson(
      this,
    );
  }
}

abstract class _Following implements Following {
  const factory _Following(
      {required final String id,
      required final String name,
      required final String bio}) = _$_Following;

  factory _Following.fromJson(Map<String, dynamic> json) =
      _$_Following.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get bio;
  @override
  @JsonKey(ignore: true)
  _$$_FollowingCopyWith<_$_Following> get copyWith =>
      throw _privateConstructorUsedError;
}
