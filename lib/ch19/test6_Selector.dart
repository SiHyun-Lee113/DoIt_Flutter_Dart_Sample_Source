import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDataModel with ChangeNotifier {
  int data1 = 0;
  int data2 = 20;

  void changeData1() {
    data1++;
    notifyListeners();
  }

  void changeData2() {
    data2++;
    notifyListeners();
  }
}

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Selector Test'),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<MyDataModel>.value(value: MyDataModel())
          ],
          child: HomeWidget(),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MyDataModel>(builder: (context, model, child) {
              print('HomeWidget.build consumer');
              return Container(
                color: Colors.green,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'consumer, data1: ${model.data1}, data2: ${model.data2}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              );
            }),
            Selector<MyDataModel, int>(
              builder: (context, data, child) {
                print('HomeWidget.build selector');
                return Container(
                  color: Colors.cyan,
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'selector, data: $data',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                );
              },
              selector: (context, model) => model.data2,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    var model1 =
                        Provider.of<MyDataModel>(context, listen: false);
                    model1.changeData1();
                  },
                  child: const Text('model data1 change'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var model =
                        Provider.of<MyDataModel>(context, listen: false);
                    model.changeData2();
                  },
                  child: const Text('model data2 change'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
