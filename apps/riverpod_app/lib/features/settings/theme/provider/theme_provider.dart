import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/providers/shared_prefs_provider.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:shared_dependencies/nb_utils.dart';

part 'theme_provider.freezed.dart';
part 'theme_provider.g.dart';

@riverpod
class Themes extends _$Themes {
  late final SharedPreferences _cache;

  @override
  FutureOr<ThemeState> build() async {
    _cache = ref.read(sharedPrefsProvider);
    return _initializeTheme();
  }

  Future<ThemeState> _initializeTheme() async {
    final theme = await _cache.getJson('theme') as Map<String, dynamic>?;
    if (theme == null) {
      return state.value!.copyWith(colorScheme: FlexScheme.material);
    } else {
      return ThemeState.fromJson(theme);
    }
  }

  void changeColorScheme(FlexScheme scheme) {
    state = AsyncValue.data(state.value!.copyWith(colorScheme: scheme));
    _cache.setJson('theme', state.value?.toJson());
  }

  void changeThemeMode(ThemeMode mode) {
    state = AsyncValue.data(state.value!.copyWith(themeMode: mode));
    _cache.setJson('theme', state.value?.toJson());
  }

  void toggleDarkMode() {
    if (state.value?.themeMode != ThemeMode.dark) {
      state = AsyncValue.data(
        state.value!.copyWith(themeMode: ThemeMode.dark),
      );
    } else {
      state = AsyncValue.data(
        state.value!.copyWith(themeMode: ThemeMode.light),
      );
    }
    _cache.setJson('theme', state.value?.toJson());
  }
}

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    FlexScheme? colorScheme,
    ThemeMode? themeMode,
  }) = _ThemeState;

  const ThemeState._();

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
}
