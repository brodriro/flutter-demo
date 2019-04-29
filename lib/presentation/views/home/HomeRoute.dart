import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/feed/FeedScreen.dart';
import 'package:base_flutter/presentation/views/profile/ProfileScreen.dart';
import 'package:base_flutter/presentation/views/users/UserScreen.dart';
import 'package:flutter/material.dart';
import 'HomePresenter.dart';
import 'HomeView.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute();

  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomeRoute> implements HomeView {
  HomePresenter homePresenter = Injector.inject().resolve<HomePresenter>();

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
    //this.widget.homePresenter.getTestAuth();
    final List<Widget> widgetsChildren = [
      ProfileScreen(),
      FeedScreen(),
      UserScreen()
    ];

    return new Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.blueAccent, primaryColor: Colors.white),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_comment), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("")),
          ],
        ),
      ),
    );
  }

  @override
  void onNetworkError() {
    debugPrint("Screen: network Error");
  }

  void initPresenter() {
    this.homePresenter.homeView = this;
  }
}
