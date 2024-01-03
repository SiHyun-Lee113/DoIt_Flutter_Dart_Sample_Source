import 'test2.dart' as Test2;

void some1() {
  print('some1');
}

void some2() {
  void some3() {
    print('some3');
  }
  print('some2');
  some3();
}

class MyClass {
  void some4() {
  }

}

void some5(var a) {
  a = 20;
  a = 'world';
  a = true;
  a = null;
}

void printUser1() {
  print("hello SiHyun");
}
void printUser2() => print("hello Lee");

void some6({String? data1}) {
  print('data1: $data1');

}

String some7({String data = 'hello'}) {
  return data;
}

some8({required int arg1}) {
  print("some8().. arg1 : $arg1");
}

void some9(int arg1, [String arg2 = 'hello', bool arg3 = false]) => {};

int plus(int no) {
  return no + 10;
}

int multiply(int no) {
  return no * 10;
}
Function testFun(Function argFun) {
  print('argFun : ${argFun(100)}');
  return multiply;
}

Function fun = (arg) { return 10; };

void main() {
  var list = ['apple', 'banana', 'orange'];
  list.forEach((element) {
    print('${list.indexOf(element)} : $element');
  });


  var result = testFun(plus);
  print('result : ${result(20)}');

  // some9();
  some9(10);
  // some9(10, arg2: 'world', arg3: true);
  some9(10, 'world', true);
  // some9(10, true, 'world');
  some9(10, 'world');
  // some9(10, true);
  some8(arg1: 4);
  print('some7() result : ${some7()}');
  print('some7(world) result : ${some7(data: 'world')}');
  
  some6(data1: 'world');
  some6();

  printUser1();
  printUser2();
  some2();
  MyClass myClass = MyClass();
  myClass.some4();
}