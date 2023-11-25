import 'package:bloc_app/features/settings/theme/cubit/theme_cubit.dart';
import 'package:bloc_app/features/settings/theme/cubit/theme_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';

import '../../../../../helpers/hydrated_bloc.dart';

void main() {
  initHydratedStorage();
  group('ThemeCubit', () {
    ThemeCubit buildCubit() => ThemeCubit();

    blocTest<ThemeCubit, ThemeState>(
      'initializeTheme should set colorScheme '
      'to FlexScheme.material if it is null',
      build: buildCubit,
      act: (cubit) => cubit.initializeTheme(),
      expect: () => const [
        ThemeState(colorScheme: FlexScheme.material),
      ],
    );

    blocTest<ThemeCubit, ThemeState>(
      'initializeTheme should not change colorScheme if it is not null',
      build: buildCubit,
      seed: () => const ThemeState(colorScheme: FlexScheme.hippieBlue),
      act: (cubit) => cubit.initializeTheme(),
      expect: () => const <ThemeState>[],
      verify: (cubit) {
        expect(cubit.state.colorScheme, FlexScheme.hippieBlue);
      },
    );
  });
}
