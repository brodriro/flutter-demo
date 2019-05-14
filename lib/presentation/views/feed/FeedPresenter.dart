import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/feed/FeedView.dart';
import 'package:base_flutter/usecases/usescase/PostUseCase.dart';

class FeedPresenter {
  FeedView view;
  PostUseCase postUseCase;

  FeedPresenter() {
    this.postUseCase = Injector.inject().resolve<PostUseCase>();
  }

  void start(FeedView view) {
    this.view = view;
    getPosts();
  }

  void getPosts() {
    this.postUseCase.getPosts().then(
        (posts) => this.view.onFeedComplete(posts),
        onError: (e) => this.view.onNetworkError());
  }
}
