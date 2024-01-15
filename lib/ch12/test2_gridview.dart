import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  List<String> cities = [
    '서울시', '부산시', '인천시', '대구시', '대전시', '광주시', '울산시', '세종시'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("GirdView Test"),),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return Card(
              child: Center(
                child: Text(cities[index]),
              ),
            );
          }
        ),
      ),
    );
  }
}
