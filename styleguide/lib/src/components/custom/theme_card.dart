import 'package:flutter/material.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    required this.scheme,
    required this.themeMode,
    required this.onSchemeChanged,
    this.currentScheme,
    super.key,
  });

  final MapEntry<FlexScheme, FlexSchemeData> scheme;
  final ThemeMode? themeMode;
  final FlexScheme? currentScheme;
  final VoidCallback onSchemeChanged;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius(Dimens.size24),
      child: Material(
        color: _getPrimaryColor(scheme.value, themeMode),
        child: InkWell(
          onTap: onSchemeChanged,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: Dimens.size16),
                  child: Text(
                    scheme.value.name,
                    style: TextStyle(
                      color: _getOnPrimaryColor(scheme.key, themeMode),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              FlexThemeModeOptionButton(
                borderRadius: 6,
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(Dimens.size04),
                elevation: 12,
                optionButtonMargin: const EdgeInsets.all(Dimens.size08),
                flexSchemeColor: FlexSchemeColor.from(
                  primary: _getPrimaryColor(scheme.value, themeMode),
                  secondary: _getSecondaryColor(scheme.value, themeMode),
                ),
                selectedBorder: const BorderSide(
                  color: Colors.pink,
                  width: Dimens.size02,
                ),
                unselectedBorder: const BorderSide(
                  color: Colors.white24,
                  width: Dimens.size02,
                ),
                optionButtonBorderRadius: Dimens.size24,
                selected: scheme.key == currentScheme,
                onSelect: onSchemeChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getPrimaryColor(FlexSchemeData scheme, ThemeMode? themeMode) {
    return themeMode == ThemeMode.light
        ? scheme.light.primary
        : scheme.dark.primary;
  }

  Color _getSecondaryColor(FlexSchemeData scheme, ThemeMode? themeMode) {
    return themeMode == ThemeMode.light
        ? scheme.light.secondary
        : scheme.dark.secondary;
  }

  Color? _getOnPrimaryColor(FlexScheme scheme, ThemeMode? themeMode) {
    return themeMode == ThemeMode.light
        ? FlexThemeData.light(scheme: scheme).colorScheme.onPrimary
        : FlexThemeData.dark(scheme: scheme).colorScheme.onPrimary;
  }
}
