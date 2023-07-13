import 'package:bloc_app/features/home/cubit/home_cubit.dart';
import 'package:bloc_app/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_assets/shared_assets.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const Scaffold(
        body: HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome home!'),
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => VRouter.of(context).to(Paths.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: Dimens.size12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.gap16,
            AppCard(
              title: 'REST API',
              coloredLabel: 'Plants',
              icon: Icons.wifi,
              description: 'pagination, searching, filtering',
              image: SharedImages.plants3,
              overlayColor: Colors.lightGreen,
              onTap: () => context.vRouter.to(Paths.api),
            ),
            AppSpaces.gap16,
            AppCard(
              title: 'REALTIME',
              coloredLabel: 'Chat',
              icon: Icons.chat,
              description: 'roles, streams',
              image: SharedImages.plants2,
              overlayColor: Colors.amber,
              onTap: () => context.vRouter.to(Paths.helpFromHome),
            ),
            AppSpaces.gap16,
            AppCard(
              title: 'FIRESTORE',
              coloredLabel: 'Gallery',
              icon: Icons.image,
              description: 'files, upload, storage',
              image: SharedImages.plants1,
              overlayColor: Colors.pink,
              onTap: () => context.vRouter.to(Paths.gallery),
            ),
            const SizedBox(height: Dimens.size64 + Dimens.size32),
          ],
        ),
      ),
    );
  }
}
