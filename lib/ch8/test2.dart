import 'package:flutter/material.dart';

void main() {
  runApp(MyListWidget());
}

class MyListWidget extends StatefulWidget {
  const MyListWidget({Key? key}) : super(key: key);

  @override
  State<MyListWidget> createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  List<Widget> widgetList = [
    MyREDItemWidget(),
    MyBLUEItemWidget()
  ];

  onChange() {
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    print('print.....${widgetList.length}');
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Key Test'),),
            body: Column(
              children: [
                Row(children: widgetList,),
                ElevatedButton(onPressed: onChange, child: const Text('toggle'))
              ],
            )
        )
    );
  }
}

class MyREDItemWidget extends StatefulWidget {
  @override
  State<MyREDItemWidget> createState() => _MyREDItemWidgetState(Colors.red);
}

class _MyREDItemWidgetState extends State<MyREDItemWidget> {
  Color color;
  _MyREDItemWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: color,
          width: 150,
          height: 150,
        )
    );
  }
}
class MyBLUEItemWidget extends StatefulWidget {
  @override
  State<MyBLUEItemWidget> createState() => _MyBLUEItemWidgetState(Colors.blue);
}

class _MyBLUEItemWidgetState extends State<MyBLUEItemWidget> {
  Color color;

  _MyBLUEItemWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: color,
          width: 150,
          height: 150,
        )
    );
  }
}