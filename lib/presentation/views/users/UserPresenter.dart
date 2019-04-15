

import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/users/UserView.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';

class UserPresenter {
  UserView view;
  UserUseCase userUserCase;

  UserPresenter() {
    this.userUserCase = Injector.inject().resolve<UserUseCase>();
  }

  void star(UserView view) {
    this.view = view;
  }

  void getFriends() {
    this.userUserCase.getFriends()
    .then((list) => this.view.onCompleteData(list),
    onError: () => this.view.onNetworkError());
  }

  
}