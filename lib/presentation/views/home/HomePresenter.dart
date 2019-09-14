import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/home/HomeView.dart';
import 'package:base_flutter/domain/usescase/UserUseCase.dart';
import 'package:flutter/foundation.dart';

class HomePresenter {
  HomeView homeView;
  UserUseCase userUseCase;

  HomePresenter() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  void start(HomeView view) {
    this.homeView = view;
  }

  void getTestAuth() {
    this.userUseCase.testAuth().then(
        (response) => debugPrint("Response on Presenter => $response"),
        onError: (e) => this.homeView.onNetworkError());
  }
}
