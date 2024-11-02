import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 425.0,
      height: 425.0,
      color: PRIMARY_COLOR,
      child: const Center(
        child: Text(
          'Calendar Widget',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
