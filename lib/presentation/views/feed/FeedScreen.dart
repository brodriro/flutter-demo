import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/PostComponent.dart';
import 'package:DemoFlutter/presentation/views/feed/bloc/FeedBloc.dart';
import 'package:DemoFlutter/presentation/views/feed/bloc/FeedEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/FeedState.dart';

class FeedScreen extends StatefulWidget {
 const FeedScreen({Key key}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _FeedScreen();
  }
}

class _FeedScreen extends State<FeedScreen> with TickerProviderStateMixin {
  FeedBloc bloc;
  List<Post> posts;

  AnimationController _animationController;
  Animation<double> _animation;
  final int totalDuration = 500;

  @override
  void initState() {
    bloc = FeedBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedBloc>(
      builder: (context) {
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
    buildAnimationController();
    return AnimatedList(
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

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  Widget _buildRow(Post post, int index, int totalItems) {
    int duration = _animationController.duration.inMilliseconds;
    double durationInMillis = (duration + ((duration / totalItems) * index));

    return AnimatedBuilder(
      child: PostComponent(post: post),
      animation: _animation,
      builder: (context, child) {
        return AnimatedOpacity(
          opacity: _animation.value,
          duration: Duration(milliseconds: durationInMillis.toInt()),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    bloc.close();
    super.dispose();
  }
}
