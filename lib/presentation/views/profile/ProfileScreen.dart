import 'package:DemoFlutter/data/entities/User.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/cProfile.dart';
import 'package:DemoFlutter/presentation/views/profile/ProfilePresenter.dart';
import 'package:DemoFlutter/presentation/views/profile/ProfileView.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> implements ProfileView {
  ProfilePresenter profilePresenter = Injector.inject().resolve<ProfilePresenter>();
  User user;

  @override
  Widget build(BuildContext context) {
    return (user == null) ? CircularProgressComponent() : ProfileComponent(user);
  }

  @override
  void initState() {
    super.initState();
    initPresenter();
  }

  void initPresenter() {
    this.profilePresenter.start(this);
    this.profilePresenter.getUser();
  }

  @override
  void onCompleteProfile(User user) {
    setState(() {
      this.user = user;
    });
  }

  @override
  void onNetworkError() {
  }
}
