import 'package:flutter/material.dart';
import 'package:healthudy/component/routineCard.dart';
import 'package:healthudy/provider/cardProvider.dart';
import 'package:provider/provider.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: Provider.of<CardProvider>(context).cardNum,
        itemBuilder: (context, index) {
          return RoutineCard(routineName: 'Hello World');
        },
      ),
    );
  }
}
