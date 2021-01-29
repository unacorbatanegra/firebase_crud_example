import 'package:intl/intl.dart';

abstract class Helpers {
  static String formatCurrency(num value) {
    if (value != null) {
      if (value % 1 == 0) {
        return NumberFormat.currency(decimalDigits: 0, symbol: '')
            .format(value);
      } else {
        return NumberFormat.currency(decimalDigits: 2, symbol: '')
            .format(value);
      }
    } else {
      return '0';
    }
  }

  static String formatFecha(DateTime dateTime) =>
      DateFormat.yMMMMd('es_AR').format(dateTime);

  static String nameFromUrl(String url) {
    var filePath = url.replaceAll(
        RegExp(
            r'https://firebasestorage.googleapis.com/v0/b/mercadito-efe1e.appspot.com/o/'),
        '');
    filePath = filePath.replaceAll(RegExp(r'%2F'), '/');
    filePath = filePath.replaceAll(RegExp(r'(\?alt).*'), '');
    filePath = filePath.replaceAll(RegExp('%'), ':');
    return filePath.trim();
  }

  static String capitalize(String s) {
    if (s.isNotEmpty) {
      return s[0].toUpperCase() + s.substring(1);
    } else {
      return '';
    }
  }
}

extension DateTimeHelpers on DateTime {
  bool isInTheSameMonth(DateTime other) =>
      year == other.year && month == other.month;
}
