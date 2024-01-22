import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  Future<int> funA() {
    return Future.delayed(Duration(seconds: 3), () {
      return 30;
    });
  }

  Future<int> funB(int arg) {
    return Future.delayed(Duration(seconds: 2), () {
      return arg * arg;
    });
  }

  Future<int> calFun() async {
    int aResult = await funA();
    int bResult = await funB(aResult);
    return bResult;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('await, async Test'),
        ),
        body: Center(
          child: FutureBuilder(
            future: calFun(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Text(
                      '${snapshot.data}',
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ));
              }
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    ),
                    Text(
                      'waiting.....',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
