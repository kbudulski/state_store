import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class AppUploadProgressIndicator extends StatelessWidget {
  const AppUploadProgressIndicator(this.uploadPercent, {super.key});

  final double uploadPercent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: Dimens.size300,
      alignment: MainAxisAlignment.center,
      padding: EdgeInsets.zero,
      lineHeight: Dimens.size20,
      percent: uploadPercent,
      barRadius: radiusCircular(Dimens.size32),
      animation: true,
      animateFromLastPercent: true,
      center: Text('${(uploadPercent * 100).toStringAsFixed(0)}%'),
      backgroundColor: context.color.outline.withOpacity(0.4),
      linearGradient: LinearGradient(
        colors: [context.color.primary, context.color.secondary],
      ),
    );
  }
}
