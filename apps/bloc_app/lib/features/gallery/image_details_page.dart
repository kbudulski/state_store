import 'package:bloc_app/features/gallery/cubit/gallery_cubit.dart';
import 'package:firestore_image_repository/firestore_image_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({required this.image, super.key});

  final FireImage image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryState>(
      listenWhen: (_, state) => state.isFileDeleted,
      listener: (context, state) {
        Navigator.of(context).pop();
        context.read<GalleryCubit>().resetState();
      },
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            actions: [
              DeleteIconButton(
                isLoading: state.isLoading,
                onDelete: () async {
                  await context.read<GalleryCubit>().deleteImage(image);
                },
              ),
            ],
          ),
          body: IntrinsicScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.network(
                    image.url,
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimens.size16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSimpleInfoRow(
                        text: 'Author',
                        value: image.userName,
                      ),
                      AppSpaces.gap12,
                      AppSimpleInfoRow(
                        text: 'Created',
                        value: getFormattedDateWithTimeMonthText(
                          image.createdOn,
                        ),
                      ),
                      AppSpaces.gap12,
                      AppSimpleInfoRow(
                        text: 'File',
                        value: image.fileName,
                      ),
                      AppSpaces.gap12,
                      AppSimpleInfoRow(
                        text: 'Size',
                        value: getFileSizeString(bytes: image.size),
                      ),
                      const Divider(height: Dimens.size32),
                      Text(
                        image.description,
                        textAlign: TextAlign.justify,
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
