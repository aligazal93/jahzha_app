import 'package:flutter/material.dart';

extension StringExtension on String {
  String get capitalize {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  TimeOfDay? convertToTime() {
    try {
      List<String> parts = split(" ");
      String time = parts[0];
      String period = parts[1];

      List<String> timeParts = time.split(":");
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      if (period == "PM" && hour != 12) {
        hour += 12;
      } else if (period == "AM" && hour == 12) {
        hour = 0;
      }

      TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minute);
      return timeOfDay;
    } catch (e) {}
    return null;
  }

  TimeOfDay? convertTo24FormatTime() {
    try {
      List<String> timeParts = split(":");

      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      TimeOfDay timeOfDay = TimeOfDay(hour: hour, minute: minute);
      return timeOfDay;
    } catch (e) {}
    return null;
  }

  String? formatAsLink() {
    if (this.isEmpty) return null;
    return this.startsWith('https://') ? this : 'https://$this';
  }

  String convertNumbersToArabic() {
    String arabic = this;
    arabic = arabic.replaceAll('٠', '0');
    arabic = arabic.replaceAll('١', '1');
    arabic = arabic.replaceAll('٢', '2');
    arabic = arabic.replaceAll('٣', '3');
    arabic = arabic.replaceAll('٤', '4');
    arabic = arabic.replaceAll('٥', '5');
    arabic = arabic.replaceAll('٦', '6');
    arabic = arabic.replaceAll('٧', '7');
    arabic = arabic.replaceAll('٨', '8');
    arabic = arabic.replaceAll('٩', '9');
    return arabic;
  }

  String forceLeftToRight() {
    return '\u200E$this';
  }
}