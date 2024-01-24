import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Provider Test'),
        ),
        body: MultiProvider(
          providers: [
            Provider<int>.value(value: 10,),
            Provider<String>.value(value: 'hello',),
            ChangeNotifierProvider<Counter>.value(value: Counter())
          ],
          child : SubWidget(),
        ),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    var intData = Provider.of<int>(context);
    var stringData = Provider.of<String>(context);

    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I am SubWidget',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            Text(
              'int Data : $intData',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            Text(
              'String Data : $stringData',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            Text(
              'Counter Data : ${counter.count}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  counter.increment();
                },
                child: const Text('increment'))
          ],
        ),
      ),
    );
  }
}
