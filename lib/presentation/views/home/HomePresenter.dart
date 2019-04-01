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
    debugPrint("Presenter: getUser.Call()");

    this.userUseCase.getUser()
    .catchError((onError)=>{
      debugPrint("Presenter: userUseCase.CallError() => ${onError}")
    });

    debugPrint("Presenter: Usuario recibido");
  }

  void getDataList() {

    Observable.just((result)=>{
      this.homeView.onCompleteData(["a", "c", "d"])
    })
    .handleError((error)=>{
      debugPrint("handleError:" + error)
    }).doOnListen(() => {
      debugPrint("Finish")
    });
    
  }
}
