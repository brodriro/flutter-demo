

import 'package:base_flutter/entities/Post.dart';

abstract class FeedDetailView {
  void onSendMessage(String message);
  void updateList(Comment comment);
}