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
    MyItemWidget(Colors.red, key: UniqueKey()),
    MyItemWidget(Colors.blue, key: UniqueKey())
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

class MyItemWidget extends StatefulWidget {
  Color color;
  MyItemWidget(this.color, {Key? key}) : super(key: key);
  @override
  State<MyItemWidget> createState() => _MyItemWidgetState(color);
}

class _MyItemWidgetState extends State<MyItemWidget> {
  Color color;
  _MyItemWidgetState(this.color);

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
