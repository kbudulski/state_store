import 'package:bloc_app/app/app.dart';
import 'package:flutter/material.dart';

class ConnectivityDialog extends StatelessWidget {
  const ConnectivityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('No internet connection'),
      content: const Text(
        'Please check your internet connection and try again.',
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(rootNavigatorKey.currentContext!).pop,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
