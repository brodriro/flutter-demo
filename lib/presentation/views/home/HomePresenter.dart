import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/views/home/HomeView.dart';

class HomePresenter {
  HomeView homeView;

  void start() {
    debugPrint("===========HomePresenter start verga============");
    this.homeView.onCompleteData(["a", "b"]);
  }
}
