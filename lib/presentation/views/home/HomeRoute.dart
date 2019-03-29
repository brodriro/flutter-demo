// Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'HomePresenter.dart';
import 'HomeView.dart';

class HomeRoute extends StatefulWidget {
  //Declarar Presenter
  final HomePresenter homePresenter = new HomePresenter();

  @override
  HomeState createState() => new HomeState();
}
//AUTENTICACION MUTUA FLUTTER

class HomeState extends State<HomeRoute> implements HomeView {
  List<String> mListNames = new List<String>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initPresenter();

    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        itemCount: mListNames.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          return (mListNames.length == 0) ? null : _buildRow(mListNames[i]);
        });
  }

  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }

  @override
  void onCompleteData(List<String> list) {
    setState(() {
      mListNames = new List<String>();
      mListNames.addAll(list);
    });
  }

  void initPresenter() {
    this.widget.homePresenter.homeView = this;
    this.widget.homePresenter.start();
    this.widget.homePresenter.getDataList();
  }

  @override
  void dispose() {
    debugPrint("===== dispose =====");
    // TODO: implement dispose
    super.dispose();
  }
}
