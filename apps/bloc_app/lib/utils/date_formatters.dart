import 'package:shared_dependencies/shared_dependencies.dart';

String getFormattedDateWithTime(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('dd.MM.yyyy, kk:mm').format(dateTime);
}
