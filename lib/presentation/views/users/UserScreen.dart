import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/components/Miscellaneous.dart';
import 'package:base_flutter/presentation/views/components/RowUserProfile.dart';
import 'package:base_flutter/presentation/views/users/UserPresenter.dart';
import 'package:base_flutter/presentation/views/users/UserView.dart';
import 'package:flutter/cupertino.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserScreen();
  }
}

class _UserScreen extends State<UserScreen> implements UserView {
  UserPresenter userPresenter = Injector.inject().resolve<UserPresenter>();
  List<User> friendsList;

  @override
  void initState() {
    super.initState();
    initPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return (friendsList == null ) ? CircularProgressComponent() :  Container(
        margin: EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: this.friendsList.length,
          itemBuilder: (BuildContext _context, int i) {
            return (this.friendsList.length == 0) ? null : _buildRow(this.friendsList[i]);
          },
        ));
  }
  Widget _buildRow(User user) {
    return RowUserProfile(user);
  }

  @override
  void onCompleteData(List<User> users) {
    setState(() {
      if(this.friendsList == null) this.friendsList = new List();
     this.friendsList = users; 
    });
  }

  @override
  void onNetworkError() {
    // TODO: implement onNetworkError
  }

  void initPresenter() {
    userPresenter.star(this);
  }
}
