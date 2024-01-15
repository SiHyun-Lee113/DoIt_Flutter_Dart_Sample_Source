import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> with SingleTickerProviderStateMixin { // 위젯의 애니메이션 효과를 위한 참조
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar Test'),
          bottom: TabBar(
            controller: tabController,
            tabs: const <Widget>[
              Tab(text: 'One',),
              Tab(text: 'Two',),
              Tab(text: 'Three',),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const <Widget>[
            Center(
              child: Text(
                'One Screen',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Center(
              child: Text(
                'Two Screen',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Center(
              child: Text(
                'Three Screen',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
