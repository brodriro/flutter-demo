import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/components/cProfile.dart';
import 'package:base_flutter/presentation/views/profile/ProfilePresenter.dart';
import 'package:base_flutter/presentation/views/profile/ProfileView.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfilePresenter profilePresenter;

  ProfileScreen() {
    this.profilePresenter = Injector.inject().resolve<ProfilePresenter>();
  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> implements ProfileView {
  
  User user;

  @override
  Widget build(BuildContext context) {
    return ProfileComponent(user);
  }

  @override
  void initState() {
    super.initState();
    initPresenter();
  }

  void initPresenter() {
    this.widget.profilePresenter.view = this;
    this.widget.profilePresenter.getUser();
  }

  @override
  void onCompleteProfile(User user) {
    setState(() {
      this.user = user;
    });
  }

  @override
  void onNetworkError() {
    // TODO: implement onNetworkError
  }
}
