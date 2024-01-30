int no1 = 10;
int _no2 = 20;

void sayHello1() {}
void _sayHello2() {}

class User1 {
  String? name;
  String _address = 'seoul';
}

class _User2 {}

main() {
  no1 = 20;
  _no2 = 30;

  sayHello1();
  _sayHello2();

  User1 user1 = User1();
  _User2 user2 = _User2();

  user1.name = 'kkang';
  user1._address = 'busan';
}

class MyClass {
  final int no2;
  MyClass(this.no2);

  void fun() {
    final int no3;
    no3 = 30;
  }
}
