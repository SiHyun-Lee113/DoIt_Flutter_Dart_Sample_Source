import 'package:flutter/material.dart';
import 'four_screen.dart';
import 'three_screen.dart';
import 'two_screen.dart';
import 'one_screen.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one': (context) => OneScreen(),
        '/two': (context) => TwoScreen(),
        '/three': (context) => ThreeScreen(),
        '/four': (context) => FourScreen(),
      },
    );
  }
}
