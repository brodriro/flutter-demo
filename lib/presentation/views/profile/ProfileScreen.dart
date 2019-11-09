import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/ProfileComponent.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileBloc.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileEvent.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
 const ProfileScreen( {Key key}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> {

  ProfileBloc bloc = ProfileBloc();
  @override
  Widget build(BuildContext context) {

    return BlocProvider<ProfileBloc>(
      builder: (context) =>  bloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: bloc,
        builder: (context, state) {
          if(state is InitialState) { //Evita que al recuperar el estado se repliquen las llamadas a la API
            bloc.add(GetProfile());
          }
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
    debugPrint("ProfileScreen dispose()");
   // bloc.close();
    super.dispose();
  }
}
