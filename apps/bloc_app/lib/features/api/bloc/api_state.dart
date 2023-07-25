part of 'api_bloc.dart';

enum ApiStatus { initial, success, failure }

@freezed
class ApiState with _$ApiState {
  const factory ApiState({
    @Default(ApiStatus.initial) ApiStatus status,
    @Default([]) List<Plant> plants,
    @Default(false) bool isLoadingNextPage,
    @Default(1) int? page,
    String? query,
    SunlightFilter? sunlightFilter,
    WateringFilter? wateringFilter,
    Exception? error,
    Exception? nextPageError,
  }) = _ApiState;

  const ApiState._();

  @override
  String toString() => 'ApiState('
      'status: $status, '
      'plants: ${plants.length}, '
      'isLoadingNextPage: $isLoadingNextPage, '
      'page: $page, '
      'query: $query, '
      'sunlightFilter: $sunlightFilter, '
      'wateringFilter: $wateringFilter, '
      'error: $error, '
      'nextPageError: $nextPageError)';
}
