// Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'HomePresenter.dart';
import 'HomeView.dart';

class HomeRoute extends StatefulWidget {
  final HomePresenter homePresenter = new HomePresenter();
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<HomeRoute> implements HomeView {
  List<String> _suggestions = new List<String>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();

    this.widget.homePresenter.homeView = this;
    debugPrint("===========HomePresenter start============");
    this.widget.homePresenter.start();
  }

  @override
  Widget build(BuildContext context) {
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
          return (_suggestions.length == 0) ? null : _buildRow(_suggestions[i]);
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
  void onCompleteData(Iterable<String> iterableList) {
    debugPrint("===========HomePresenter onCompleteData============");
    print("onCompleteData");
     _suggestions.addAll(iterableList);
    setState(() {
       _suggestions.addAll(iterableList);
      debugPrint("===========HomePresenter suggestions: ${_suggestions.length}" );
    
    });
  }
}
