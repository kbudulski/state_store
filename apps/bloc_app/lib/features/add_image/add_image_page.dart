import 'package:bloc_app/features/add_image/cubit/add_image_cubit.dart';
import 'package:bloc_app/features/gallery/cubit/gallery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class AddImagePage extends StatelessWidget {
  const AddImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddImageCubit(context.read(), context.read()),
      child: const AddImageView(),
    );
  }
}

class AddImageView extends StatelessWidget {
  const AddImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Add image')),
        body: BlocConsumer<AddImageCubit, AddImageState>(
          listenWhen: (_, AddImageState state) => state.isSuccess,
          listener: _goBackAndRefreshGallery,
          builder: (_, state) {
            return Padding(
              padding: const EdgeInsets.all(Dimens.size16),
              child: Column(
                children: [
                  FilePickerField(
                    labelText: state.file != null ? state.file!.name : 'File',
                    helperText: 'Select an image to upload',
                    onTap: context.read<AddImageCubit>().onFilePicked,
                  ),
                  AppSpaces.gap24,
                  AppTextField(
                    labelText: 'Description',
                    helperText: 'Enter a description for the image',
                    maxLines: 3,
                    onChanged: context.read<AddImageCubit>().descriptionChanged,
                  ),
                  const Spacer(),
                  UploadProgressIndicator(state.uploadPercent),
                  AppSpaces.gap16,
                  UploadButton(
                    isUploading: state.isUploading,
                    isSuccess: state.isSuccess,
                    onPressed: state.areFieldsFilled
                        ? context.read<AddImageCubit>().uploadImage
                        : null,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _goBackAndRefreshGallery(BuildContext context, AddImageState state) =>
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      }).then((_) => context.read<GalleryCubit>().fetchImages());
}
