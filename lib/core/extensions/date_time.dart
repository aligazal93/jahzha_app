extension DateTimeExtension on DateTime {
  bool isToday(DateTime value) {
    return value.year == year && value.month == month && value.day == day;
  }
}
