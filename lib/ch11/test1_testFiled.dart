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
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_printValue);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Text Field Test'),),
        body: Column(
          children: [
            Center(
              child: TextField(
                style: const TextStyle(fontSize: 15.0),
                controller: controller,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print('submit : ${controller.text}');
                },
                child: const Text('submit')
            ),
            TextFormField()
          ],
        ),
      ),
    );
  }

  void _printValue() {
    print('changed value : ${controller.text}');
  }
}
