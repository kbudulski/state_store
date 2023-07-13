import 'package:flutter/material.dart';
import 'package:styleguide/src/components/atoms/loading_indicator.dart';
import 'package:styleguide/style.dart';

class AppUploadButton extends StatelessWidget {
  const AppUploadButton({
    required this.isUploading,
    required this.isSuccess,
    required this.onPressed,
    super.key,
  });

  final bool isUploading;
  final bool isSuccess;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppTimes.millis400,
      curve: Curves.easeInOut,
      width: isSuccess ? Dimens.size72 : Dimens.size300,
      child: FilledButton(
        onPressed: onPressed,
        child: AnimatedSwitcher(
          duration: AppTimes.millis400,
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isUploading) {
      return const AppSpinner(onPrimary: true);
    }
    if (isSuccess) {
      return const Icon(Icons.check_circle_outline);
    }
    return const Text('Upload');
  }
}
