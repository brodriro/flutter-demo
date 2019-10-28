import 'package:DemoFlutter/data/entities/Post.dart';

abstract class FeedView {
  void onFeedComplete(List<Post> posts);

  void onLoading();

  void onNetworkError();
}
