import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/home/bloc/HomeEvent.dart';
import 'package:DemoFlutter/presentation/views/home/bloc/HomeState.dart';
import 'package:bloc/bloc.dart';
export 'HomeEvent.dart';
export 'HomeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserUseCase _userUseCase;

  HomeBloc() {
    this._userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  @override
  HomeState get initialState => StartedState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is CheckUserInDatabase) {
      try {
        await _userUseCase.getUserFromDB();
        yield UserLoggedState();
      } catch (exception) {
        yield FailedState();
      }
    }
  }
}
