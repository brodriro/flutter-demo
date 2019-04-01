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

  int indexTap = 0;

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initPresenter();
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> widgetsChildren = [
      ProfileComponent(user),
      Text("hi"),
      Text("data")
    ];
    //debugPrint("build Home route - User : ${user.getUsername}");

    return new Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("")),
            ]),
      ),
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
      user = _user;
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
