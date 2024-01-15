import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        body: Center(
          child:
              GestureDetector(
                child: Image.asset('images/1.png'),
                onVerticalDragStart: (DragStartDetails details) {
                  print('vertical drag start...global position : '
                      '${details.globalPosition.dx},  '
                      '${details.globalPosition.dy}');
                  print('vertical drap start...local position : '
                      '${details.localPosition.dx},  '
                      '${details.localPosition.dy}');
                },
              )
        ),
      ),
    );
  }
}
