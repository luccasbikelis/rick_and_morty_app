import 'package:intl/intl.dart';

extension DateUtil on String {
  String formatString({String pattern = "dd/MM/yyyy"}) {
    final DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    final DateTime dateTime = inputFormat.parse(this);
    final DateFormat outputFormat = DateFormat(pattern);
    return outputFormat.format(dateTime);
  }
}

