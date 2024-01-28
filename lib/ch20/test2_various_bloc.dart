import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class User {
  String name;
  String address;

  User(this.name, this.address);
}

abstract class UserEvent {
  User user;

  UserEvent(this.user);
}

class CreateUserEvent extends UserEvent {
  CreateUserEvent(super.user);
}

class UpdateUserEvent extends UserEvent {
  UpdateUserEvent(super.user);
}

class UserBloc extends Bloc<UserEvent, User?> {
  UserBloc() : super(null) {
    on<CreateUserEvent> ((event, emit) => emit(event.user));
    on<UpdateUserEvent> ((event, emit) => emit(event.user));
  }
}

abstract class CounterEvent {
  int no;

  CounterEvent(this.no);
}

class IncrementEvent extends CounterEvent{
  IncrementEvent(super.no);
}

class DecrementEvent extends CounterEvent{
  DecrementEvent(super.no);
}

class BlocCounter extends Bloc<CounterEvent, int> {
  BlocCounter() : super(0) {
    on<IncrementEvent>((event, emit) {
      emit(state + event.no);
    });
    on<DecrementEvent>((event, emit) {
      emit(state - event.no);
    });
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('observer onTransition...$transition');
  }
}

void main() {
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Bloc Test'),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider<BlocCounter>(create: (context) => BlocCounter()),
              BlocProvider<UserBloc>(create: (context) => UserBloc())
            ],
            child: MyWidget(),
          ),
        )
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return MultiBlocListener(
        listeners: [
          BlocListener<BlocCounter, int>(
            listenWhen: (previous, current) {
              return true;
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$state'),
                  backgroundColor: Colors.red,
                )
              );
            },
          ),
          BlocListener<UserBloc, User?>(
            listener: (context, user) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${user!.name} + ${user.address}'),
                  backgroundColor: Colors.blue,
                )
              );
            },
          )
        ],
        child: Container(
          color: Colors.deepPurpleAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<BlocCounter, int> (
                  buildWhen: (pre, cur) {
                    if (pre < cur) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, count) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${counterBloc.state}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'Bloc : $count',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              counterBloc.add(IncrementEvent(2));
                            },
                            child: const Text('increment')
                        ),
                        ElevatedButton(
                            onPressed: () {
                              counterBloc.add(DecrementEvent(2));
                            },
                            child: const Text('decrement')
                        ),
                      ],
                    );
                  },
                ),
                BlocBuilder<UserBloc, User?> (
                  builder: (context, user) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'user : ${user?.name}, ${user?.address}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => userBloc.add(CreateUserEvent(User('SiHyun', 'Suwon'))),
                          child: const Text('Create'),
                        ),
                        ElevatedButton(
                          onPressed: () => userBloc.add(UpdateUserEvent(User('Park', 'Incheon'))),
                          child: const Text('Update'),
                        ),
                      ],
                    );
                  }
                )
              ],
            ),
          ),
        )
    );
  }
}
