import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.coloredLabel,
    required this.title,
    required this.icon,
    required this.image,
    required this.overlayColor,
    required this.description,
    this.onTap,
    super.key,
  });

  final String? coloredLabel;
  final String title;
  final IconData icon;
  final String? description;
  final String image;
  final Color overlayColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius(Dimens.size32),
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onTap,
          splashColor: overlayColor.withOpacity(0.8),
          child: Ink(
            decoration: _buildBackgroundImage(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildColoredLabel(context),
                    _buildIcon(),
                  ],
                ),
                AppSpaces.gap08,
                _buildTitle(context),
                _buildDescription(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundImage() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.fitWidth,
        colorFilter: ColorFilter.mode(
          overlayColor.withOpacity(0.8),
          BlendMode.srcOver,
        ),
      ),
    );
  }

  Padding _buildColoredLabel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimens.size24),
      child: Text(
        coloredLabel!,
        style: context.textTheme.headlineLarge?.copyWith(
          color: overlayColor,
          shadows: [
            const Shadow(blurRadius: 60),
            const Shadow(blurRadius: 16),
          ],
        ),
      ),
    );
  }

  Container _buildIcon() {
    return Container(
      padding: const EdgeInsets.only(
        top: Dimens.size24,
        right: Dimens.size24,
      ),
      alignment: Alignment.topRight,
      child: Icon(
        icon,
        size: Dimens.size60,
        color: Colors.white,
        shadows: const [Shadow(blurRadius: 120)],
      ),
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimens.size24),
      child: Text(
        title,
        style: context.textTheme.displayLarge?.copyWith(
          color: Colors.white,
          fontSize: 50,
          shadows: [const Shadow(blurRadius: 100)],
        ),
      ),
    );
  }

  Padding _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.size24,
        bottom: Dimens.size24,
      ),
      child: Text(
        description!,
        style: context.textTheme.bodyLarge?.copyWith(
          color: Colors.white,
          shadows: [const Shadow(blurRadius: 60)],
        ),
      ),
    );
  }
}
