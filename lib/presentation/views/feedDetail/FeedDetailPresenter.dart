import 'package:base_flutter/entities/Post.dart';
import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/feedDetail/FeedDetailView.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';
import 'package:flutter/foundation.dart';

class FeedDetailPresenter {
  FeedDetailView feedDetailView;
  UserUseCase userUseCase;

  User currentUser;

  FeedDetailPresenter() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
    this.currentUser = this.userUseCase.getCurrentUser;
  }

  void start(FeedDetailView view) {
    this.feedDetailView = view;
    debugPrint("FeedDetailView initializated => User: ${currentUser.getName}");
  }

  void onInputSendMessage(String message) {
    if (message.trim().toString().isEmpty) return;
    Comment comment = new Comment(currentUser.getId, currentUser.getUsername,
        currentUser.getImage, message);
    debugPrint("new comment => ${comment.getComment}");
    this.feedDetailView.addComment(comment);
  }
}
