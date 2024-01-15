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
  String longText = "동해물과 백두산이 마르고 닳도록 하느님이 보asdfasdf우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세";
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("testApp"),),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                longText,
                style: const TextStyle(
                  fontSize: 20
                ),
                maxLines: isExpanded ? null : 2,
                overflow: isExpanded ? null : TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              longText,
              style: const TextStyle(
                  fontSize: 20
              )
            ),
          ],
        ),
      ),
    );
  }
}
