import 'package:flutter/material.dart';
import 'package:healthudy/component/cardList.dart';
import 'package:healthudy/component/main_calendar.dart';
import 'package:healthudy/component/routineCard.dart';
import 'package:healthudy/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '🔥 Welcome Back! 깨꾹이님',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CalendarWidget(),
          CardListWidget(scrollable: true),
        ],
      ),
    );
  }
}
