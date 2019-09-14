import 'package:base_flutter/data/entities/Post.dart';
import 'package:base_flutter/data/entities/User.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/feedDetail/FeedDetailView.dart';
import 'package:base_flutter/domain/usescase/UserUseCase.dart';

class FeedDetailPresenter {
  FeedDetailView feedDetailView;
  UserUseCase userUseCase;

  User currentUser;

  FeedDetailPresenter() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
    this.currentUser = this.userUseCase.getCurrentUser;
  }

  void start(FeedDetailView view){
    this.feedDetailView = view;
  }

  void onInputSendMessage(String message) {
    if (message.trim().toString().isEmpty) return;
    Comment comment = new Comment(currentUser.getId, currentUser.getUsername,
        currentUser.getImage, message);
   
    this.feedDetailView.addComment(comment);
  }
}
