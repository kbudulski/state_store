import 'package:firebase_dependencies/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_assets/shared_assets.dart';
import 'package:shared_dependencies/nb_utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    required this.name,
    required this.onSignedIn,
    super.key,
  });

  final String name;
  final VoidCallback onSignedIn;

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      headerMaxExtent: 300,
      headerBuilder: (_, constraints, ___) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            SharedImages.dash,
            height: constraints.maxHeight * 0.6,
          ),
          Text(
            'State Store',
            style: context.textTheme.displayLarge,
          ),
          Text(
            name,
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
      actions: [
        AuthStateChangeAction<SignedIn>((_, __) => onSignedIn()),
      ],
    );
  }
}
