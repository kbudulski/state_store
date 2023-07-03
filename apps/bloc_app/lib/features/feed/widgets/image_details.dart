import 'package:bloc_app/features/feed/widgets/image_card.dart';
import 'package:bloc_app/utils/date_formatters.dart';
import 'package:firestore_feed_repository/firestore_feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCard(post: post),
          Padding(
            padding: const EdgeInsets.all(Dimens.size16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Author'),
                    Text(post.userName),
                  ],
                ),
                AppSpaces.gap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Created'),
                    Text(getFormattedDateWithTimeMonthText(post.date)),
                  ],
                ),
                const Divider(height: Dimens.size32),
                Text(
                  post.text,
                  textAlign: TextAlign.justify,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
