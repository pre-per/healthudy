import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier {
  final List<DateTime> _attendanceDates = [
    DateTime.utc(2024, 11, 3),
    DateTime.utc(2024, 11, 4),
    DateTime.utc(2024, 11, 6),
  ];

  List<DateTime> get attendanceDates => _attendanceDates;

  bool isTodayAttendance(DateTime date) {
    return _attendanceDates.any((d) => isSameDay(d, date));
  }

  void attendenceCheck() {
    DateTime today = DateTime.now();

    if (!_attendanceDates.any((d) => isSameDay(d, today))) {
      _attendanceDates.add(today);
      notifyListeners();
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
