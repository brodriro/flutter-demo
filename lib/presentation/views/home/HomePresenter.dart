import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/home/HomeView.dart';
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
