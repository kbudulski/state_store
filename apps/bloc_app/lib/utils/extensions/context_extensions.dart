import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}
