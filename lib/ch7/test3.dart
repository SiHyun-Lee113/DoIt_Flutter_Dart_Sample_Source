class Super {
  String name;
  int age;
  Super(this.name, this.age);
}

// class Sub extends Super{
//   Sub(String name, int age) : super(name, age);
// }

class Sub extends Super{
  Sub(super.name, super.age);
}

main() {
  var obj = Sub('lee', 26);
  print('${obj.name}, ${obj.age}');
}