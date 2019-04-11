import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/profile/ProfileView.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';
import 'package:flutter/foundation.dart';


class ProfilePresenter {
  ProfileView view;
  UserUseCase userUseCase;

  ProfilePresenter() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  void start() {}

  void getUser() {
    debugPrint("Profile Presenter GetUser()");
    this.userUseCase.getUser()
      .catchError((onError) => {this.view.onNetworkError()})
      .then((_user) => this.view.onCompleteProfile(_user));
  }
}
