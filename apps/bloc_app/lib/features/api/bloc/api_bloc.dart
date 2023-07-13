import 'dart:async';

import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_dependencies/rxdart.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

part 'api_bloc.freezed.dart';
part 'api_event.dart';
part 'api_state.dart';

EventTransformer<T> debounce<T>(Duration duration) => (events, mapper) {
      return events.debounceTime(duration).distinct().flatMap(mapper);
    };

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc({
    required this.apiRepository,
  }) : super(const ApiState()) {
    on<PlantsFetched>(
      (_, emit) => _onPlantsFetched(emit),
      transformer: droppable(),
    );
    on<PlantsSearched>(
      _onPlantsSearched,
      transformer: debounce(AppTimes.millis600),
    );
    on<PlantsFiltered>(
      _onPlantsFiltered,
    );
  }

  final ApiRepository apiRepository;

  Future<void> _onPlantsFetched(Emitter<ApiState> emit) async {
    if (state.page == null) return;
    if (state.page! > 1) emit(state.copyWith(isLoadingNextPage: true));
    try {
      final plants = await apiRepository.getPlants(
        page: state.page!,
        query: state.query,
        sunlight: state.sunlightFilter?.filterText,
        watering: state.wateringFilter?.filterText,
      );
      emit(
        state.copyWith(
          status: ApiStatus.success,
          plants: List.from(state.plants)..addAll(plants.data ?? []),
          isLoadingNextPage: false,
          page: _getNextPage(plants),
        ),
      );
    } on Exception catch (error) {
      _emitError(emit, error);
    }
  }

  int? _getNextPage(Plants plants) {
    if (state.page == plants.lastPage || plants.currentPage == null) {
      return null;
    } else {
      return plants.currentPage! + 1;
    }
  }

  Future<void> _onPlantsSearched(
    PlantsSearched event,
    Emitter<ApiState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ApiStatus.initial,
        plants: [],
        page: 1,
        query: event.query,
      ),
    );
    await _onPlantsFetched(emit);
  }

  Future<void> _onPlantsFiltered(
    PlantsFiltered event,
    Emitter<ApiState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ApiStatus.initial,
        plants: [],
        page: 1,
        sunlightFilter: event.sunFilter,
        wateringFilter: event.waterFilter,
      ),
    );
    await _onPlantsFetched(emit);
  }

  void _emitError(Emitter<ApiState> emit, Exception error) {
    if (state.status == ApiStatus.initial) {
      emit(ApiState(status: ApiStatus.failure, error: error));
    } else {
      emit(state.copyWith(nextPageError: error));
    }
  }
}
