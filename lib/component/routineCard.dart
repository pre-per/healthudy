import 'package:flutter/material.dart';

class RoutineCard extends StatelessWidget {
  const RoutineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.white,
      child: SizedBox(
        height: 100.0,
        width: 400.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: Colors.yellow[100],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
