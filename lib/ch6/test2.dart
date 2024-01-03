class User {
  late String name;
  late int age;
  User(this.name, this.age);

  sayHello() {
    print('name : $name, age : $age');
  }
}

class User2 {
  late String name;
  late int age;
  User2(String name, int age) : this.name = name, this.age = age {}

  sayHello() {
    print('name : $name, age : $age');
  }
}

class User3 {
  late int data1;
  late int data2;

  User3(List<int> args)
      : this.data1 = args[0],
        this.data2 = args[1];
}

class MyClass {
  late int data1;
  late int data2;

  MyClass(int arg1, int arg2)
      : data1 = calFun(arg1),
        data2 = calFun(arg2);

  static int calFun(int arg) {
    return arg * 10;
  }

  printData() {
    print("$data1, $data2");
  }
}

void main() {
  MyClass myClass = MyClass(1, 2);

  myClass.printData();
}