import 'package:intl/intl.dart';

class DateFormatter {
  String formatTime(DateTime dateTime) {
    final formatter = DateFormat('hh:mm a');
    final formatted = formatter.format(dateTime);
    return formatted;
  }

  String dateToReadable(DateTime dateTime) {
    final formatter = DateFormat('EEE, dd MMM yyyy');
    final formatted = formatter.format(dateTime);

    return formatted;
  }

  String timeToReadable(DateTime dateTime) {
    final formatter = DateFormat('hh:mm a');
    final formatted = formatter.format(dateTime);

    return formatted;
  }

  String? parseToProfileDate(String? dateTime) {
    if (dateTime == null) return null;
    final formatter = DateFormat('E MMM dd yyyy');
    final formatted = formatter.parse(dateTime);

    return dateToReadable(formatted);
  }
}
