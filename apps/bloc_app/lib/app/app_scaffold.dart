import 'package:bloc_app/features/settings/notifications/cubit/notifications_cubit.dart';
import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:styleguide/style.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationsCubit, NotificationsState>(
          listenWhen: (previous, current) =>
              previous.path != current.path && current.path != null,
          listener: (BuildContext context, state) {
            VRouter.of(context).to(state.path!);
          },
        ),
        BlocListener<NotificationsCubit, NotificationsState>(
          listenWhen: (previous, current) =>
              previous.dailyText != current.dailyText &&
              current.dailyText != null,
          listener: (BuildContext context, state) {
            showDialog<void>(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Daily reminder'),
                content: Text(state.dailyText!),
              ),
            );
          },
        ),
      ],
      child: ScaffoldWithNavBar(child),
    );
  }
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size08),
        child: child,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(Dimens.size24)),
          child: NavigationBar(
            height: Dimens.size64,
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              NavigationDestination(
                label: 'Home',
                icon: const Icon(Icons.home),
                selectedIcon: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              NavigationDestination(
                label: 'User',
                icon: const Icon(Icons.person),
                selectedIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
            selectedIndex: _calculateSelectedIndex(context),
            onDestinationSelected: (int idx) => _onItemTapped(idx, context),
          ),
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final location = context.vRouter.path;
    if (location == (Paths.home)) {
      return 0;
    }
    if (location == (Paths.user)) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        VRouter.of(context).to(Paths.home);
        break;
      case 1:
        VRouter.of(context).to(Paths.user);
        break;
    }
  }
}
