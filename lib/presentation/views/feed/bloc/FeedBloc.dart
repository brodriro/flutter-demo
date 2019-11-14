import 'package:DemoFlutter/domain/entities/Post.dart';
import 'package:DemoFlutter/domain/usescase/PostUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/feed/bloc/FeedEvent.dart';
import 'package:DemoFlutter/presentation/views/feed/bloc/FeedState.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class FeedBloc extends HydratedBloc<FeedEvent, FeedState> {
  PostUseCase postUseCase;

  FeedBloc() {
    this.postUseCase = Injector.inject().resolve<PostUseCase>();
  }

  @override
  FeedState get initialState => super.initialState ?? InitialState();

  @override
  FeedState fromJson(Map<String, dynamic> json) {

    try {
      List<Map<String, dynamic>> list =
          new List<Map<String, dynamic>>.from(json["saveFeedList"]);

      List<Post> postList = List();
      list.forEach((e) => postList.add(Post.fromJson(e)));

      return FeedListReadyState(feedList: postList);
    } catch (_) {
      debugPrint("Error => $_");
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(FeedState state) {
  /*  if (state is FeedListReadyState) {
      var json = state.feedList.map((e) => e.toJson()).toList();
      return {"saveFeedList": json};
    }*/
    return null;
  }

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    if (event is GetData) {
      yield LoadingState();

      try {
        yield FeedListReadyState(feedList: await postUseCase.getPosts());
      } catch (e) {
        yield ErrorState(error: "Error al obtener Publicaciones");
      }
    }
  }
}
