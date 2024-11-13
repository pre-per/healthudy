import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/component/mapWidget.dart';
import 'package:healthudy/provider/attendanceProvider.dart';
import 'package:provider/provider.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);
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
              onPressed: () {
                print('검색하기 버튼 누름');
              },
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
              const SizedBox(height: 30.0),
              GestureDetector(
                onTap: () async {
                  if (attendanceProvider.isTodayAttendance) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text(
                            '출석하기',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          content: Text(
                            '오늘은 이미 출석하셨습니다',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                '확인',
                                style: TextStyle(
                                  color: PRIMARY_COLOR_DENSE,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: PRIMARY_COLOR,
                          ),
                        );
                      },
                    );
                    final curPosition = await Geolocator.getCurrentPosition();
                    final distance = Geolocator.distanceBetween(
                      curPosition.latitude,
                      curPosition.longitude,
                      37.5855175,
                      127.0305901,
                    );
                    bool canCheck = distance < 100.0;
                    Navigator.of(context).pop();
                    final result = await showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text(
                            '출석하기',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          content: Text(
                            canCheck ? '출석 하시겠습니까?' : '출석이 불가능한 위치입니다',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text(
                                '취소',
                                style: TextStyle(
                                  color: PRIMARY_COLOR_DENSE,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (canCheck)
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text(
                                  '출석',
                                  style: TextStyle(
                                    color: PRIMARY_COLOR_DENSE,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    );
                    if (result == true) {
                      attendanceProvider.checkAttendance();
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text(
                              '출석하기',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            content: Text(
                              '출석이 완료되었습니다',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  '확인',
                                  style: TextStyle(
                                    color: PRIMARY_COLOR_DENSE,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
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
