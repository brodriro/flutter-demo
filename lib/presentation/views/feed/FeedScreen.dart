import 'package:base_flutter/entities/Post.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/components/cPost.dart';
import 'package:base_flutter/presentation/views/feed/FeedPresenter.dart';
import 'package:base_flutter/presentation/views/feed/FeedView.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  FeedPresenter feedPresenter;

  FeedScreen(){
    this.feedPresenter = Injector.inject().resolve<FeedPresenter>();
  }

  @override
  State<StatefulWidget> createState() {
    return _FeedScreen();
  }
}

class _FeedScreen extends State<FeedScreen> implements FeedView {
  List<String> mListNames = new List<String>();

  @override
  Widget build(BuildContext context) {
    return PostComponent();
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        itemCount: mListNames.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          return (mListNames.length == 0) ? null : _buildRow(mListNames[i]);
        });
  }

  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initPresenter();
    
  }

  void initPresenter() {
    this.widget.feedPresenter.start(this);
  }

  @override
  void onFeedComplete(List<Post> posts) {
    debugPrint("FeedScreen - post size : ${posts}");
  }

  @override
  void onNetworkError() {
    debugPrint("FeedScreen - onNetorkError");
  }
}
