String? str = "hello";



void main() {
  str?.isEmpty;

  int? no1 = 10;
  bool? result1 = no1?.isEven;
  print('result1 : $result1');

  no1 = null;
  bool? result2 = no1?.isEven;
  print('result1 : $result2');


  int? data3;
  data3 ??= 10;
  print('data3 : $data3');
  data3 ??= null;
  print('data3 : $data3');

  String? data4 = 'hell0';
  String? result = data4 ?? 'world';
  print('result : $result');

  data4 = null;
  result = data4 ?? 'world';
  print('result : $result');
}
