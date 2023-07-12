import 'package:flutter/material.dart';
import 'package:styleguide/style.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
              width: double.maxFinite,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: AppTimes.millis400,
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(onTap: onTap),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
