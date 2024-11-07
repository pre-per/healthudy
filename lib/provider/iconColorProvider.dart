import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';

class IconColorProvider with ChangeNotifier {
  bool _isChecked = false;
  Color _iconColor = Colors.grey;

  bool get isChecked => _isChecked;
  Color get iconColor => _iconColor;

  void changeColor() {
    _isChecked = _isChecked ? false : true;
    _iconColor = _isChecked ? PRIMARY_COLOR : Colors.grey;
    notifyListeners();
  }
}