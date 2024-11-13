import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/provider/cardProvider.dart';
import 'package:provider/provider.dart';

class GenerateRoutineScreen extends StatelessWidget {
  const GenerateRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '루틴을 추가하세요!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Card(
                elevation: 3.0,
                color: cardProvider.isDateSelected
                    ? PASTEL_GREEN_COLOR
                    : PRIMARY_COLOR,
                child: SizedBox(
                  width: 400.0,
                  height: 50.0,
                  child: Center(
                    child: cardProvider.isDateSelected
                        ? Text(
                            '날짜 선택됨: (date)',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          )
                        : Text(
                            '날짜 선택하기',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
              ),
              onTap: () {
                cardProvider.dateSelect();
              },
            ),
            const SizedBox(height: 30.0),
            Center(
              child: Text(
                '운동은 아래에서 선택하세요!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectExerciseCard(iconData: Icons.home, title: '등'),
                    SelectExerciseCard(iconData: Icons.home, title: '등2'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectExerciseCard(iconData: Icons.home, title: '등'),
                    SelectExerciseCard(iconData: Icons.home, title: '등2'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectExerciseCard(iconData: Icons.home, title: '등'),
                    SelectExerciseCard(iconData: Icons.home, title: '등2'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Center(
          child: GestureDetector(
            child: Card(
              elevation: 3.0,
              color: PRIMARY_COLOR,
              child: SizedBox(
                width: 400.0,
                height: 50.0,
                child: Center(
                  child: Text(
                    '저장하기',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class SelectExerciseCard extends StatelessWidget {
  final IconData iconData;
  final String title;

  const SelectExerciseCard({
    required this.iconData,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3.0,
        color: Colors.grey[300],
        child: SizedBox(
          width: 150.0,
          height: 150.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 40.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
