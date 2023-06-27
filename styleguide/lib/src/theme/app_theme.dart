import 'package:flutter/material.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:shared_dependencies/google_fonts.dart';

extension BuildContextExt on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}

const _kUseMaterial3 = true;
final _kTextTheme = GoogleFonts.rubikTextTheme();

class AppTheme {
  static ThemeData light(FlexScheme? scheme) => FlexThemeData.light(
        scheme: scheme,
        useMaterial3: _kUseMaterial3,
        textTheme: _kTextTheme,
      ).copyWith(
        listTileTheme: ListTileThemeData(
          iconColor: FlexThemeData.light(scheme: scheme).colorScheme.onPrimary,
        ),
      );

  static ThemeData dark(FlexScheme? scheme) => FlexThemeData.dark(
        scheme: scheme,
        useMaterial3: _kUseMaterial3,
        textTheme: _kTextTheme,
      ).copyWith(
        listTileTheme: ListTileThemeData(
          iconColor: FlexThemeData.dark(scheme: scheme).colorScheme.onPrimary,
        ),
      );
}
