import 'package:bloc_app/utils/enum/filter_enums.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    required this.sunFilter,
    required this.waterFilter,
    required this.onPressed,
    super.key,
  });

  final SunlightFilter? sunFilter;
  final WateringFilter? waterFilter;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(Dimens.size12),
      style: _getFilterButtonStyle(context),
      icon: const Icon(Icons.filter_alt),
      onPressed: onPressed,
    );
  }

  ButtonStyle _getFilterButtonStyle(BuildContext context) {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: radius(Dimens.size16)),
      ),
      backgroundColor: MaterialStateProperty.all(
        context.color.inversePrimary,
      ),
    );
  }
}
