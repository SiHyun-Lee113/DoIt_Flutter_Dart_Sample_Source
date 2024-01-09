mixin MyMixin {
  int data1 = 10;
  void myFun1() => print('MyMixin......');
}

mixin MyMixin2 {
  int data1 = 10;
  void myFun2() => print('MyMixin2......');
}

class SuperClass {
  int superData = 20;
  void superFun() {
    print('SuperClass.superFun');
  }
}

class MyClass extends SuperClass with MyMixin, MyMixin2{
  void sayHello() {
    print('data : $data1');
    myFun1();
    myFun2();
    superFun();
  }
}

void main() {
  MyClass myClass = MyClass();
  myClass.sayHello();
}