import 'package:base_flutter/entities/User.dart';
import 'package:flutter/material.dart';
import 'HomePresenter.dart';
import 'HomeView.dart';
import '../components/cProfile.dart';

class HomeRoute extends StatefulWidget {
  //Declarar Presenter
  final HomePresenter homePresenter = new HomePresenter();
  
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomeRoute> implements HomeView {
  List<String> mListNames = new List<String>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  User user;

  @override
  void initState() {
    super.initState();
    initPresenter();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build Home route - User : ${user.getUsername}");

    return new Scaffold(
      body: ProfileComponent(user)

    );
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
  void onCompleteProfile(User _user) {
    setState(() {
     this.user = _user; 
     debugPrint("Screen : User ${user.getUsername}");
    });
    
  }

  @override
  void onNetworkError() {
    debugPrint("Screen: network Error");
  }

  void initPresenter() {
    this.widget.homePresenter.homeView = this;
    this.widget.homePresenter.start();
    this.widget.homePresenter.getUser();
  }
}
