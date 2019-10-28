import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/utils/Utils.dart';
import 'package:DemoFlutter/presentation/views/home/HomeRoute.dart';
import 'package:DemoFlutter/presentation/views/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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
          fontFamily: CustomFont.raleway),
      initialRoute: RouteScreen.login,
      routes: {
        RouteScreen.login: (context) => LoginScreen(),
        RouteScreen.home: (context) => HomeRoute(),
      },
    );
  }
}
