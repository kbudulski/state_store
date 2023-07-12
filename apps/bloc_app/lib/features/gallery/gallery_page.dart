import 'package:bloc_app/features/gallery/cubit/gallery_cubit.dart';
import 'package:bloc_app/features/gallery/widgets/image_details_page.dart';
import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/flutter_staggered_grid_view.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();
    context.read<GalleryCubit>().fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery'), scrolledUnderElevation: 0),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: context.color.primary,
        onPressed: () => context.vRouter.to(Paths.addImage),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<GalleryCubit, GalleryState>(
        builder: (_, state) {
          if (state.isLoading) {
            return const AppSpinner();
          }
          if (state.images.isEmpty) {
            return const Center(child: Text('No images found'));
          }
          return RefreshIndicator(
            onRefresh: context.read<GalleryCubit>().fetchImages,
            child: MasonryGridView.count(
              itemCount: state.images.length,
              padding: const EdgeInsets.symmetric(vertical: Dimens.size16),
              crossAxisSpacing: Dimens.size08,
              mainAxisSpacing: Dimens.size08,
              crossAxisCount: 3,
              itemBuilder: (context, index) {
                final image = state.images[index];
                return ImageCard(
                  imageUrl: image.url,
                  onTap: () => showDialog<void>(
                    context: context,
                    useSafeArea: false,
                    builder: (_) => ImageDetailsPage(image: image),
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
