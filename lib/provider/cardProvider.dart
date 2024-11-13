import 'package:flutter/material.dart';
import 'package:healthudy/model/cardModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardProvider with ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  List<CardModel> _cards = [];
  bool _isDateSelected = false;

  List<CardModel> get cards => _cards;
  bool get isDateSelected => _isDateSelected;

  void dateSelect() {
    _isDateSelected = !_isDateSelected;
    notifyListeners();
  }

  Future<void> createData(CardModel cardData) async {
    await firestore
        .collection('User1')
        .doc(cardData.dateTime)
        .collection('Routine')
        .doc('card2')
        .set({'title': cardData.title, 'isChecked': cardData.isChecked});

    print("Document Added!");
  }

  Future<void> getData(String cardNum, String date) async {
    DocumentSnapshot docData = await firestore
        .collection('User1')
        .doc(date)
        .collection('Routine')
        .doc(cardNum)
        .get();

    print(docData.data());
  }

  Future<void> checkCard(String cardNum, String date) async {
    try {
      DocumentReference docRef = firestore
          .collection('User1')
          .doc(date)
          .collection('Routine')
          .doc(cardNum);
      DocumentSnapshot docData = await docRef.get();

      if (docData.exists) {
        bool currentValue = docData['isChecked'] ?? false;
        await docRef.update({'isChecked': !currentValue});
        print("isChecked가 ${!currentValue}로 변경되었습니다!");
      } else {
        print("문서를 찾을 수 없습니다.");
      }
    } catch (e) {
      print("문서를 찾을 수 없습니다");
    }
  }
}
