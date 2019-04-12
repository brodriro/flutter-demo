

import 'package:base_flutter/entities/Post.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/feedDetail/FeedDetailView.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';
import 'package:flutter/foundation.dart';

class FeedDetailPresenter {
  
  FeedDetailView view;
  UserUseCase userUseCase;

  FeedDetailPresenter(){
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
  }
  
  void start(FeedDetailView view) {
    this.view = view;
    getUser();
  }

  void getUser() {
    debugPrint("Getuser Feed Detail Presenter => User: ${this.userUseCase.user.getName}");
  }

}