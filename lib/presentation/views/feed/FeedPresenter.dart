import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/feed/FeedView.dart';
import 'package:DemoFlutter/domain/usescase/PostUseCase.dart';

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
