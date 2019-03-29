// Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'HomePresenter.dart';
import 'HomeView.dart';

class HomeRoute extends StatefulWidget {
  final HomePresenter homePresenter;
  HomeRoute(this.homePresenter) : super();
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<HomeRoute> implements HomeView {
  final HomePresenter homePresenter = new HomePresenter();
  List<String> _suggestions = [];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    
    debugPrint("===========HomePresenter start============");

    homePresenter.start();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(_suggestions[i]);
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
  void onCompleteData() {
    debugPrint("===========HomePresenter onCompleteData============");
    print("onCompleteData");
    /*setState(() {
      _suggestions.addAll(iterableList);
    });*/
  }

}
