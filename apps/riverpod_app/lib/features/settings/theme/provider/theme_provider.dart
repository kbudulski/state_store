import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/providers/shared_prefs/shared_prefs_provider.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:shared_dependencies/nb_utils.dart';

part 'theme_provider.freezed.dart';
part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Themes extends _$Themes {
  late final SharedPreferences _cache;

  @override
  ThemeState build() {
    _cache = ref.read(sharedPrefsProvider);
    return const ThemeState();
  }

  Future<void> initializeTheme() async {
    final theme = await _cache.getJson('theme') as Map<String, dynamic>?;
    if (theme == null) {
      state = state.copyWith(colorScheme: FlexScheme.material);
    } else {
      state = ThemeState.fromJson(theme);
    }
  }

  void changeColorScheme(FlexScheme scheme) {
    state = state.copyWith(colorScheme: scheme);
    _cache.setJson('theme', state.toJson());
  }

  void changeThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    _cache.setJson('theme', state.toJson());
  }

  void toggleDarkMode() {
    if (state.themeMode != ThemeMode.dark) {
      state = state.copyWith(themeMode: ThemeMode.dark);
    } else {
      state = state.copyWith(themeMode: ThemeMode.light);
    }
    _cache.setJson('theme', state.toJson());
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
