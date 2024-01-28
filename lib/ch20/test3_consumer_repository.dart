import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRepository {
  accessRepository() {
    print('MyRepository.accessRepository');
  }
}

enum CounterEvent { increment, decrement }

class BlocCounter extends Bloc<CounterEvent, int> {
  BlocCounter() : super(0) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case CounterEvent.increment:
          emit(state + 1);
          break;
        case CounterEvent.decrement:
          emit(state - 1);
          break;
      }
    });
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Consumer, Repository Test'),
        ),
        body: RepositoryProvider(
          create: (context) => MyRepository(),
          child: BlocProvider<BlocCounter>(
              create: (context) => BlocCounter(), child: MyWidget()),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BlocCounter blocCounter = BlocProvider.of<BlocCounter>(context);
    final MyRepository myRepository =
        RepositoryProvider.of<MyRepository>(context);
    return BlocConsumer<BlocCounter, int>(listener: (context, state) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$state'),
        backgroundColor: Colors.red,
      ));
    }, buildWhen: (pre, cur) {
      print('previous : $pre, current : $cur');
      return true;
    }, builder: (context, state) {
      return Container(
          color: Colors.deepOrangeAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bloc : $state',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () {
                      blocCounter.add(CounterEvent.increment);
                      myRepository.accessRepository();
                    },
                    child: const Text('increment')),
                ElevatedButton(
                    onPressed: () {
                      blocCounter.add(CounterEvent.decrement);
                      myRepository.accessRepository();
                    },
                    child: const Text('decrement')),
              ],
            ),
          )
      );
    });
  }
}
