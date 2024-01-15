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
        appBar: AppBar(
          title: const Text("IndexedStack Widget Test"),
        ),
        body: Center(
          child: IndexedStack(
            index: 2,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.green,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
