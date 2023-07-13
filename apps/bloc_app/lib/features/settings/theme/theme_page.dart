import 'package:bloc_app/features/settings/theme/cubit/theme_cubit.dart';
import 'package:bloc_app/features/settings/theme/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (_, state) {
          return Padding(
            padding: const EdgeInsets.only(
              left: Dimens.size16,
              top: Dimens.size20,
              right: Dimens.size16,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: Dimens.size20),
                  child: ListView.separated(
                    separatorBuilder: (_, __) => AppSpaces.gap12,
                    itemCount: FlexColor.schemes.entries.length,
                    padding: const EdgeInsets.only(
                      top: Dimens.size100,
                      bottom: Dimens.size12,
                    ),
                    itemBuilder: (_, index) {
                      final scheme = FlexColor.schemes.entries.elementAt(index);
                      return ThemeCard(
                        scheme: scheme,
                        currentScheme: state.colorScheme,
                        themeMode: state.themeMode,
                        onSchemeChanged: () => context
                            .read<ThemeCubit>()
                            .changeColorScheme(scheme.key),
                      );
                    },
                  ),
                ),
                AppListTile(
                  icon: state.themeMode == ThemeMode.dark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  title: 'Dark Mode',
                  subtitle: 'Enable dark mode',
                  iconBackgroundColor: Colors.black26,
                  onTap: context.read<ThemeCubit>().toggleDarkMode,
                  trailing: Switch(
                    activeColor: Colors.white,
                    activeTrackColor: Theme.of(context).primaryColorLight,
                    value: state.themeMode == ThemeMode.dark,
                    onChanged: (_) {
                      context.read<ThemeCubit>().toggleDarkMode();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
