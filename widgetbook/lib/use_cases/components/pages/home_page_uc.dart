import 'package:flutter/material.dart';
import 'package:styleguide/components.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'home page',
  type: HomePage,
)
Widget homePageUseCase(BuildContext context) {
  return const HomePage();
}
