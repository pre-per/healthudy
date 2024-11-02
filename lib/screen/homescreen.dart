import 'package:flutter/material.dart';
import 'package:healthudy/component/main_calendar.dart';
import 'package:healthudy/component/routineCard.dart';
import 'package:healthudy/provider/scrollControllerProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollControllerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CalendarWidget(),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}