import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/src/tokens/dimensions.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    required this.icon,
    required this.title,
    this.iconBackgroundColor = Colors.blueAccent,
    this.subtitle,
    this.trailing,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final Color? iconBackgroundColor;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius(Dimens.size24),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            visualDensity: VisualDensity.comfortable,
            contentPadding: const EdgeInsets.only(
              left: Dimens.size16,
              right: Dimens.size12,
            ),
            leading: _buildLeadingIcon(context),
            title: _buildTitle(context),
            subtitle: (subtitle != null) ? _buildSubtitle(context) : null,
            trailing: _buildTrailing(context),
          ),
        ),
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    if (trailing != null) return trailing!;
    return Icon(
      Icons.navigate_next,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }

  Container _buildLeadingIcon(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.size08),
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        borderRadius: radius(Dimens.size12),
      ),
      child: Icon(
        icon,
        size: Dimens.size16,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _buildSubtitle(BuildContext context) {
    return Text(
      subtitle!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
      ),
    );
  }
}
