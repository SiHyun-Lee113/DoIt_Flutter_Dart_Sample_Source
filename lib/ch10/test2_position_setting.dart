import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("위젯 위치 설정"),),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 400,
              color: Colors.red,
              child: Align(
                alignment: Alignment(0.3, 0.4),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                ),
              ),
            ),
            Stack(
                children: [
                  Container(
                    height: 400,
                    color: Colors.green,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.red
                  ),
                  Positioned(
                    right: 30,
                    top: 30,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.yellow,
                    ),
                  )
                ],
              ),
          ],
        )
      ),
    );
  }
}
