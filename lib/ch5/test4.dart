class User {
  void some() {
    print('User.some');
  }
}

void main() {
  Object obj = User();
  // obj.some();

  if (obj is User) {
    obj.some();
  }

  Object obj2 = User();
  (obj2 as User).some();
}