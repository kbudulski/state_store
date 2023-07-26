import 'package:api_repository/api_repository.dart';
import 'package:bloc_app/features/api/bloc/api_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_dependencies/mocktail.dart';
import 'package:utils/utils.dart';

import '../../mocks.dart';
import '../../stubs.dart';

void main() {
  group('ApiBloc', () {
    late ApiRepository apiRepository;
    late ApiBloc apiBloc;

    setUp(() {
      apiRepository = MockApiRepository();
      when(
        () => apiRepository.getPlants(
          page: any(named: 'page'),
          query: any(named: 'query'),
          sunlight: any(named: 'sunlight'),
          watering: any(named: 'watering'),
        ),
      ).thenAnswer(
        (_) async => Plants(
          data: plantsStub,
          currentPage: 1,
        ),
      );
      when(
        () => apiRepository.getPlants(
          page: any(named: 'page'),
          query: 'happy',
        ),
      ).thenAnswer(
        (_) async => Plants(
          data: [happyPlant],
          currentPage: 1,
        ),
      );
      when(
        () => apiRepository.getPlants(
          page: any(named: 'page'),
          sunlight: SunlightFilter.fullShade.filterText,
        ),
      ).thenAnswer(
        (_) async => Plants(
          data: [sadPlant],
          currentPage: 1,
        ),
      );
      apiBloc = ApiBloc(apiRepository: apiRepository);
    });

    test('initial state is correct', () {
      expect(apiBloc.state, const ApiState());
    });

    group('PlantsFetched', () {
      blocTest<ApiBloc, ApiState>(
        'emits [success] when plants are fetched successfully',
        build: () => apiBloc,
        act: (bloc) => bloc.add(PlantsFetched()),
        expect: () => [
          ApiState(
            status: ApiStatus.success,
            plants: plantsStub,
            page: 2,
          ),
        ],
      );
    });

    group('PlantsSearched', () {
      blocTest<ApiBloc, ApiState>(
        'emits [success] when plants are searched successfully',
        build: () => apiBloc,
        act: (bloc) => bloc.add(PlantsSearched('happy')),
        expect: () => [
          const ApiState(query: 'happy'),
          ApiState(
            status: ApiStatus.success,
            plants: [happyPlant],
            page: 2,
            query: 'happy',
          ),
        ],
      );
    });

    group('PlantsFiltered', () {
      blocTest<ApiBloc, ApiState>(
        'emits [success] when plants are filtered successfully',
        build: () => apiBloc,
        act: (bloc) => bloc.add(
          PlantsFiltered(
            sunFilter: SunlightFilter.fullShade,
            waterFilter: null,
          ),
        ),
        expect: () => [
          const ApiState(sunlightFilter: SunlightFilter.fullShade),
          ApiState(
            status: ApiStatus.success,
            plants: [sadPlant],
            page: 2,
            sunlightFilter: SunlightFilter.fullShade,
          ),
        ],
      );
    });
  });
}
