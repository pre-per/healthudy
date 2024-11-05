import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';
import 'package:healthudy/provider/cardProvider.dart';
import 'package:healthudy/provider/iconColorProvider.dart';
import 'package:provider/provider.dart';

class RoutineCard extends StatelessWidget {
  final String routineName;

  const RoutineCard({
    required this.routineName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColorProvider = Provider.of<IconColorProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Card(
        elevation: 3.0,
        color: MAIN_WHITE_COLOR,
        child: Container(
            width: 400.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          print("routine");
                          iconColorProvider.changeColor();
                        },
                        icon: Icon(
                          Icons.check,
                          color: iconColorProvider.iconColor,
                        ),
                      ),
                      const Center(
                        child: Text(
                          '완료!',
                          style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Hello World!",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
