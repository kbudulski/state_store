import 'package:flutter/material.dart';
import 'package:styleguide/src/tokens/dimensions.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: Dimens.size20),
            Text('Loading...', style: TextStyle(fontSize: Dimens.size20)),
          ],
        ),
      ),
    );
  }
}
