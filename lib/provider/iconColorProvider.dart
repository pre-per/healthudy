import 'package:flutter/material.dart';

class IconColorProvider with ChangeNotifier {
  Color _iconColor = Colors.grey;

  Color get iconColor => _iconColor;

  void changeColor() {
    _iconColor = Colors.yellow;
    notifyListeners();
  }
}