class User {
  String name = 'Lee';
  int age = 10;
  static String country = 'Korea';

  void sayHello() {
    print('Hello $name, age : $age');
  }

  static void sayCountry() {
    print('country : $country');
  }
}

void main() {
  User user1 = User();
  user1.sayHello();
  user1.name = 'park';
  user1.age = 20;

  user1.sayHello();

  User.sayCountry();
  User.country = 'USA';
  User.sayCountry();
}