import 'package:bloc_app/features/api_details/cubit/api_details_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_dependencies/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../stubs.dart';

void main() {
  final mockApiRepo = MockApiRepository();

  group('ApiDetailsCubit', () {
    ApiDetailsCubit buildCubit() => ApiDetailsCubit(mockApiRepo);

    blocTest<ApiDetailsCubit, ApiDetailsState>(
      'Should return details when fetch is successful',
      setUp: () {
        when(() => mockApiRepo.getPlantDetails(id: any(named: 'id')))
            .thenAnswer((_) async => plantDetailsStub);
      },
      build: buildCubit,
      act: (cubit) => cubit.fetchPlantDetails('0'),
      expect: () => [
        const ApiDetailsLoading(),
        ApiDetailsLoaded(plantDetailsStub),
      ],
    );

    blocTest<ApiDetailsCubit, ApiDetailsState>(
      'Should return error when fetch fails',
      setUp: () {
        when(() => mockApiRepo.getPlantDetails(id: any(named: 'id')))
            .thenThrow(Exception());
      },
      build: buildCubit,
      act: (cubit) => cubit.fetchPlantDetails('0'),
      expect: () => const [
        ApiDetailsLoading(),
        ApiDetailsError(),
      ],
    );
  });
}
