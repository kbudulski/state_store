import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    required this.onChanged,
    this.hintText,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: hintText,
        isDense: true,
        filled: true,
        fillColor: context.color.inversePrimary,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: radius(Dimens.size16),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimens.size16,
          vertical: Dimens.size08,
        ),
      ),
    );
  }
}
