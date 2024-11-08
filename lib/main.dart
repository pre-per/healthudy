import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/firebase_options.dart';
import 'package:healthudy/provider/attendanceProvider.dart';
import 'package:healthudy/provider/bottomNavigationProvider.dart';
import 'package:healthudy/provider/cardProvider.dart';
import 'package:healthudy/provider/iconColorProvider.dart';
import 'package:healthudy/provider/selectedDateProvider.dart';
import 'package:healthudy/provider/naverMapController.dart';
import 'package:healthudy/screen/homescreen.dart';
import 'package:healthudy/screen/routine_screen.dart';
import 'package:healthudy/screen/check_screen.dart';
import 'package:healthudy/screen/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();
  await NaverMapSdk.instance.initialize(
    clientId: 'vqv6u6isdz',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
        ChangeNotifierProvider(create: (_) => Bottomnavigationprovider()),
        ChangeNotifierProvider(create: (_) => SelectedDateProvider()),
        ChangeNotifierProvider(create: (_) => CardProvider()),
        ChangeNotifierProvider(create: (_) => IconColorProvider()),
        ChangeNotifierProvider(create: (_) => Navermapcontroller()),
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
