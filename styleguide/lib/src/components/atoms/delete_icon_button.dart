import 'package:flutter/material.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({
    required this.isLoading,
    required this.onDelete,
    super.key,
  });

  final bool isLoading;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isLoading
          ? const SizedBox.square(dimension: Dimens.size24, child: AppSpinner())
          : Icon(Icons.delete, color: context.color.error),
      onPressed: () => showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Are you sure you want to delete this image?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: onDelete,
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
