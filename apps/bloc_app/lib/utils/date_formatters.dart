import 'package:shared_dependencies/intl.dart';

String getFormattedDateWithTime(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('dd.MM.yyyy, kk:mm').format(dateTime);
}

String getFormattedDate(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('dd.MM.yyyy').format(dateTime);
}

String getFormattedTime(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('HH:mm').format(dateTime);
}
