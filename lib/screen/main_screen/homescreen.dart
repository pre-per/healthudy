import 'package:flutter/material.dart';
import 'package:healthudy/component/cardList.dart';
import 'package:healthudy/component/main_calendar.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/provider/cardProvider.dart';
import 'package:healthudy/provider/selectedDateProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    DateTime? selectedDate =
        Provider.of<SelectedDateProvider>(context).selectedDate;

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
          Container(
            color: PRIMARY_COLOR,
            height: 30.0,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '   ${selectedDate!.year}년${selectedDate.month}월${selectedDate.day}일',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'n개   ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CardListWidget(scrollable: true)
        ],
      ),
    );
  }
}
