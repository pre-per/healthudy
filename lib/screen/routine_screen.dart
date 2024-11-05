import 'package:flutter/material.dart';
import 'package:healthudy/component/cardList.dart';
import 'package:healthudy/const/colors.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '💪🏻 깨꾹이님의 루틴이에요!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            IconButton(
              onPressed: () {print('추가하기 버튼 누름');},
              icon: const Icon(Icons.add, color: PRIMARY_COLOR),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CardListWidget(scrollable: true),
          ],
        ),
      ),
    );
  }
}
