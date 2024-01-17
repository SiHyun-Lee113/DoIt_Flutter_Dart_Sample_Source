import 'package:flutter/material.dart';
import 'User.dart';

class TwoScreen extends StatelessWidget {
  const TwoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    print(args);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TwoScreen'),
        ),
        body: Container(
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'TwoScreen',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                  Text('sendData:${args["arg1"]}, ${args["arg2"]}, ${(args["arg3"] as User).name}'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/three');
                    },
                    child: const Text('Go Three')
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, User('kim', 'busan'));
                    },
                    child: const Text('Pop')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
