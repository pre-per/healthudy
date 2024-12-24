import 'package:flutter/material.dart';
import 'package:healthudy/model/cardModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> _cards = [
    CardModel(date: '2024-11-15', back: true, cardio: true,),
    CardModel(date: '2024-11-13', shoulder: true, cardio: true,),
    CardModel(date: '2024-11-13', shoulder: true, cardio: true,),
  ];
  bool _isDateSelected = false;
  bool _isDone = false;

  List<CardModel> get cards => _cards;
  bool get isDateSelected => _isDateSelected;
  bool get isDone => _isDone;

  void makeCard(CardModel cardData) {
    _cards.add(cardData);
    notifyListeners();
  }
}
