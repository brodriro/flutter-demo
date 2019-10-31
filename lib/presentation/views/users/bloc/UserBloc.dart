import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserEvent.dart';
import 'package:DemoFlutter/presentation/views/users/bloc/UserState.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserUseCase userUserCase;

  UserBloc() {
    this.userUserCase = Injector.inject().resolve<UserUseCase>();
  }

  @override
  UserState get initialState => UserInitialState();

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
