import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/views/home/HomeRoute.dart';
import 'package:base_flutter/presentation/di/Injector.dart';

void main() {
  Injector.setup();
  runApp(new DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      title: 'Demo Flutter App',
      theme: ThemeData(fontFamily: 'Raleway'),
      home:  HomeRoute(),
    );
  }
}
