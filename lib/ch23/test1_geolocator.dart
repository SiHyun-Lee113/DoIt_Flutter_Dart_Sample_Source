import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample_for_do_it/util_style/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget {
  @override
  State<NativePluginWidget> createState() => _NativePluginWidgetState();
}

class _NativePluginWidgetState extends State<NativePluginWidget> {
  String? latitude;
  String? longitude;

  getGeoData() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getGeoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Geolocator Test'),),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My Location', style: white_bold(),),
              Text('latitude : $latitude', style: white_bold(),),
              Text('longitude : $longitude', style: white_bold(),),
            ],
          ),
        ),
      ),
    );
  }
}
