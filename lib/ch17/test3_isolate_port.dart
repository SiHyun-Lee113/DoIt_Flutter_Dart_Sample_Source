import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:isolate';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

myIsolate(SendPort mainPort) {
  ReceivePort subIsolateSendPort = ReceivePort();
  mainPort.send({'port': subIsolateSendPort.sendPort});
  subIsolateSendPort.listen((message) {
    if (message['msg'] != 'bye') {
      int count = message['msg'];
      mainPort.send({'msg': count * count});
    } else {
      subIsolateSendPort.close();
    }
  });
}

class _MyAppState extends State<MyApp> {

  String result = '????';

  void onPress() async {
    ReceivePort mainPort = ReceivePort();

    await Isolate.spawn(myIsolate, mainPort.sendPort);

    SendPort? mainIsolateSendPort;
    mainPort.listen((message) {
      if (message['port'] != null) {
        mainIsolateSendPort = message['port'];
      } else if (message['msg'] != null) {
        setState(() {
          result = 'msg : ${message['msg']}';
        });
      }
    });

    int count = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      if (count < 6) {
        mainIsolateSendPort?.send({'msg': count});
      } else {
        mainIsolateSendPort?.send({'msg': 'bye'});
        mainPort.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Isolate Port Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              ElevatedButton(onPressed: onPress, child: const Text('isolate Test'))
            ],
          ),
        ),
      ),
    );
  }
}
