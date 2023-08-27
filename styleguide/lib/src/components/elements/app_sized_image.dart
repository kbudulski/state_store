import 'package:flutter/material.dart';
import 'package:shared_dependencies/cached_network_image.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class AppSizedImage extends StatelessWidget {
  const AppSizedImage({
    required this.photo,
    required this.height,
    this.width = double.maxFinite,
    super.key,
  });

  final String photo;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photo,
      width: width,
      height: height,
      imageBuilder: (_, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: radius(Dimens.size16),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (_, __, ___) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius(Dimens.size16),
            color: Colors.grey,
          ),
          child: const Icon(Icons.image_not_supported, color: Colors.white),
        );
      },
      placeholder: (_, __) => const AppSpinner(),
    );
  }
}
