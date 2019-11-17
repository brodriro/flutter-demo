import 'package:DemoFlutter/domain/entities/User.dart';
import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/RowUserProfile.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserBloc.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserEvent.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with TickerProviderStateMixin {
  List<User> _friendsList;

  UserBloc _bloc = UserBloc();

  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      builder: (context) => _bloc,
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {},
        child: BlocBuilder<UserBloc, UserState>(
          key: widget.key,
          builder: (context, state) {
            if (state is UserInitialState && _friendsList == null) {
              _bloc.add(UserGetAllFriendsEvent());
            }
            if (state is UserListFriendsState) {
              _friendsList = state.friends;
            }

            return (_friendsList == null || _friendsList.isEmpty)
                ? CircularProgressComponent()
                : buildList(_friendsList);
          },
        ),
      ),
    );
  }

  Container buildList(List<User> friendsList) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: ListView.builder(
          itemCount: friendsList.length,
          itemBuilder: (BuildContext _context, int i) {
            if (friendsList.length == 0) return Container();

            return _buildRow(friendsList[i], i, friendsList.length);
          },
        ));
  }

  Widget _buildRow(User user, int index, int totalItems) {
    int duration = 300;
    int durationInMillis =
        (duration + ((duration / totalItems) * index)).toInt();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: durationInMillis));
    animation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(animationController);
    animationController.forward();

    return SlideTransition(
      position: animation,
      child: RowUserProfile(user),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    _bloc.close();
    super.dispose();
  }
}
