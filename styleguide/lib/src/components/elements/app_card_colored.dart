import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class AppCardColored extends StatelessWidget {
  const AppCardColored({
    required this.title,
    required this.icon,
    this.subtitle,
    this.color,
    this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final String? subtitle;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: radius(Dimens.size32)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: Dimens.size24,
                right: Dimens.size24,
              ),
              alignment: Alignment.topRight,
              child: Icon(
                icon,
                size: Dimens.size32,
                shadows: const [Shadow(blurRadius: 100)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimens.size24),
              child: Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(left: Dimens.size24),
                child: Text(
                  subtitle!,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            AppSpaces.gap24,
          ],
        ),
      ),
    );
  }
}
