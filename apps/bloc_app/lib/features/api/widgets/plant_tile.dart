import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/cached_network_image.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class PlantTile extends StatelessWidget {
  const PlantTile({
    required this.image,
    required this.commonName,
    required this.scientificName,
    required this.watering,
    required this.sunlightList,
    required this.onTap,
    super.key,
  });

  final String? image;
  final String commonName;
  final String scientificName;
  final Watering? watering;
  final List<Sunlight>? sunlightList;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: radius(Dimens.size16),
      onTap: onTap,
      child: Row(
        children: [
          _buildImage(),
          AppSpaces.gap16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commonName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleLarge,
                ),
                Text(
                  scientificName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                AppSpaces.gap08,
                Row(
                  children: [
                    ..._buildSunlightIcons(),
                    _buildWateringIcon(),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey)
        ],
      ),
    );
  }

  List<Widget> _buildSunlightIcons() {
    if (sunlightList == null || sunlightList!.isEmpty) {
      return const [SizedBox.shrink()];
    }
    return sunlightList!.map(
      (sun) {
        if (sun == Sunlight.unknown) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(right: Dimens.size04),
          child: MiniIconChip(icon: sun.icon, color: sun.color),
        );
      },
    ).toList();
  }

  Widget _buildWateringIcon() {
    if (watering == null) return const SizedBox.shrink();
    return MiniIconChip(icon: watering!.icon, color: Colors.blueAccent);
  }

  Widget _buildImage() {
    if (image != null) {
      return CachedNetworkImage(
        imageUrl: image!,
        width: Dimens.size80,
        height: Dimens.size88,
        imageBuilder: (_, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: radius(Dimens.size16),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
        placeholder: (_, __) => const AppSpinner(),
      );
    } else {
      return Container(
        width: Dimens.size80,
        height: Dimens.size88,
        decoration: BoxDecoration(
          borderRadius: radius(Dimens.size16),
          color: Colors.grey,
        ),
        child: const Icon(Icons.image_not_supported, color: Colors.white),
      );
    }
  }
}
