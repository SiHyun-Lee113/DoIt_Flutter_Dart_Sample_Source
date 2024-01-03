class Super {
  Super() {
    print('Super.Super');
  }

  Super.fromJson(Map data) {
    print('Super Class');
  }
}

class Sub extends Super {
  Sub() {
    print('Sub.Sub');
  }
  Sub.fromJson(Map data) : super.fromJson(data) {
    print('Sub Class');
  }

  Sub.namedConstructor() {
    print('Sub.namedConstructor');
  }
}

void main() {
  var sub = Sub.fromJson({});
  var sub2 = Sub();
  var sub3 = Sub.namedConstructor();
}