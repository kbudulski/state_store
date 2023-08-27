// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AboutState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLightSide => throw _privateConstructorUsedError;
  bool get premium => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutStateCopyWith<AboutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutStateCopyWith<$Res> {
  factory $AboutStateCopyWith(
          AboutState value, $Res Function(AboutState) then) =
      _$AboutStateCopyWithImpl<$Res, AboutState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLightSide,
      bool premium,
      String? photo,
      String? appVersion});
}

/// @nodoc
class _$AboutStateCopyWithImpl<$Res, $Val extends AboutState>
    implements $AboutStateCopyWith<$Res> {
  _$AboutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLightSide = null,
    Object? premium = null,
    Object? photo = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLightSide: null == isLightSide
          ? _value.isLightSide
          : isLightSide // ignore: cast_nullable_to_non_nullable
              as bool,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AboutStateCopyWith<$Res>
    implements $AboutStateCopyWith<$Res> {
  factory _$$_AboutStateCopyWith(
          _$_AboutState value, $Res Function(_$_AboutState) then) =
      __$$_AboutStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLightSide,
      bool premium,
      String? photo,
      String? appVersion});
}

/// @nodoc
class __$$_AboutStateCopyWithImpl<$Res>
    extends _$AboutStateCopyWithImpl<$Res, _$_AboutState>
    implements _$$_AboutStateCopyWith<$Res> {
  __$$_AboutStateCopyWithImpl(
      _$_AboutState _value, $Res Function(_$_AboutState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLightSide = null,
    Object? premium = null,
    Object? photo = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_$_AboutState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLightSide: null == isLightSide
          ? _value.isLightSide
          : isLightSide // ignore: cast_nullable_to_non_nullable
              as bool,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AboutState implements _AboutState {
  const _$_AboutState(
      {this.isLoading = false,
      this.isLightSide = true,
      this.premium = false,
      this.photo,
      this.appVersion});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLightSide;
  @override
  @JsonKey()
  final bool premium;
  @override
  final String? photo;
  @override
  final String? appVersion;

  @override
  String toString() {
    return 'AboutState(isLoading: $isLoading, isLightSide: $isLightSide, premium: $premium, photo: $photo, appVersion: $appVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AboutState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLightSide, isLightSide) ||
                other.isLightSide == isLightSide) &&
            (identical(other.premium, premium) || other.premium == premium) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isLightSide, premium, photo, appVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AboutStateCopyWith<_$_AboutState> get copyWith =>
      __$$_AboutStateCopyWithImpl<_$_AboutState>(this, _$identity);
}

abstract class _AboutState implements AboutState {
  const factory _AboutState(
      {final bool isLoading,
      final bool isLightSide,
      final bool premium,
      final String? photo,
      final String? appVersion}) = _$_AboutState;

  @override
  bool get isLoading;
  @override
  bool get isLightSide;
  @override
  bool get premium;
  @override
  String? get photo;
  @override
  String? get appVersion;
  @override
  @JsonKey(ignore: true)
  _$$_AboutStateCopyWith<_$_AboutState> get copyWith =>
      throw _privateConstructorUsedError;
}
