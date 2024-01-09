class SuperClass {
  int myData = 10;
  void myFun() {
    print('SuperClass.myFun');
  }
}

class SubClass extends SuperClass {
  int myData = 20;
  void myFun() {
    print('SubClass.myFun');
  }
}

void main() {
  var obj = SubClass();
  obj.myFun();
  print(obj.myData);
}