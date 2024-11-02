import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier {
  int _attendanceCount = 0;

  int get attendanceCount => _attendanceCount;

  void incrementAttendance() {
    _attendanceCount++;
    notifyListeners();
  }
}