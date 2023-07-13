import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class AppSimpleInfoRow extends StatelessWidget {
  const AppSimpleInfoRow({
    required this.text,
    required this.value,
    super.key,
  });

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: context.textTheme.bodyLarge),
        AppSpaces.gap16,
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
