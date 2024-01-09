class Super {
  Super(int arg);
  Super.first();
}

class Sub extends Super{
  Sub() : super(10);
  Sub.name() : super.first();
}