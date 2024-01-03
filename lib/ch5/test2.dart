String _name = 'hello';

String get name {
  return _name.toUpperCase();
}

set name(value) {
  _name = value;
}

void main(List<String> args) {
  print('name : $name');
  name = "World";
  print('name : $name');
}
