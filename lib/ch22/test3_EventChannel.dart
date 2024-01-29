import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_for_do_it/util_style/style.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Event Channel',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: NativeCallWidget(),
    );
  }
}

class NativeCallWidget extends StatefulWidget {
  const NativeCallWidget({super.key});

  @override
  State<NativeCallWidget> createState() => _NativeCallWidgetState();
}

class _NativeCallWidgetState extends State<NativeCallWidget> {
  String? receiveMessage;

  Future<void> nativeCall() async {
    const channel = EventChannel('eventChannel');
    channel.receiveBroadcastStream().listen((event) {
      setState(() {
        receiveMessage = 'Received Event : $event';
      });
    }, onError: (error) {
      print('Received Error : $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message Channel Test'),),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('receiveMessage = $receiveMessage', style: white_bold(),),
              ElevatedButton(
                child: const Text('native call'),
                onPressed: () {
                  nativeCall();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

