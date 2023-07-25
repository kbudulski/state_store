import 'package:bloc_app/features/global/auth/auth_cubit.dart';
import 'package:bloc_app/features/global/network/network_cubit.dart';
import 'package:bloc_app/features/maps/cubit/maps_cubit.dart';
import 'package:bloc_app/features/maps/maps_page.dart';
import 'package:bloc_app/features/settings/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().state.user.name ?? 'Unknown';
    final theme =
        context.watch<ThemeCubit>().state.colorScheme?.name ?? 'Unknown';
    final network = context.watch<NetworkCubit>().state?.name ?? 'Unknown';
    final location =
        context.watch<MapsCubit>().state.cachedLocation ?? 'Unknown';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppSpaces.gap32,
              AppCardColored(
                title: 'USER',
                icon: Icons.person,
                subtitle: 'login, authentication | $user',
                color: Colors.lightGreen,
                onTap: () => context.vRouter.to(Paths.profileFromFeatures),
              ),
              AppSpaces.gap16,
              AppCardColored(
                title: 'THEME',
                icon: Icons.palette,
                subtitle: 'color schemes, dark mode | $theme',
                color: Colors.pinkAccent,
                onTap: () => context.vRouter.to(Paths.themeFromFeatures),
              ),
              AppSpaces.gap16,
              AppCardColored(
                title: 'NOTIFICATIONS',
                icon: Icons.notifications_active,
                subtitle: 'local & remote messages, lifecycle, payload',
                color: Colors.cyan,
                onTap: () =>
                    context.vRouter.to(Paths.notificationsFromFeatures),
              ),
              AppSpaces.gap16,
              AppCardColored(
                title: 'CONNECTIVITY',
                icon: Icons.network_check,
                subtitle: 'network listeners, offline info | $network',
                color: Colors.orangeAccent,
                onTap: () => context.read<NetworkCubit>().checkConnection(),
              ),
              AppSpaces.gap16,
              AppCardColored(
                title: 'LOCATION',
                icon: Icons.gps_fixed,
                subtitle: 'maps | $location',
                color: Colors.deepPurpleAccent,
                onTap: () {
                  showDialog<void>(
                    context: context,
                    useSafeArea: false,
                    builder: (_) => const MapsPage(),
                  );
                },
              ),
              const SizedBox(height: Dimens.size64 + Dimens.size32),
            ],
          ),
        ),
      ),
    );
  }
}
