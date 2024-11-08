import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, bool> _attendanceData = {};

  Map<String, bool> get attendanceData => _attendanceData;

  String getTodayDate() {
    DateTime today = DateTime.now();
    return '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
  }

  Future<void> checkAttendance() async {
    String todayDate = getTodayDate();
    try {
      await _firestore.collection(todayDate).doc('attendance').set({
        'isPresent': true,
      });
      _attendanceData[todayDate] = true;
      notifyListeners();
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> fetchAllAttendance() async {
    try {
      QuerySnapshot allCollections =
          await _firestore.collectionGroup('attendance').get();
      Map<String, bool> tempData = {};

      for (var doc in allCollections.docs) {
        String date = doc.reference.parent.id;
        tempData[date] = doc['isPresent'] ?? false;
      }

      _attendanceData = tempData;
      notifyListeners();
    } catch (e) {
      print("Error: $e");
    }
  }

  bool get isTodayAttendance {
    String todayDate = getTodayDate();
    fetchAllAttendance();
    return _attendanceData[todayDate] ?? false;
  }
}
