import 'package:bloc_app/features/settings/theme/cubit/theme_cubit.dart';
import 'package:bloc_app/features/settings/theme/cubit/theme_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/hydrated_bloc.dart';

void main() {
  initHydratedStorage();
  group('ThemeCubit', () {
    ThemeCubit buildCubit() => ThemeCubit();

    blocTest<ThemeCubit, ThemeState>(
      'toggleDarkMode toggles themeMode',
      build: buildCubit,
      act: (cubit) => cubit
        ..toggleDarkMode()
        ..toggleDarkMode(),
      expect: () => const [
        ThemeState(themeMode: ThemeMode.dark),
        ThemeState(themeMode: ThemeMode.light),
      ],
    );
  });
}
