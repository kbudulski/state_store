import 'package:flutter/material.dart';
import 'package:styleguide/src/theme/app_theme.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner({this.onPrimary = false, super.key});

  final bool onPrimary;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: onPrimary ? context.color.onPrimary : null,
      ),
    );
  }
}
