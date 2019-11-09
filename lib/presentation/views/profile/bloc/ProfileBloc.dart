import 'package:DemoFlutter/domain/entities/User.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileEvent.dart';
import 'package:DemoFlutter/presentation/views/profile/bloc/ProfileState.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ProfileBloc extends HydratedBloc<ProfileEvent, ProfileState> {
  UserUseCase userUseCase;

  ProfileBloc() {
    userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  @override
  ProfileState get initialState {
    return super.initialState ?? InitialState();
  }

  @override
  ProfileState fromJson(Map<String, dynamic> json) {
    try {
      final profile = User.fromJson(json);
      return UserReadyState(user: profile);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ProfileState state) {
    if (state is UserReadyState) {
      return state.user.toJson();
    }
    return null;
  }

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
