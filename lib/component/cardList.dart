import 'package:flutter/material.dart';
import 'package:healthudy/component/routineCard.dart';
import 'package:healthudy/provider/cardProvider.dart';
import 'package:provider/provider.dart';

class CardListWidget extends StatelessWidget {
  final bool scrollable;

  const CardListWidget({
    required this.scrollable,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: scrollable
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: Provider.of<CardProvider>(context).cards.length,
        itemBuilder: (context, index) {
          return RoutineCard(routineName: 'Card #$index', index: index);
        },
      ),
    );
  }
}
