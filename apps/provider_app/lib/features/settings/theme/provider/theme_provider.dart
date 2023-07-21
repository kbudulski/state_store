import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider_app/features/settings/theme/provider/theme_state.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utils/utils.dart';

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider(this._cache) : super(const ThemeState());
  final SharedPreferences _cache;

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
