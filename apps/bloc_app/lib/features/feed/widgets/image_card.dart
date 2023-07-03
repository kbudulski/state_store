import 'package:firestore_feed_repository/firestore_feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    required this.post,
    this.onTap,
    super.key,
  });

  final Post post;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius(Dimens.size16),
      child: Stack(
        children: [
          Image.network(
            post.photoUrl,
            fit: BoxFit.fitWidth,
            width: double.maxFinite,
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(onTap: onTap),
            ),
          ),
        ],
      ),
    );
  }
}
