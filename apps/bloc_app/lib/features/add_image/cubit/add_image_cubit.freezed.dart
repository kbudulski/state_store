// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_image_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddImageState {
  String get description => throw _privateConstructorUsedError;
  bool get isUploading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  double get uploadPercent => throw _privateConstructorUsedError;
  PlatformFile? get file => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddImageStateCopyWith<AddImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddImageStateCopyWith<$Res> {
  factory $AddImageStateCopyWith(
          AddImageState value, $Res Function(AddImageState) then) =
      _$AddImageStateCopyWithImpl<$Res, AddImageState>;
  @useResult
  $Res call(
      {String description,
      bool isUploading,
      bool isSuccess,
      double uploadPercent,
      PlatformFile? file,
      Exception? error});
}

/// @nodoc
class _$AddImageStateCopyWithImpl<$Res, $Val extends AddImageState>
    implements $AddImageStateCopyWith<$Res> {
  _$AddImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? isUploading = null,
    Object? isSuccess = null,
    Object? uploadPercent = null,
    Object? file = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadPercent: null == uploadPercent
          ? _value.uploadPercent
          : uploadPercent // ignore: cast_nullable_to_non_nullable
              as double,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddImageStateCopyWith<$Res>
    implements $AddImageStateCopyWith<$Res> {
  factory _$$_AddImageStateCopyWith(
          _$_AddImageState value, $Res Function(_$_AddImageState) then) =
      __$$_AddImageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      bool isUploading,
      bool isSuccess,
      double uploadPercent,
      PlatformFile? file,
      Exception? error});
}

/// @nodoc
class __$$_AddImageStateCopyWithImpl<$Res>
    extends _$AddImageStateCopyWithImpl<$Res, _$_AddImageState>
    implements _$$_AddImageStateCopyWith<$Res> {
  __$$_AddImageStateCopyWithImpl(
      _$_AddImageState _value, $Res Function(_$_AddImageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? isUploading = null,
    Object? isSuccess = null,
    Object? uploadPercent = null,
    Object? file = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_AddImageState(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadPercent: null == uploadPercent
          ? _value.uploadPercent
          : uploadPercent // ignore: cast_nullable_to_non_nullable
              as double,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_AddImageState extends _AddImageState {
  const _$_AddImageState(
      {this.description = '',
      this.isUploading = false,
      this.isSuccess = false,
      this.uploadPercent = 0,
      this.file,
      this.error})
      : super._();

  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool isUploading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final double uploadPercent;
  @override
  final PlatformFile? file;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'AddImageState(description: $description, isUploading: $isUploading, isSuccess: $isSuccess, uploadPercent: $uploadPercent, file: $file, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddImageState &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.uploadPercent, uploadPercent) ||
                other.uploadPercent == uploadPercent) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, isUploading,
      isSuccess, uploadPercent, file, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddImageStateCopyWith<_$_AddImageState> get copyWith =>
      __$$_AddImageStateCopyWithImpl<_$_AddImageState>(this, _$identity);
}

abstract class _AddImageState extends AddImageState {
  const factory _AddImageState(
      {final String description,
      final bool isUploading,
      final bool isSuccess,
      final double uploadPercent,
      final PlatformFile? file,
      final Exception? error}) = _$_AddImageState;
  const _AddImageState._() : super._();

  @override
  String get description;
  @override
  bool get isUploading;
  @override
  bool get isSuccess;
  @override
  double get uploadPercent;
  @override
  PlatformFile? get file;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$_AddImageStateCopyWith<_$_AddImageState> get copyWith =>
      throw _privateConstructorUsedError;
}
