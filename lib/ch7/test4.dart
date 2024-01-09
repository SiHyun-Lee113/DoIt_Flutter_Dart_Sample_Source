class User {
  int age;
  String name;

  User(this.age, this.name);
  String greet(String who) => 'Hello, $who. I\'m $name. i\'m $age years old';
}

class SubClass extends User{
  SubClass(super.age, super.name);
}

class MyClass implements User {
  int age = 10;
  String name = 'lee';

  @override
  String greet(String who) {
    return 'hello';
  }
}

main() {
  User user = MyClass();
  print(user.greet('lee'));
}