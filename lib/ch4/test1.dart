void main() {
  List list1 = [10, 'hello', true];
  var list2 = List<int>.filled(3, 0);
  // list2.add(1); // runtime Error
  var list3 = List<int>.filled(3, 0, growable: true);
  list3.add(3);
  var list4 = List<int>.generate(3, (index) => index*10, growable: true);

  Set<int> set1= {10, 20, 30, 10};
  print(set1);
  Set<int> set2 = Set();
  Set<int> set3 = {};
  set2.add(10);
  set2.add(20);
  set2.add(10);

  print(list1);
  print(list2);
  print(list3);
  print(list4);


}