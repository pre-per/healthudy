import 'package:flutter/material.dart';
import 'package:healthudy/component/cardList.dart';
import 'package:healthudy/component/addRoutineButton.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/provider/cardProvider.dart';
import 'package:healthudy/screen/generate_routine_screen.dart';
import 'package:provider/provider.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GenerateRoutineScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add, color: PRIMARY_COLOR),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            !cardProvider.isEmpty // 잠시 이렇게 해둠 나중에 느낌표 지우기
                ? Addroutinebutton()
                : CardListWidget(scrollable: true)
          ],
        ),
      ),
    );
  }
}
