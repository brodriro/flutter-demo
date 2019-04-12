import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/home/HomeView.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';
import 'package:flutter/foundation.dart';

class HomePresenter {
  HomeView homeView;
  UserUseCase userUseCase;

  HomePresenter() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  void start() {}

  void getTestAuth() {
    this.userUseCase.testAuth()
      .catchError((onError) => {this.homeView.onNetworkError()})
      .then((_response) => debugPrint("Response on Presenter => $_response"));
  }
}
