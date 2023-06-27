import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/src/theme/app_theme.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      showCheckmark: false,
      selectedColor: context.color.primary,
      selected: isSelected,
      onSelected: (_) => onSelected(),
      side: _buildChipSide(isSelected, context),
      label: _buildLabel(context),
    );
  }

  Text _buildLabel(BuildContext context) {
    return Text(
      label,
      style: context.textTheme.bodyMedium?.copyWith(
        color: isSelected
            ? context.color.onPrimary
            : context.textTheme.bodyMedium?.color,
      ),
    );
  }

  BorderSide _buildChipSide(bool isSelected, BuildContext context) {
    return isSelected
        ? const BorderSide(color: Colors.transparent)
        : BorderSide(color: context.color.outline.withOpacity(0.5));
  }
}
