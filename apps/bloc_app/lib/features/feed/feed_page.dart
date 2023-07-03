import 'package:bloc_app/features/feed/cubit/feed_cubit.dart';
import 'package:bloc_app/features/feed/widgets/image_card.dart';
import 'package:bloc_app/features/feed/widgets/image_details.dart';
import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/flutter_staggered_grid_view.dart';
import 'package:shared_dependencies/modal_bottom_sheet.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedCubit(context.read())..fetchPosts(),
      child: const FeedView(),
    );
  }
}

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: [
          IconButton(
            onPressed: () => context.vRouter.to(Paths.addImage),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<FeedCubit, FeedState>(
        builder: (_, state) {
          if (state.isLoading) {
            return const AppSpinner();
          }
          if (state.posts.isEmpty) {
            return const Center(child: Text('No posts found'));
          }
          return RefreshIndicator.adaptive(
            onRefresh: () async => context.read<FeedCubit>().fetchPosts(),
            child: MasonryGridView.builder(
              itemCount: state.posts.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(Dimens.size16),
              mainAxisSpacing: Dimens.size16,
              crossAxisSpacing: Dimens.size16,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (_, index) {
                final post = state.posts[index];
                return ImageCard(
                  post: post,
                  onTap: () => showMaterialModalBottomSheet<void>(
                    animationCurve: Curves.ease,
                    shape: dialogShape(Dimens.size16),
                    context: context,
                    builder: (_) => ImageDetails(post: post),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
