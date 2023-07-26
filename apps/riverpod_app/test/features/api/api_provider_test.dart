import 'package:api_repository/api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/api/provider/api_provider.dart';
import 'package:riverpod_app/providers/repository_providers.dart';
import 'package:shared_dependencies/mocktail.dart';
import 'package:utils/utils.dart';

import '../../mocks.dart';
import '../../stubs.dart';

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  ProviderContainer makeProviderContainer() {
    final apiRepository = MockApiRepository();
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
    final container = ProviderContainer(
      overrides: [
        apiRepositoryProvider.overrideWithValue(apiRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('initial state is correct', () {
    final container = makeProviderContainer();
    final listener = Listener<ApiState>();
    container.listen<ApiState>(
      apiProvider,
      listener.call,
      fireImmediately: true,
    );
    verify(() => listener(null, const ApiState()));
    verifyNoMoreInteractions(listener);
  });

  group('PlantsFetched', () {
    test('emits [success] when plants are fetched successfully', () async {
      final container = makeProviderContainer();
      final listener = Listener<ApiState>();
      container.listen<ApiState>(
        apiProvider,
        listener.call,
        fireImmediately: true,
      );
      verify(() => listener(null, const ApiState()));
      verifyNoMoreInteractions(listener);

      await container.read(apiProvider.notifier).getPlants();

      verify(
        () => listener(
          const ApiState(),
          ApiState(
            status: ApiStatus.success,
            plants: plantsStub,
            page: 2,
          ),
        ),
      );
    });
  });

  group('PlantsSearched', () {
    test('emits [success] when plants are searched successfully', () async {
      final container = makeProviderContainer();
      final listener = Listener<ApiState>();
      container.listen<ApiState>(
        apiProvider,
        listener.call,
        fireImmediately: true,
      );
      verify(() => listener(null, const ApiState()));
      verifyNoMoreInteractions(listener);

      await container.read(apiProvider.notifier).searchPlants('happy');

      verify(
        () => listener(
          const ApiState(query: 'happy'),
          ApiState(
            status: ApiStatus.success,
            plants: [happyPlant],
            page: 2,
            query: 'happy',
          ),
        ),
      );
    });
  });

  group('PlantsFiltered', () {
    test('emits [success] when plants are filtered successfully', () async {
      final container = makeProviderContainer();
      final listener = Listener<ApiState>();
      container.listen<ApiState>(
        apiProvider,
        listener.call,
        fireImmediately: true,
      );
      verify(() => listener(null, const ApiState()));
      verifyNoMoreInteractions(listener);

      await container.read(apiProvider.notifier).filterPlants(
            sunlightFilter: SunlightFilter.fullShade,
            wateringFilter: null,
          );

      verify(
        () => listener(
          const ApiState(sunlightFilter: SunlightFilter.fullShade),
          ApiState(
            status: ApiStatus.success,
            plants: [sadPlant],
            page: 2,
            sunlightFilter: SunlightFilter.fullShade,
          ),
        ),
      );
    });
  });
}
