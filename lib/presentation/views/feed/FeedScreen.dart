import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/presentation/views/components/ItemFade.dart';
import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/PostComponent.dart';
import 'package:DemoFlutter/presentation/views/feed/bloc/FeedBloc.dart';
import 'package:DemoFlutter/presentation/views/feed/bloc/FeedEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/FeedState.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen();

  @override
  State<StatefulWidget> createState() {
    return _FeedScreen();
  }
}

class _FeedScreen extends State<FeedScreen> with TickerProviderStateMixin {
  FeedBloc bloc;
  List<Post> posts;
  final listKey = GlobalKey<AnimatedListState>();

  AnimationController _animationController;
  double animationDuration = 0.0;
  int totalItems = 6; //default
  final int totalDuration = 3500;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedBloc>(
      builder: (context) {
        bloc = FeedBloc();
        bloc.add(GetData());
        return bloc;
      },
      child: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state is FeedListReadyState) {
            posts = state.feedList;
          }

          return (posts == null) ? CircularProgressComponent() : _buildPost();
        },
      ),
    );
  }

  Widget _buildPost() {
    totalItems = posts.length;
    buildAnimationController();
    return AnimatedList(
      //  key: listKey,

      initialItemCount: posts.length,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, index, animation) {
        return _buildRow(posts[index], index, posts.length);
      },
    );
  }

  void buildAnimationController() {
    _animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: totalDuration));
    animationDuration = totalDuration / (100 * (totalDuration / totalItems));
    _animationController.forward();
  }

  Widget _buildRow(Post post, int index, int totalItems) {
    return ItemFade(
      index: index,
      animationController: _animationController,
      duration: animationDuration,
      child: PostComponent(post: post),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    bloc.close();
    super.dispose();
  }
}
