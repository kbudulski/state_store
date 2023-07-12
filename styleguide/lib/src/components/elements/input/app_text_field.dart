import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.labelText,
    this.helperText,
    this.onChanged,
    this.maxLines,
    super.key,
  });

  final String? labelText;
  final String? helperText;
  final ValueChanged<String>? onChanged;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(borderRadius: radius(Dimens.size08)),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius(Dimens.size08),
          borderSide: BorderSide(color: context.color.primary),
        ),
      ),
    );
  }
}
