import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {

  Future<int> sum() {
    return Future<int>(() async {
      var sum = 0;
      for (int i = 0; i < 50000000; i++) {
        sum += i;
      }
      await Future.delayed(Duration(seconds: 10));
      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder Test'),
        ),
        body: Column(
          children: [
            Text("test Text"),
            FutureBuilder(
              future: sum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Text(
                      '${snapshot.data}',
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  );
                } else {
                  return Center(
                    child: Text('waiting'),
                    // child: CircularProgressIndicator(color: Colors.black,),
                  );
                }
              },
            ),
          ],
        )
      ),
    );
  }
}
