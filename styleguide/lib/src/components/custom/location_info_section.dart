import 'package:flutter/material.dart';
import 'package:styleguide/style.dart';

class LocationInfoSection extends StatelessWidget {
  const LocationInfoSection({
    required this.gpsEnabled,
    required this.status,
    required this.cachedLocation,
    required this.currentLocation,
    required this.onRefresh,
    required this.onClearCache,
    super.key,
  });

  final bool? gpsEnabled;
  final String status;
  final String? cachedLocation;
  final String? currentLocation;
  final VoidCallback onRefresh;
  final VoidCallback onClearCache;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.size16,
        vertical: Dimens.size32,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('GPS ENABLED'),
              Text(gpsEnabled ?? false ? '🟢' : '🔴'),
            ],
          ),
          AppSpaces.gap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('PERMISSION STATUS'),
              Text(status),
            ],
          ),
          AppSpaces.gap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('SAVED'),
                  AppSpaces.gap02,
                  GestureDetector(
                    onTap: onClearCache,
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Tooltip(
                  message: cachedLocation ?? '-',
                  child: Text(
                    cachedLocation ?? '-',
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          AppSpaces.gap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('CURRENT'),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Tooltip(
                  message: currentLocation ?? '-',
                  child: Text(
                    currentLocation ?? '-',
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          AppSpaces.gap16,
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onRefresh,
              child: const Text('Refresh'),
            ),
          ),
        ],
      ),
    );
  }
}
