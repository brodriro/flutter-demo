import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/views/home/HomeRoute.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue,
    statusBarColor: Colors.blue,
  ));
  Injector.setup();
  runApp(new DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      title: 'Demo Flutter App',
      theme: ThemeData(
        accentColor: Colors.blueAccent,
        primaryColorDark: Colors.blue,
        fontFamily: 'Raleway'),
      home:  HomeRoute(),
    );
  }
}
