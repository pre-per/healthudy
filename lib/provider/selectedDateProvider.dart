import 'package:flutter/material.dart';

class SelectedDateProvider with ChangeNotifier {
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  void selectDate(DateTime selectedDate) {
    _selectedDate = selectedDate;
    notifyListeners();
  }
}