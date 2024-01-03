some() {
  throw const FormatException('test Exception');
}

void main(List<String> args){
  try {
    print('step1.....');
    some();
    print('step2.....');
  } on FormatException {
    print('step3.....');
  } on Exception {
    print('step4.....');
  } finally {
    print('step5.....');
  }
  print('step6.....');
}
