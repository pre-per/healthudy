import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';

class Addroutinebutton extends StatelessWidget {
  const Addroutinebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          print('루틴 추가 버튼 누름');
        },
        child: Container(
          width: 400.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: PRIMARY_COLOR,
          ),
          child: Center(
            child: Text(
              'Add Routine',
              style: TextStyle(
                color: Colors.black,
                fontSize: 19.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
