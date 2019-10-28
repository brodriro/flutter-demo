import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/data/entities/User.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/FeedDetailView.dart';

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
  }

  void onInputSendMessage(String message) {
    if (message.trim().toString().isEmpty) return;
    Comment comment = new Comment(currentUser.getId, currentUser.getUsername,
        currentUser.getImage, message);

    this.feedDetailView.addComment(comment);
  }
}
