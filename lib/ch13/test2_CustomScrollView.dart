import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {

  late List<String> widgetList;

  List<String> getWidget() {
    List<String> widgets = [];

    for (var i = 0; i < 100; i++) {
      widgets.add('Hello Flutter $i');
    }

    return widgets;
  }

  @override
  void initState() {
    super.initState();
    widgetList = getWidget();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.expand),
                onPressed: () {},
              ),
              expandedHeight: 200,
              floating: true,
              pinned: false,
              snap: true,
              elevation: 50,
              backgroundColor: Colors.pink,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.png'),
                        fit: BoxFit.fill)),
              ),
              title: const Text('AppBar Title'),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
              ],
            ),
            // SliverFixedExtentList(
            //     itemExtent: 50,
            //     delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //       return ListTile(
            //         title: Text('Hello World Item $index'),
            //       );
            //     })),
            SliverFixedExtentList.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widgetList[index]),
                  );
                },
                itemExtent: 50)
          ],
        ),
      ),
    );
  }
}
