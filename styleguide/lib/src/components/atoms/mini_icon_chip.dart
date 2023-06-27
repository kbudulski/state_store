import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class MiniIconChip extends StatelessWidget {
  const MiniIconChip({
    required this.icon,
    required this.color,
    super.key,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.size08,
        vertical: Dimens.size02,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        borderRadius: radius(Dimens.size16),
        border: Border.all(color: color),
      ),
      child: Icon(
        icon,
        color: color,
        size: Dimens.size20,
      ),
    );
  }
}
