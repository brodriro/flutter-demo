import 'package:DemoFlutter/data/entities/User.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileEvent.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileState.dart';
import 'package:bloc/bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserUseCase userUseCase;

  ProfileBloc() {
    userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  @override
  ProfileState get initialState => InitialState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetProfile) {
      yield LoadingState();
      try {
        User userResponse = await userUseCase.getUser();
        this.userUseCase.user = userResponse;
        yield UserReadyState(user: userResponse);
      } catch (e) {
        yield ErrorState(error: "Error al obtener Perfil.");
      }
    }
  }
}
