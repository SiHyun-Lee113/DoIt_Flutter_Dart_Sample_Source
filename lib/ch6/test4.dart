class MyClass {
  late int data1;
  late int data2;

  MyClass(this.data1, this.data2);
  MyClass.first(int arg) : this(arg, 1);
  MyClass.second() : this.first(2);

  printValue() {
    print('$data1, $data2');
  }
}

void main() {
  var myClass = MyClass(0, -1);
  myClass.printValue();

  var myClass2 = MyClass.first(3);
  myClass2.printValue();

  var myClass3 = MyClass.second();
  myClass3.printValue();
}