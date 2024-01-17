class User {
  String name;
  String address;

  User(this.name, this.address);

  @override
  String toString() {
    return 'User{name: $name, address: $address}';
  }
}