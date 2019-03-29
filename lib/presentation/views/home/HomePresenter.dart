import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'HomeView.dart';
import '../../../main.dart';

class HomePresenter implements DefaultPresenter {
  HomeView homeView;

  void start() {
    debugPrint("===========HomePresenter start2============");
    homeView.onCompleteData();
  }

  @override
  void destroy() {}
}
