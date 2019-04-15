
import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/users/UserPresenter.dart';
import 'package:base_flutter/presentation/views/users/UserView.dart';
import 'package:flutter/cupertino.dart';

class UserScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserScreen();
  }
}

class _UserScreen extends State<UserScreen> implements UserView {
  UserPresenter userPresenter = Injector.inject().resolve<UserPresenter>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  @override
  void onCompleteData(List<User> users) {
    // TODO: implement onCompleteData
  }

  @override
  void onNetworkError() {
    // TODO: implement onNetworkError
  }

}