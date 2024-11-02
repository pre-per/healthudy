import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/provider/attendanceProvider.dart';
import 'package:healthudy/provider/bottomNavigationProvider.dart';
import 'package:healthudy/provider/scrollControllerProvider.dart';
import 'package:healthudy/screen/homescreen.dart';
import 'package:healthudy/screen/routine_screen.dart';
import 'package:healthudy/screen/check_screen.dart';
import 'package:healthudy/screen/setting_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
        ChangeNotifierProvider(create: (_) => Bottomnavigationprovider()),
        ChangeNotifierProvider(create: (_) => ScrollControllerProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: MAIN_GREY_COLOR,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final List<Widget> _screens = [
    HomeScreen(),
    RoutineScreen(),
    CheckScreen(),
    SettingScreen(),
  ];
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final btprovider = Provider.of<Bottomnavigationprovider>(context);
    return Scaffold(
      body: _screens[btprovider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: btprovider.selectedIndex,
        onTap: btprovider.updateIndex,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.event_repeat_outlined), label: "루틴"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "출석"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "더보기"),
        ],
      ),
    );
  }
}
