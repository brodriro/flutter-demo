import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/utils/Utils.dart';
import 'package:DemoFlutter/presentation/views/home/HomeScreen.dart';
import 'package:DemoFlutter/presentation/views/login/LoginScreen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  BlocSupervisor.delegate = await  HydratedBlocDelegate.build();

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
          primaryColor: ThemeColor.primaryColor,
          accentColor: ThemeColor.colorAccent,
          primaryColorDark: ThemeColor.primaryColor,
          fontFamily: CustomFont.roboto),
      initialRoute: RouteScreen.home,
      debugShowCheckedModeBanner: false,
      routes: {
        RouteScreen.login: (context) => LoginScreen(),
        RouteScreen.home: (context) => HomeScreen(),
      },
    );
  }
}
