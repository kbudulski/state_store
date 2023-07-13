import 'dart:math';

String getFileSizeString({required int bytes, int decimals = 2}) {
  const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
  if (bytes == 0) return '0 ${suffixes[0]}';
  final i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}
