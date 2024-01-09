class SomeClass {
  int someData = 10;
}

class MyClass with SomeClass {
  void sayHello() {
    print('someData : $someData');
  }
}