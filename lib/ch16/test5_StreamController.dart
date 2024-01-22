import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  subscriptionTest() {
    var stream = Stream.fromIterable([1, 2, 3]);
    StreamSubscription subscription = stream.listen(null);
    subscription.onData((data) {
      print('value: $data');
    });
    subscription.onError((error) {
      print('error: $error');
    });
    subscription.onDone(() {
      print('stream done....');
    });
  }

  controllerTest() {
    var controller = StreamController();

    var stream1 = Stream.fromIterable([1, 2, 3]);
    var stream2 = Stream.fromIterable(['a', 'b', 'c']);

    stream1.listen((value) {
      controller.add(value);
    });
    stream2.listen((event) {
      controller.add(event);
    });

    controller.stream.listen((event) {
      print(event);
    });
  }

  transformerTest() {
    var stream = Stream.fromIterable([1, 2, 3]);

    StreamTransformer<int, dynamic> transformer = StreamTransformer.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * value);
      }
    );

    stream.transform(transformer).listen((event) {
      print('in listen... $event');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stream Controller Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: subscriptionTest, child: const Text('subscriptionTest')),
              ElevatedButton(onPressed: controllerTest, child: const Text('controllerTest')),
              ElevatedButton(onPressed: transformerTest, child: const Text('transformerTest')),
            ],
          ),
        ),
      ),
    );
  }
}
