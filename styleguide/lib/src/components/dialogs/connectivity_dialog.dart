import 'package:flutter/material.dart';

class ConnectivityDialog extends StatelessWidget {
  const ConnectivityDialog(this.globalContext, {super.key});

  final BuildContext globalContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('No internet connection'),
      content: const Text(
        'Please check your internet connection and try again.',
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(globalContext).pop,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
