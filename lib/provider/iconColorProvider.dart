import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';

class IconColorProvider with ChangeNotifier {
  Color _iconColor = Colors.grey;

  Color get iconColor => _iconColor;

  void changeColor() {
    _iconColor = PRIMARY_COLOR;
    notifyListeners();
  }
}