import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Widget child;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size20),
        child: ClipRRect(
          borderRadius: radius(Dimens.size24),
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
                  color: context.color.secondary,
                ),
              ),
              NavigationDestination(
                label: 'Features',
                icon: const Icon(Icons.offline_bolt),
                selectedIcon: Icon(
                  Icons.offline_bolt,
                  color: context.color.secondary,
                ),
              ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
        ),
      ),
    );
  }
}
