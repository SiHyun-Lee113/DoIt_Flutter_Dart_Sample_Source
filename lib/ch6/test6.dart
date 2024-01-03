class MyClass {
  final int data1;
  const MyClass(this.data1);
}

main() {
  var obj1 = MyClass(10);
  var obj2 = MyClass(10);
  var obj3 = const MyClass(10);
  var obj4 = const MyClass(10);
  var obj5 = const MyClass(20);

  print('obj1 == obj2 : ${identical(obj1, obj2)}');
  print('obj2 == obj3 : ${identical(obj2, obj3)}');
  print('obj3 == obj4 : ${identical(obj3, obj4)}');
  print('obj4 == obj5 : ${identical(obj4, obj5)}');
}