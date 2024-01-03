class User{
  String? name;
  int? age;

  some() {
    print('name : $name, age : $age');
  }
}

void main() {
  User()
      ..name = 'Lee'
      ..age = 25
      ..some();
}