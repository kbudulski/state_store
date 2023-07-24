import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/settings/theme/provider/theme_provider.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: Padding(
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
                    currentScheme: theme.colorScheme,
                    themeMode: theme.themeMode,
                    onSchemeChanged: () => ref
                        .read(themesProvider.notifier)
                        .changeColorScheme(scheme.key),
                  );
                },
              ),
            ),
            AppListTile(
              icon: theme.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
              title: 'Dark Mode',
              subtitle: 'Enable dark mode',
              iconBackgroundColor: Colors.black26,
              onTap: ref.read(themesProvider.notifier).toggleDarkMode,
              trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: Theme.of(context).primaryColorLight,
                value: theme.themeMode == ThemeMode.dark,
                onChanged: (_) {
                  ref.read(themesProvider.notifier).toggleDarkMode();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
