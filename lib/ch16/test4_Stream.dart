void main() {
  // onPress();
  test1();
}

Stream<int> streamFun() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void onPress() async {
  // await for (int value in streamFun()) {
  //   print("value: $value");
  // }

  streamFun().listen((event) {
    print('value: $event');
  });
}

int calFun(int x) {
  return x * x;
}

test1() async {
  Duration duration = Duration(seconds: 2);
  Stream<int> stream = Stream<int>.periodic(duration, calFun);
  stream = stream.take(3);
  await for (var value in stream) {
    print('value : $value');
  }
}