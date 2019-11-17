import 'package:DemoFlutter/domain/entities/User.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserEvent.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserState.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserUseCase userUserCase;

  final _saveFriendsList = "saveFriendsList";

  UserBloc() {
    this.userUserCase = Injector.inject().resolve<UserUseCase>();
  }

  @override
  UserState get initialState => super.initialState ?? UserInitialState();

  @override
  UserState fromJson(Map<String, dynamic> json) {
    try {
      List<Map<String, dynamic>> list =
          new List<Map<String, dynamic>>.from(json[_saveFriendsList]);

      List<User> userList = List();
      list.forEach((e) => userList.add(User.fromJson(e)));

      return UserListFriendsState(friends: userList);
    } catch (_) {
      print("Error => $_");
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(UserState state) {
    if (state is UserListFriendsState) {
      var json = state.friends.map((e) => e.toJson()).toList();
      return {_saveFriendsList: json};
    }
    return null;
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserGetAllFriendsEvent) {
      yield UserLoadingState();

      try {
        yield UserListFriendsState(friends: await userUserCase.getFriends());
      } catch (e) {
        yield UserFailureState(error: "Error al obtener Usuario");
      }
    }
  }
}
