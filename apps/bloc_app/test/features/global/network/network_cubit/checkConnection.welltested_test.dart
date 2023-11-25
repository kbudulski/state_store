import 'package:bloc_app/features/global/network/network_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_dependencies/connectivity_plus.dart';
import 'package:shared_dependencies/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  group('NetworkCubit', () {
    late MockConnectivity mockConnectivity;

    NetworkCubit buildCubit() => NetworkCubit(mockConnectivity);

    setUp(() {
      mockConnectivity = MockConnectivity();
      when(() => mockConnectivity.onConnectivityChanged).thenAnswer(
        (_) => const Stream.empty(),
      );
    });

    test('initial state is null', () {
      expect(buildCubit().state, null);
    });

    blocTest<NetworkCubit, ConnectivityResult?>(
      'emits [ConnectivityResult.mobile] when connectivity is mobile',
      setUp: () {
        when(mockConnectivity.checkConnectivity).thenAnswer(
          (_) => Future.value(ConnectivityResult.mobile),
        );
      },
      build: buildCubit,
      act: (cubit) => cubit.checkConnection(),
      expect: () => [ConnectivityResult.mobile],
    );

    blocTest<NetworkCubit, ConnectivityResult?>(
      'emits [ConnectivityResult.wifi] when connectivity is wifi',
      setUp: () {
        when(mockConnectivity.checkConnectivity).thenAnswer(
          (_) => Future.value(ConnectivityResult.wifi),
        );
      },
      build: buildCubit,
      act: (cubit) => cubit.checkConnection(),
      expect: () => [ConnectivityResult.wifi],
    );

    blocTest<NetworkCubit, ConnectivityResult?>(
      'emits [ConnectivityResult.ethernet] when connectivity is ethernet',
      setUp: () {
        when(mockConnectivity.checkConnectivity).thenAnswer(
          (_) => Future.value(ConnectivityResult.ethernet),
        );
      },
      build: buildCubit,
      act: (cubit) => cubit.checkConnection(),
      expect: () => [ConnectivityResult.ethernet],
    );

    blocTest<NetworkCubit, ConnectivityResult?>(
      'emits [ConnectivityResult.none] when connectivity is none',
      setUp: () {
        when(mockConnectivity.checkConnectivity).thenAnswer(
          (_) => Future.value(ConnectivityResult.none),
        );
      },
      build: buildCubit,
      act: (cubit) => cubit.checkConnection(),
      expect: () => [ConnectivityResult.none],
    );
  });
}
