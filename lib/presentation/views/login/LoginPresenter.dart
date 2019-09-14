import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/login/LoginView.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:flutter/foundation.dart';

class LoginPresenter {
  LoginView loginView;
  UserUseCase userUseCase;

  LoginPresenter() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  void start(LoginView view) {
    this.loginView = view;

    userUseCase.getUserFromDB().then(
        (response) => debugPrint("Response => ${response.email}"),
      onError: (e) => debugPrint("Fail DB : $e")
    );
  }

  void onLoginClick(String username, String password) {
    this.userUseCase.login(username, password).then(
        (response) => this.loginView.onLoginSuccess(),
        onError: (e) => this.loginView.onLoginSuccess());
  }
}
