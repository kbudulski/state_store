import 'package:bloc_app/features/settings/about/cubit/about_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

final Uri _termsUri = Uri.parse('https://flutter.dev');
final Uri _policyUri = Uri.parse('https://flutter.dev');

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit()..fetchAppVersion(),
      child: const AboutView(),
    );
  }
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size16).copyWith(
          top: Dimens.size20,
        ),
        child: BlocBuilder<AboutCubit, AboutState>(
          builder: (_, state) {
            if (state is AboutStateLoading) {
              return const LoadingIndicator();
            }
            if (state is AboutStateLoaded) {
              return CardGroup(
                cards: [
                  SimpleCard(
                    icon: Icons.numbers,
                    trailing: const SizedBox.shrink(),
                    title: 'v${state.appVersion}',
                    iconBackgroundColor: Colors.cyan,
                  ),
                  SimpleCard(
                    icon: Icons.info,
                    trailing: const Icon(Icons.arrow_outward),
                    title: 'Terms & conditions',
                    iconBackgroundColor: Colors.cyan,
                    onTap: () => launchUrl(_termsUri),
                  ),
                  SimpleCard(
                    icon: Icons.info,
                    trailing: const Icon(Icons.arrow_outward),
                    title: 'Privacy policy',
                    iconBackgroundColor: Colors.cyan,
                    onTap: () => launchUrl(_policyUri),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
