import 'package:flutter/material.dart';
import 'package:styleguide/components.dart';

class AppSwitchCard extends StatelessWidget {
  const AppSwitchCard({
    required this.value,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onChanged,
    this.iconBackgroundColor,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconBackgroundColor;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      icon: icon,
      title: title,
      subtitle: subtitle,
      iconBackgroundColor: iconBackgroundColor,
      onTap: () {
        onChanged(!value);
      },
      trailing: AbsorbPointer(
        child: Switch(
          value: value,
          onChanged: (_) {},
          activeColor: Colors.white,
          activeTrackColor: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}
