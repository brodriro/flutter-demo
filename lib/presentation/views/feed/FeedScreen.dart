import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/presentation/views/components/Miscellaneous.dart';
import 'package:DemoFlutter/presentation/views/components/cPost.dart';
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

class _FeedScreen extends State<FeedScreen> {
  FeedBloc bloc;
  List<Post> posts;

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
          if(state is FeedListReadyState) {
            posts = state.feedList;
          }
          return (posts == null) ? CircularProgressComponent() : _buildPost();
        },
      ),
    );
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
}
