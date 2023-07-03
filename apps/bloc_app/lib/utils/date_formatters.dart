import 'package:shared_dependencies/intl.dart';

String getFormattedDateWithTime(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('dd.MM.yyyy, HH:mm').format(dateTime);
}

String getFormattedDateWithTimeMonthText(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('dd MMM yyyy, HH:mm').format(dateTime);
}

String getFormattedDate(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('dd.MM.yyyy').format(dateTime);
}

String getFormattedTime(DateTime? dateTime) {
  if (dateTime == null) return '-';
  return DateFormat('HH:mm').format(dateTime);
}
