

import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/users/UserView.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';

class UserPresenter {
  UserView view;
  UserUseCase userUserCase;

  UserPresenter() {
    this.userUserCase = Injector.inject().resolve<UserUseCase>();
  }

  void star(UserView view) {
    this.view = view;
    this.getFriends();
  }

  void getFriends() {
    this.userUserCase.getFriends()
    .then((list) => this.view.onCompleteData(list),
    onError: (e) => this.view.onNetworkError());
  }

  
}