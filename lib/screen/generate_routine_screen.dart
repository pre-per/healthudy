import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';

class GenerateRoutineScreen extends StatelessWidget {
  const GenerateRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('루틴을 추가하세요!'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Center(
          child: GestureDetector(
            child: Card(
              elevation: 3.0,
              color: PRIMARY_COLOR,
              child: SizedBox(
                width: 400.0,
                height: 100.0,
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
