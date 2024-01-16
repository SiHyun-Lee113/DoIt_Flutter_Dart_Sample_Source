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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.pink
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Theme Test App'),),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FloatingActionButton.small(onPressed: (){})
            ],
          ),
        ),
      ),
    );  }
}

