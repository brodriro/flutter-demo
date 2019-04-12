

import 'package:base_flutter/entities/Post.dart';

abstract class FeedView {

  void onFeedComplete(List<Post> posts);

  void onLoading();
  
  void onNetworkError();
}