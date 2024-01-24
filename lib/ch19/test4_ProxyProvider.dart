import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(TestApp());

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class Sum {
  int _sum = 0;
  int get sum => _sum;

  set sum(int value) {
    print("now value : $value");
    _sum = 0;
    for (int i = 1; i <= value; i++) {
      _sum += i;
    }
  }

  Sum(Counter counter) {
    sum = counter.count;
  }
}

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
            ChangeNotifierProvider<Counter>.value(value: Counter()),
            ProxyProvider<Counter, Sum>(
                update: (context, model, sum) {
                  if (sum != null) {
                    sum.sum = model.count;
                    return sum;
                  } else {
                    return Sum(model);
                  }
                }
            ),
            ProxyProvider2<Counter, Sum, String>(
                update: (context, counter, sum, data) {
                  return "count : ${counter.count}, sum = ${sum.sum}";
                }
            )
          ],
          child : SubWidget(),
        ),
      ),
    );
  }
}



class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    var sum = Provider.of<Sum>(context);
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
              'int Data : ${counter.count}',
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
              'Sum Data : ${sum.sum}',
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
