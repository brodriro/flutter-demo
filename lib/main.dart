// Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'presentation/views/home/HomeRoute.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home:  new HomeRoute( new DefaultPresenter()),
    );
  }
}

class DefaultPresenter {
  void destroy(){}
}