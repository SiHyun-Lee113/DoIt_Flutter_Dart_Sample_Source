import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Message Channel',
      theme: new ThemeData(
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
  String? resultMessage;
  String? receiveMessage;

  Future<Null> nativeCall() async {
    const channel = MethodChannel('myMethodChannel');

    try {
      var details = {'Username' : 'Lee', 'Password' : '1234'};
      final Map result = await channel.invokeMethod("oneMethod", details);
      setState(() {
        resultMessage = "${result["one"]}, ${result["two"]}";
      });
      channel.setMethodCallHandler((call) async {
        switch (call.method) {
          case 'twoMethod':
            setState(() {
              receiveMessage = "receive : ${call.arguments}";
            });
            return 'Reply from Dart';
        }
      });
    } on PlatformException catch (e) {
      print("Failed : ${e.message}");
    }
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
              Text('resultMessage = $resultMessage'),
              Text('receiveMessage = $receiveMessage'),
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

