import 'package:flutter/material.dart';
import 'test1_navigator_with_route_name/one_screen.dart';
import 'test1_navigator_with_route_name/two_screen.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  bool _isDeepLink = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Test',
      color: Colors.blue,
      home: Navigator(
        pages: [
          MaterialPage(child: OneScreen()),
          if (_isDeepLink) MaterialPage(child: TwoScreen())
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
