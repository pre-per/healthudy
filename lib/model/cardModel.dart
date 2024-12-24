class CardModel {
  String date;
  bool back;
  bool shoulder;
  bool chest;
  bool leg;
  bool abdominal;
  bool cardio;
  bool isChecked;

  CardModel({
    required this.date,
    this.back = false,
    this.shoulder = false,
    this.chest = false,
    this.leg = false,
    this.abdominal = false,
    this.cardio = false,
    this.isChecked = false,
  });
}
