import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: context.textTheme.headlineMedium?.copyWith(color: Colors.red),
      ),
    );
  }
}
