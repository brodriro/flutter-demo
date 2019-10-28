import 'package:DemoFlutter/data/entities/User.dart';
import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/RowUserProfile.dart';
import 'package:DemoFlutter/presentation/views/users/UserView.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserBloc.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserEvent.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserScreen();
  }
}

class _UserScreen extends State<UserScreen> implements UserView {
  //UserPresenter userPresenter = Injector.inject().resolve<UserPresenter>();
  List<User> friendsList;
  UserBloc bloc;

  @override
  void initState() {
    super.initState();
    initPresenter();
  }

  @override
  Widget build(BuildContext context) {
    /* return (friendsList == null ) ? CircularProgressComponent() :  Container(
        margin: EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: this.friendsList.length,
          itemBuilder: (BuildContext _context, int i) {
            return (this.friendsList.length == 0) ? null : _buildRow(this.friendsList[i]);
          },
        ));*/

    return BlocProvider<UserBloc>(
      builder: (context) {
        bloc = UserBloc();
        bloc.add(UserGetAllFriendsEvent());
        return bloc;
      },
      child: BlocBuilder<UserBloc, UserState>(
       // bloc: bloc,
        builder: (context, state) {
          if (state is UserListFriendsState) {
            friendsList = state.friends;
          }
          return (friendsList == null)
              ? CircularProgressComponent()
              : buildList(friendsList);
        },
      ),
    );
  }

  Container buildList(List<User> friendsList) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: friendsList.length,
          itemBuilder: (BuildContext _context, int i) {
            return (friendsList.length == 0) ? null : _buildRow(friendsList[i]);
          },
        ));
  }

  Widget _buildRow(User user) {
    return RowUserProfile(user);
  }

  @override
  void onCompleteData(List<User> users) {
    setState(() {
      if (this.friendsList == null) this.friendsList = new List();
      this.friendsList = users;
    });
  }

  @override
  void onNetworkError() {}

  void initPresenter() {
    // userPresenter.star(this);
  }
}
