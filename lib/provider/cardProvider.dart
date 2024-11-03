import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  int _cardNum = 10;

  int get cardNum => _cardNum;

  void incrementCardNum() {
    _cardNum++;
    notifyListeners();
  }
}