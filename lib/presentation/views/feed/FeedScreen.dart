import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/cPost.dart';
import 'package:DemoFlutter/presentation/views/feed/FeedPresenter.dart';
import 'package:DemoFlutter/presentation/views/feed/FeedView.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen();

  @override
  State<StatefulWidget> createState() {
    return _FeedScreen();
  }
}

class _FeedScreen extends State<FeedScreen> implements FeedView {
  FeedPresenter feedPresenter = Injector.inject().resolve<FeedPresenter>();
  List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return (posts == null) ? CircularProgressComponent() : _buildPost();
  }

  Widget _buildPost() {
    return new ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        return (posts.length == 0) ? null : _buildRow(posts[i]);
      },
    );
  }

  Widget _buildRow(Post post) {
    return PostComponent(post);
  }

  @override
  void initState() {
    super.initState();
    initPresenter();
  }

  void initPresenter() {
    this.feedPresenter.start(this);
  }

  @override
  void onFeedComplete(List<Post> posts) {
    debugPrint("onFeedComplete");
    setState(() {
      if (this.posts == null) this.posts = new List();
      this.posts = posts;
    });
  }

  @override
  void onNetworkError() {
    debugPrint("onNetorkError");
  }

  @override
  void onLoading() {
    debugPrint("onLoadingData");
  }
}
