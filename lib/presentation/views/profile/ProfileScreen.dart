import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/cProfile.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileBloc.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileEvent.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> {
  ProfileBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      builder: (context) {
        bloc = ProfileBloc();
        bloc.add(GetProfile());
        return bloc;
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return CircularProgressComponent();
          }
          if (state is UserReadyState) {
            return ProfileComponent(state.user);
          }
          if (state is ErrorState) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Get Profile Failure'), Icon(Icons.error)],
                  ),
                  backgroundColor: Colors.red,
                ),
              );
          }
          return Container();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
