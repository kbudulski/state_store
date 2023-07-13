import 'package:bloc_app/features/global/auth/auth_cubit.dart';
import 'package:bloc_app/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthCubit bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.size16).copyWith(
            top: Dimens.size20,
          ),
          child: Column(
            children: [
              AppUserInfoCard(
                userName: user.name ?? 'User',
                userPhotoURL: NetworkImage(user.photoURL ?? ''),
              ),
              AppSpaces.gap20,
              AppTileGroup(
                cards: [
                  AppListTile(
                    icon: Icons.perm_identity,
                    title: user.name ?? '',
                    subtitle: 'User name',
                    trailing: const SizedBox.shrink(),
                  ),
                ],
              ),
              AppSpaces.gap20,
              AppTileGroup(
                cards: [
                  AppListTile(
                    icon: Icons.mail_outline,
                    title: user.email ?? '',
                    subtitle: 'Email',
                    trailing: const SizedBox.shrink(),
                  ),
                  AppListTile(
                    icon: Icons.verified,
                    title: user.emailVerified ?? false ? 'Yes' : 'No',
                    subtitle: 'Email verified',
                    trailing: const SizedBox.shrink(),
                  ),
                ],
              ),
              AppSpaces.gap20,
              AppTileGroup(
                cards: [
                  AppListTile(
                    icon: Icons.build_circle_outlined,
                    title: getFormattedDateWithTime(user.creationTime),
                    subtitle: 'Account created',
                    trailing: const SizedBox.shrink(),
                  ),
                  AppListTile(
                    icon: Icons.query_builder,
                    title: getFormattedDateWithTime(user.lastSignInTime),
                    subtitle: 'Last signed in',
                    trailing: const SizedBox.shrink(),
                  ),
                ],
              ),
              AppSpaces.gap20,
              AppTileGroup(
                cards: [
                  AppListTile(
                    icon: Icons.logout,
                    title: 'Logout',
                    subtitle: 'Logout from the app',
                    iconBackgroundColor: Colors.redAccent,
                    onTap: () async {
                      await context.read<AuthCubit>().signOut().then(
                            (_) => context.vRouter.to(Paths.login),
                          );
                    },
                    trailing: const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
