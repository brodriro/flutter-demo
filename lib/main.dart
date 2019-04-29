import 'package:base_flutter/presentation/views/Utils.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/views/home/HomeRoute.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ThemeColor.primaryColor,
    statusBarColor: ThemeColor.primaryColor,
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
        accentColor: ThemeColor.colorAccent,
        primaryColorDark: ThemeColor.primaryColor,
        fontFamily: 'Raleway'),
      home:  HomeRoute(),
    );
  }
}
