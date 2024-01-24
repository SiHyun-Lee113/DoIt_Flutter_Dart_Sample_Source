import 'dart:isolate';

import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

String topData = 'hello';
void myIsolate1(var arg) {
  Future.delayed(Duration(seconds: 2), () {
    print('in myIsolate1... $arg, $topData');
  });
}

class TestApp extends StatelessWidget {
  String classData = 'hello';
  myIsolate2(var arg) {
    Future.delayed(Duration(seconds: 2), () {

      print('in myIsolate2... $arg, $topData, $classData');
    });
  }

  void test() {
    print('test...... before run isolate... topData : $topData, '
        'classData: $classData');
    Isolate.spawn(myIsolate1, 10);
    Isolate.spawn(myIsolate2, 20);
    topData = 'world';
    classData = 'world';
    print('test...... after run isolate... topData : $topData, '
        'classData: $classData');
  }

  @override
  Widget build(BuildContext context) {
    test();

    return const Placeholder();
  }
}
