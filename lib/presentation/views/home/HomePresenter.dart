import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:rxdart/rxdart.dart';
import 'package:base_flutter/presentation/views/home/HomeView.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';

class HomePresenter {
  HomeView homeView;
  UserUseCase userUseCase;

  HomePresenter() {
    this.userUseCase = Container().resolve<UserUseCase>();
  }

  void start() {
    debugPrint("Start Presenter");
  }

  void getUser() {
    this.userUseCase.getUser()
    .catchError((onError)=>{ this.homeView.onNetworkError() })
    .then((_user) => this.homeView.onCompleteProfile(_user) );
  }

}
