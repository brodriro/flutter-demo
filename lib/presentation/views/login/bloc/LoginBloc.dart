import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/utils/Validators.dart';
import 'package:DemoFlutter/presentation/views/login/bloc/LoginEvent.dart';
import 'package:DemoFlutter/presentation/views/login/bloc/LoginState.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

export 'LoginEvent.dart';
export 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserUseCase _userUseCase;

  LoginBloc() {
    this._userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> transformEvents(
    Stream<LoginEvent> events,
    Stream<LoginState> Function(LoginEvent event) next,
  ) {
    //Observa el estado actual
    final observableStream = events as Observable<LoginEvent>;

    // Verifica si el evento actual es diferente a los eventos de los inputs
    final nonDebounceStream = observableStream.where((event) {
      //El evento actual es diferente a los eventos de las cajas de inputs
      return (event is! EmailChanged && event is! PasswordChanged);
    });

    //Verifica si el estado actual va a ser rebotado entre el input de email o password
    final debounceStream = observableStream.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    //Combina los Streams en orden segun el tiempo en que fueron llamados, lanzando el ultimo evento llamado
    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<LoginState> _mapLoginWithDataBase() async* {
    try {
      await _userUseCase.getUserFromDB();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    await Future.delayed(Duration(seconds: 2));
    try {
      await _userUseCase.login(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.success();
      //yield LoginState.failure(); //Falta implementar login
    }
  }
}
