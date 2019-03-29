import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:base_flutter/presentation/views/home/HomeView.dart';
import 'package:base_flutter/usecases/UserUseCase.dart';

class HomePresenter {
  HomeView homeView;
  UserUserCase userCase;

  void start() {
    debugPrint("Start Presenter");
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
