import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class FilePickerField extends StatelessWidget {
  const FilePickerField({
    this.labelText,
    this.helperText,
    this.onTap,
    super.key,
  });

  final String? labelText;
  final String? helperText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: IgnorePointer(
        child: TextField(
          decoration: InputDecoration(
            labelText: labelText,
            helperText: helperText,
            suffixIcon: const Icon(Icons.file_upload),
            filled: true,
            isDense: true,
            border: OutlineInputBorder(borderRadius: radius(Dimens.size08)),
            enabledBorder: OutlineInputBorder(
              borderRadius: radius(Dimens.size08),
              borderSide: BorderSide(color: context.color.primary),
            ),
          ),
        ),
      ),
    );
  }
}
