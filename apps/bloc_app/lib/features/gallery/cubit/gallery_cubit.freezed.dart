// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryState {
  List<FireImage> get images => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFileDeleted => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryStateCopyWith<GalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res, GalleryState>;
  @useResult
  $Res call(
      {List<FireImage> images,
      bool isLoading,
      bool isFileDeleted,
      Exception? error});
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res, $Val extends GalleryState>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? isLoading = null,
    Object? isFileDeleted = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FireImage>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFileDeleted: null == isFileDeleted
          ? _value.isFileDeleted
          : isFileDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GalleryStateCopyWith<$Res>
    implements $GalleryStateCopyWith<$Res> {
  factory _$$_GalleryStateCopyWith(
          _$_GalleryState value, $Res Function(_$_GalleryState) then) =
      __$$_GalleryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FireImage> images,
      bool isLoading,
      bool isFileDeleted,
      Exception? error});
}

/// @nodoc
class __$$_GalleryStateCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$_GalleryState>
    implements _$$_GalleryStateCopyWith<$Res> {
  __$$_GalleryStateCopyWithImpl(
      _$_GalleryState _value, $Res Function(_$_GalleryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? isLoading = null,
    Object? isFileDeleted = null,
    Object? error = freezed,
  }) {
    return _then(_$_GalleryState(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FireImage>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFileDeleted: null == isFileDeleted
          ? _value.isFileDeleted
          : isFileDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_GalleryState implements _GalleryState {
  const _$_GalleryState(
      {final List<FireImage> images = const [],
      this.isLoading = false,
      this.isFileDeleted = false,
      this.error})
      : _images = images;

  final List<FireImage> _images;
  @override
  @JsonKey()
  List<FireImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isFileDeleted;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'GalleryState(images: $images, isLoading: $isLoading, isFileDeleted: $isFileDeleted, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryState &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFileDeleted, isFileDeleted) ||
                other.isFileDeleted == isFileDeleted) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      isLoading,
      isFileDeleted,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryStateCopyWith<_$_GalleryState> get copyWith =>
      __$$_GalleryStateCopyWithImpl<_$_GalleryState>(this, _$identity);
}

abstract class _GalleryState implements GalleryState {
  const factory _GalleryState(
      {final List<FireImage> images,
      final bool isLoading,
      final bool isFileDeleted,
      final Exception? error}) = _$_GalleryState;

  @override
  List<FireImage> get images;
  @override
  bool get isLoading;
  @override
  bool get isFileDeleted;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryStateCopyWith<_$_GalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}
