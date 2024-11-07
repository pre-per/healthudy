import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  int _cardNum = 10;
  bool _isEmpty = true;

  int get cardNum => _cardNum;
  bool get isEmpty => _isEmpty;

  void incrementCardNum() {
    if (_isEmpty) _isEmpty = false;
    _cardNum++;
    notifyListeners();
  }
}