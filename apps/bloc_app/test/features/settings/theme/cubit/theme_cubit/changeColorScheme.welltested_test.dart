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
      'changeColorScheme updates the colorScheme',
      build: buildCubit,
      act: (cubit) => cubit.changeColorScheme(FlexScheme.bigStone),
      expect: () => const [
        ThemeState(colorScheme: FlexScheme.bigStone),
      ],
    );
  });
}
