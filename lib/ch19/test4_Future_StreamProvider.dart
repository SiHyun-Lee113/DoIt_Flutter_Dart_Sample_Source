import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Stream<int> streamFun() async* {
  for (int i = 1; i < 6; i++) {
    await Future.delayed(const Duration(milliseconds: 1000));
    yield i;
  }
}

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FutureProvider, StreamProvider Test'),
        ),
        body: MultiProvider(
          providers: [
            FutureProvider<String>(
              create: (context) => Future.delayed(const Duration(milliseconds: 3000), () => 'hello world'),
              initialData: 'waiting.....',
            ),
            StreamProvider<int>(
              create: (context) => streamFun(),
              initialData: 0,
            )
          ],
          child: SubWidget(),
        ),
      ),
    );
  }
}
class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var futureState = Provider.of<String>(context);
    var streamState = Provider.of<int>(context);

    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'future: $futureState',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Text(
              'stream: $streamState',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
