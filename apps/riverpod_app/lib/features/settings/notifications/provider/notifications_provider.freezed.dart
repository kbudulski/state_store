// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationsState {
  AuthorizationStatus get status => throw _privateConstructorUsedError;
  bool get isRefreshingPermissions => throw _privateConstructorUsedError;
  String? get dailyText => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationsStateCopyWith<NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
  @useResult
  $Res call(
      {AuthorizationStatus status,
      bool isRefreshingPermissions,
      String? dailyText,
      String? path});
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isRefreshingPermissions = null,
    Object? dailyText = freezed,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthorizationStatus,
      isRefreshingPermissions: null == isRefreshingPermissions
          ? _value.isRefreshingPermissions
          : isRefreshingPermissions // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyText: freezed == dailyText
          ? _value.dailyText
          : dailyText // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationsStateCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$_NotificationsStateCopyWith(_$_NotificationsState value,
          $Res Function(_$_NotificationsState) then) =
      __$$_NotificationsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthorizationStatus status,
      bool isRefreshingPermissions,
      String? dailyText,
      String? path});
}

/// @nodoc
class __$$_NotificationsStateCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$_NotificationsState>
    implements _$$_NotificationsStateCopyWith<$Res> {
  __$$_NotificationsStateCopyWithImpl(
      _$_NotificationsState _value, $Res Function(_$_NotificationsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isRefreshingPermissions = null,
    Object? dailyText = freezed,
    Object? path = freezed,
  }) {
    return _then(_$_NotificationsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthorizationStatus,
      isRefreshingPermissions: null == isRefreshingPermissions
          ? _value.isRefreshingPermissions
          : isRefreshingPermissions // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyText: freezed == dailyText
          ? _value.dailyText
          : dailyText // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NotificationsState implements _NotificationsState {
  const _$_NotificationsState(
      {this.status = AuthorizationStatus.notDetermined,
      this.isRefreshingPermissions = false,
      this.dailyText,
      this.path});

  @override
  @JsonKey()
  final AuthorizationStatus status;
  @override
  @JsonKey()
  final bool isRefreshingPermissions;
  @override
  final String? dailyText;
  @override
  final String? path;

  @override
  String toString() {
    return 'NotificationsState(status: $status, isRefreshingPermissions: $isRefreshingPermissions, dailyText: $dailyText, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(
                    other.isRefreshingPermissions, isRefreshingPermissions) ||
                other.isRefreshingPermissions == isRefreshingPermissions) &&
            (identical(other.dailyText, dailyText) ||
                other.dailyText == dailyText) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, isRefreshingPermissions, dailyText, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsStateCopyWith<_$_NotificationsState> get copyWith =>
      __$$_NotificationsStateCopyWithImpl<_$_NotificationsState>(
          this, _$identity);
}

abstract class _NotificationsState implements NotificationsState {
  const factory _NotificationsState(
      {final AuthorizationStatus status,
      final bool isRefreshingPermissions,
      final String? dailyText,
      final String? path}) = _$_NotificationsState;

  @override
  AuthorizationStatus get status;
  @override
  bool get isRefreshingPermissions;
  @override
  String? get dailyText;
  @override
  String? get path;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsStateCopyWith<_$_NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
