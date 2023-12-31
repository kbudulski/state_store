import 'package:bloc_app/features/settings/theme/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:shared_dependencies/welltested.dart';

@Welltested(excludedMethods: ['fromJson', 'toJson'])
class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void initializeTheme() {
    if (state.colorScheme == null) {
      emit(state.copyWith(colorScheme: FlexScheme.material));
    }
  }

  void changeColorScheme(FlexScheme scheme) {
    emit(state.copyWith(colorScheme: scheme));
  }

  void toggleDarkMode() {
    if (state.themeMode != ThemeMode.dark) {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.light));
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) => ThemeState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ThemeState state) => state.toJson();
}
