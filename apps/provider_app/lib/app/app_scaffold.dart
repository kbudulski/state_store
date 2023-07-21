import 'package:flutter/material.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:utils/utils.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(this.child, {super.key});

  final Widget child;

  // TODO(x): add listeners for notifications here
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavBar(
      selectedIndex: _calculateSelectedIndex(context),
      onDestinationSelected: (index) => _onItemTapped(index, context),
      child: child,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final location = context.vRouter.path;
    if (location == (Paths.home)) {
      return 0;
    }
    if (location == (Paths.features)) {
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
        VRouter.of(context).to(Paths.features);
        break;
    }
  }
}
