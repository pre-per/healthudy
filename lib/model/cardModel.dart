class CardModel {
  String cardName;
  String title;
  String dateTime;
  bool isChecked;

  CardModel({
    required this.cardName,
    required this.title,
    required this.dateTime,
    this.isChecked = false,
  });
}
