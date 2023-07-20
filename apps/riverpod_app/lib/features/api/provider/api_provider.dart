import 'package:api_repository/api_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/providers/repository_providers.dart';
import 'package:utils/utils.dart';

part 'api_provider.freezed.dart';
part 'api_provider.g.dart';

@riverpod
class Api extends _$Api {
  @override
  ApiState build() => const ApiState();

  Future<void> getPlants() async {
    if (state.page == null) return;
    if (state.page! > 1) state = state.copyWith(isLoadingNextPage: true);
    try {
      final plants = await ref.watch(apiRepositoryProvider).getPlants(
            page: state.page!,
            query: state.query,
            sunlight: state.sunlightFilter?.filterText,
            watering: state.wateringFilter?.filterText,
          );
      state = state.copyWith(
        status: ApiStatus.success,
        plants: List.from(state.plants)..addAll(plants.data ?? []),
        isLoadingNextPage: false,
        page: _getNextPage(plants),
      );
    } on Exception catch (error) {
      _emitError(error);
    }
  }

  int? _getNextPage(Plants plants) {
    if (state.page == plants.lastPage || plants.currentPage == null) {
      return null;
    } else {
      return plants.currentPage! + 1;
    }
  }

  Future<void> searchPlants(String query) async {
    state = state.copyWith(
      status: ApiStatus.initial,
      plants: [],
      page: 1,
      query: query,
    );
    await getPlants();
  }

  Future<void> filterPlants({
    required SunlightFilter? sunlightFilter,
    required WateringFilter? wateringFilter,
  }) async {
    state = state.copyWith(
      status: ApiStatus.initial,
      plants: [],
      page: 1,
      sunlightFilter: sunlightFilter,
      wateringFilter: wateringFilter,
    );
    await getPlants();
  }

  void _emitError(Exception error) {
    if (state.status == ApiStatus.initial) {
      state = ApiState(status: ApiStatus.failure, error: error);
    } else {
      state = state.copyWith(nextPageError: error);
    }
  }
}

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
}
