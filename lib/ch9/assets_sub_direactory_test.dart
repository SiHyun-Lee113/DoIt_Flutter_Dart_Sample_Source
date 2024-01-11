import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AssetsImageTestApp());
}

class AssetsImageTestApp extends StatefulWidget {
  const AssetsImageTestApp({Key? key}) : super(key: key);

  @override
  State<AssetsImageTestApp> createState() => _AssetsImageTestAppState();
}

class _AssetsImageTestAppState extends State<AssetsImageTestApp> {
  @override
  Widget build(BuildContext context) {
    PlatformAssetBundle assetBundle = PlatformAssetBundle();
    var string = assetBundle.toString();
    print(string);

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("이미지 디렉토리별 참조 테스트"),),
          body: Column(
            children: [
              Image.asset('images/1.png'),
              Text("Flutter 3.16 이후로 자동 변형을 지원함. 따라서 변경이 안되는 것이 맞음")
            ],
          ),
        ),
    );
  }
}
