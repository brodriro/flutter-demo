import 'package:DemoFlutter/data/entities/User.dart';
import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/RowUserProfile.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserBloc.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserEvent.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class UserScreen extends StatelessWidget {
  List<User> _friendsList;
  UserBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      builder: (context) {
        _bloc = UserBloc();
        _bloc.add(UserGetAllFriendsEvent());
        return _bloc;
      },
      child: BlocBuilder<UserBloc, UserState>(
        // bloc: bloc,
        builder: (context, state) {
          if (state is UserListFriendsState) {
            _friendsList = state.friends;
          }
          return (_friendsList == null)
              ? CircularProgressComponent()
              : buildList(_friendsList);
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
}
