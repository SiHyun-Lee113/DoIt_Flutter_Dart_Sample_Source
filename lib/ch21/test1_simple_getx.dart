import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sample_for_do_it/util_style/style.dart' as MyStyle;

class CounterController extends GetxController {
  int count = 0;
  @override
  void onInit() {
    super.onInit();
    print('CounterController.onInit');
  }

  @override
  void onClose() {
    super.onClose();
    print('CounterController.onClose');
  }

  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Test'),
        ),
        body: GetBuilder(
          init: CounterController(),
          builder: (_) => MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      builder: (controller) {
        return Container(
          color: Colors.deepPurple,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GetX State: ${controller.count}',
                  style: MyStyle.white_bold(),
                ),
                ElevatedButton(
                    onPressed: () {controller.increment();},
                    child: const Text('increment')
                ),
                ElevatedButton(
                    onPressed: () {controller.decrement();},
                    child: const Text('decrement')
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
