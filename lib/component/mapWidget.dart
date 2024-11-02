import 'package:flutter/material.dart';
import 'package:healthudy/const/colors.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 425.0,
      height: 600.0,
      decoration: BoxDecoration(
        color: Colors.green[100],
      ),
      child: const Center(
        child: Text(
          'Map Widget',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
