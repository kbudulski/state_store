// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiState {
  ApiStatus get status => throw _privateConstructorUsedError;
  List<Plant> get plants => throw _privateConstructorUsedError;
  bool get isLoadingNextPage => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  SunlightFilter? get sunlightFilter => throw _privateConstructorUsedError;
  WateringFilter? get wateringFilter => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;
  Exception? get nextPageError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiStateCopyWith<ApiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiStateCopyWith<$Res> {
  factory $ApiStateCopyWith(ApiState value, $Res Function(ApiState) then) =
      _$ApiStateCopyWithImpl<$Res, ApiState>;
  @useResult
  $Res call(
      {ApiStatus status,
      List<Plant> plants,
      bool isLoadingNextPage,
      int? page,
      String? query,
      SunlightFilter? sunlightFilter,
      WateringFilter? wateringFilter,
      Exception? error,
      Exception? nextPageError});
}

/// @nodoc
class _$ApiStateCopyWithImpl<$Res, $Val extends ApiState>
    implements $ApiStateCopyWith<$Res> {
  _$ApiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? plants = null,
    Object? isLoadingNextPage = null,
    Object? page = freezed,
    Object? query = freezed,
    Object? sunlightFilter = freezed,
    Object? wateringFilter = freezed,
    Object? error = freezed,
    Object? nextPageError = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      plants: null == plants
          ? _value.plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<Plant>,
      isLoadingNextPage: null == isLoadingNextPage
          ? _value.isLoadingNextPage
          : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      sunlightFilter: freezed == sunlightFilter
          ? _value.sunlightFilter
          : sunlightFilter // ignore: cast_nullable_to_non_nullable
              as SunlightFilter?,
      wateringFilter: freezed == wateringFilter
          ? _value.wateringFilter
          : wateringFilter // ignore: cast_nullable_to_non_nullable
              as WateringFilter?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
      nextPageError: freezed == nextPageError
          ? _value.nextPageError
          : nextPageError // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiStateCopyWith<$Res> implements $ApiStateCopyWith<$Res> {
  factory _$$_ApiStateCopyWith(
          _$_ApiState value, $Res Function(_$_ApiState) then) =
      __$$_ApiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiStatus status,
      List<Plant> plants,
      bool isLoadingNextPage,
      int? page,
      String? query,
      SunlightFilter? sunlightFilter,
      WateringFilter? wateringFilter,
      Exception? error,
      Exception? nextPageError});
}

/// @nodoc
class __$$_ApiStateCopyWithImpl<$Res>
    extends _$ApiStateCopyWithImpl<$Res, _$_ApiState>
    implements _$$_ApiStateCopyWith<$Res> {
  __$$_ApiStateCopyWithImpl(
      _$_ApiState _value, $Res Function(_$_ApiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? plants = null,
    Object? isLoadingNextPage = null,
    Object? page = freezed,
    Object? query = freezed,
    Object? sunlightFilter = freezed,
    Object? wateringFilter = freezed,
    Object? error = freezed,
    Object? nextPageError = freezed,
  }) {
    return _then(_$_ApiState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      plants: null == plants
          ? _value._plants
          : plants // ignore: cast_nullable_to_non_nullable
              as List<Plant>,
      isLoadingNextPage: null == isLoadingNextPage
          ? _value.isLoadingNextPage
          : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      sunlightFilter: freezed == sunlightFilter
          ? _value.sunlightFilter
          : sunlightFilter // ignore: cast_nullable_to_non_nullable
              as SunlightFilter?,
      wateringFilter: freezed == wateringFilter
          ? _value.wateringFilter
          : wateringFilter // ignore: cast_nullable_to_non_nullable
              as WateringFilter?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
      nextPageError: freezed == nextPageError
          ? _value.nextPageError
          : nextPageError // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_ApiState extends _ApiState {
  const _$_ApiState(
      {this.status = ApiStatus.initial,
      final List<Plant> plants = const [],
      this.isLoadingNextPage = false,
      this.page = 1,
      this.query,
      this.sunlightFilter,
      this.wateringFilter,
      this.error,
      this.nextPageError})
      : _plants = plants,
        super._();

  @override
  @JsonKey()
  final ApiStatus status;
  final List<Plant> _plants;
  @override
  @JsonKey()
  List<Plant> get plants {
    if (_plants is EqualUnmodifiableListView) return _plants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plants);
  }

  @override
  @JsonKey()
  final bool isLoadingNextPage;
  @override
  @JsonKey()
  final int? page;
  @override
  final String? query;
  @override
  final SunlightFilter? sunlightFilter;
  @override
  final WateringFilter? wateringFilter;
  @override
  final Exception? error;
  @override
  final Exception? nextPageError;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._plants, _plants) &&
            (identical(other.isLoadingNextPage, isLoadingNextPage) ||
                other.isLoadingNextPage == isLoadingNextPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.sunlightFilter, sunlightFilter) ||
                other.sunlightFilter == sunlightFilter) &&
            (identical(other.wateringFilter, wateringFilter) ||
                other.wateringFilter == wateringFilter) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.nextPageError, nextPageError) ||
                other.nextPageError == nextPageError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_plants),
      isLoadingNextPage,
      page,
      query,
      sunlightFilter,
      wateringFilter,
      error,
      nextPageError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiStateCopyWith<_$_ApiState> get copyWith =>
      __$$_ApiStateCopyWithImpl<_$_ApiState>(this, _$identity);
}

abstract class _ApiState extends ApiState {
  const factory _ApiState(
      {final ApiStatus status,
      final List<Plant> plants,
      final bool isLoadingNextPage,
      final int? page,
      final String? query,
      final SunlightFilter? sunlightFilter,
      final WateringFilter? wateringFilter,
      final Exception? error,
      final Exception? nextPageError}) = _$_ApiState;
  const _ApiState._() : super._();

  @override
  ApiStatus get status;
  @override
  List<Plant> get plants;
  @override
  bool get isLoadingNextPage;
  @override
  int? get page;
  @override
  String? get query;
  @override
  SunlightFilter? get sunlightFilter;
  @override
  WateringFilter? get wateringFilter;
  @override
  Exception? get error;
  @override
  Exception? get nextPageError;
  @override
  @JsonKey(ignore: true)
  _$$_ApiStateCopyWith<_$_ApiState> get copyWith =>
      throw _privateConstructorUsedError;
}
