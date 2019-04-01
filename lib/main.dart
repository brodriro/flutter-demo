import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/views/home/HomeRoute.dart';
import 'package:base_flutter/presentation/di/ContainerDI.dart';

void main() { 
  debugPrint(">>>>>>>>>>> START APPLICATION FLUTTER <<<<<<<<<<<<<");
  ContainerDI.setup();
  runApp(new DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      title: 'Startup Name Generator',
      home:  new HomeRoute(),
    );
  }
}
