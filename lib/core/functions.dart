import 'package:intl/intl.dart';

String dateTimeToDateString(DateTime date) {
  DateTime now = DateTime.now();

  if (date.day == now.day && date.month == now.month && date.year == now.year) {
    return "Today";
  }

  if (date.day == now.add(const Duration(days: 1)).day &&
      date.month == now.add(const Duration(days: 1)).month &&
      date.year == now.add(const Duration(days: 1)).year) {
    return "Tomorrow";
  }

  String dateStr = DateFormat("MMMM d, y").format(date);

  return dateStr;
}

String dateTimeToTimeString(DateTime date) {
  return "${date.hour < 10 ? "0${date.hour}" : date.hour.toString()}:${date.minute < 10 ? "0${date.minute}" : date.minute.toString()}";
}
