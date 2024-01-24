import 'dart:isolate';

import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

void myIsolate1(var arg) {
  Future.delayed(Duration(seconds: 3), () {
    print('in myIsolate1... $arg');
  });
}

class TestApp extends StatelessWidget {
  myIsolate2(var arg) {
    Future.delayed(Duration(seconds: 2), () {
      print('in myIsolate2... $arg');
    });
  }

  void test() {
    print('test...... before run isolate...');
    Isolate.spawn(myIsolate1, 10);
    Isolate.spawn(myIsolate2, 20);
    print('test...... after run isolate...');
  }

  @override
  Widget build(BuildContext context) {
    test();

    return const Placeholder();
  }
}
