import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

typedef OnFiltersApplied = void Function(
  SunlightFilter? sunFilter,
  WateringFilter? waterFilter,
);

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    required this.sunFilter,
    required this.waterFilter,
    required this.onFiltersApplied,
    super.key,
  });

  final SunlightFilter? sunFilter;
  final WateringFilter? waterFilter;
  final OnFiltersApplied onFiltersApplied;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  SunlightFilter? _sunFilter;
  WateringFilter? _waterFilter;

  @override
  void initState() {
    super.initState();
    _sunFilter = widget.sunFilter;
    _waterFilter = widget.waterFilter;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(Dimens.size08),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.size16),
                child: Text(
                  'Sun Exposure',
                  style: context.textTheme.headlineMedium,
                ),
              ),
              AppSpaces.gap08,
              _buildSunChips(context),
              AppSpaces.gap16,
              Text(
                'Watering',
                style: context.textTheme.headlineMedium,
              ),
              AppSpaces.gap08,
              _buildWaterChips(context),
              AppSpaces.gap16,
              _buildButtons(context, widget.onFiltersApplied),
              AppSpaces.gap16,
            ],
          ),
        );
      },
    );
  }

  Wrap _buildSunChips(BuildContext context) {
    return Wrap(
      spacing: Dimens.size08,
      alignment: WrapAlignment.center,
      children: [
        ...SunlightFilter.values.map(
          (sun) => AppChip(
            label: sun.displayText,
            isSelected: sun.index == _sunFilter?.index,
            onSelected: () => setState(() => _sunFilter = sun),
          ),
        ),
      ],
    );
  }

  Wrap _buildWaterChips(BuildContext context) {
    return Wrap(
      spacing: Dimens.size08,
      alignment: WrapAlignment.center,
      children: [
        ...WateringFilter.values.map(
          (water) => AppChip(
            label: water.displayText,
            isSelected: water.index == _waterFilter?.index,
            onSelected: () => setState(() => _waterFilter = water),
          ),
        ),
      ],
    );
  }

  Row _buildButtons(BuildContext context, OnFiltersApplied onFiltersApplied) {
    return Row(
      children: [
        AppSpaces.gap32,
        Expanded(
          child: FilledButton(
            onPressed: () => setState(() {
              _sunFilter = null;
              _waterFilter = null;
            }),
            child: const Text('Clear'),
          ),
        ),
        AppSpaces.gap32,
        Expanded(
          child: FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              onFiltersApplied(_sunFilter, _waterFilter);
            },
            child: const Text('Apply'),
          ),
        ),
        AppSpaces.gap32,
      ],
    );
  }
}
