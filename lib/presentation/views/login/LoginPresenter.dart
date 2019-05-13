import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/login/LoginView.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';

class LoginPresenter {
  LoginView loginView;
  UserUseCase userUseCase;

  LoginPresenter() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  void start(LoginView view) {
    this.loginView = view;
  }

  void onLoginClick(String username, String password) {
    this.userUseCase.login(username, password).then(
        (response) => {this.loginView.onLoginSuccess()},
        onError: (e) => this.loginView.onNetworkError());
  }
}
