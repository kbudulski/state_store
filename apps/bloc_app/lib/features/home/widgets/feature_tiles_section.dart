import 'package:flutter/material.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class FeatureTilesSection extends StatelessWidget {
  const FeatureTilesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.size16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppCardColored(
                  title: 'USER',
                  icon: Icons.person,
                  subtitle: 'authentication',
                  color: Colors.lightGreen,
                ),
              ),
              AppSpaces.gap16,
              Expanded(
                child: AppCardColored(
                  title: 'THEME',
                  icon: Icons.palette,
                  subtitle: 'global updates',
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
          AppSpaces.gap16,
          Row(
            children: [
              Expanded(
                child: AppCardColored(
                  title: 'NOTIFICATIONS',
                  icon: Icons.notifications_active,
                  subtitle: 'local & remote messages, lifecycle, payload',
                  color: Colors.cyan,
                ),
              ),
              //AppSpaces.gap16,
            ],
          ),
        ],
      ),
    );
  }
}
