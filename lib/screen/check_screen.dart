import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/component/mapWidget.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '🏃🏻‍ 오늘도 열심히 운동해요!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
            IconButton(
              onPressed: () {print('검색하기 버튼 누름');},
              icon: const Icon(Icons.search, color: PRIMARY_COLOR),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MapWidget(),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {print('check Tap');},
                child: const Card(
                  elevation: 4.0,
                  color: PRIMARY_COLOR,
                  child: SizedBox(
                    width: 180.0,
                    height: 70.0,
                    child: Center(
                      child: Text(
                        '출석하기',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 23.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
