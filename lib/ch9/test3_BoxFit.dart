import 'package:flutter/cupertino.dart';
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
        body: Center(
          child: Container(
            color: Colors.red,
            child: Image.asset(
              'images/1.png',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
