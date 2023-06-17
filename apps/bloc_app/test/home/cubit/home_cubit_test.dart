// ignore_for_file: prefer_const_constructors

import 'package:bloc_app/features/home/cubit/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          HomeCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final homeCubit = HomeCubit();
      expect(homeCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<HomeCubit, HomeState>(
      'yourCustomFunction emits nothing',
      build: HomeCubit.new,
      act: (cubit) => cubit.init(),
      expect: () => <HomeState>[],
    );
  });
}
