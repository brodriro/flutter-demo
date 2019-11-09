import 'package:DemoFlutter/domain/entities/Post.dart';
import 'package:DemoFlutter/domain/entities/User.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/bloc/FeedDetailEvent.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/bloc/FeedDetailState.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class FeedDetailBloc extends Bloc<FeedDetailEvent, FeedDetailState> {
  UserUseCase userUseCase;

  User currentUser;

  FeedDetailBloc() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
    this.currentUser = this.userUseCase.getCurrentUser;
  }

  @override
  FeedDetailState get initialState => InitialState();

  @override
  Stream<FeedDetailState> mapEventToState(FeedDetailEvent event) async* {
    if (event is InputSendMessage) {
      debugPrint("mapEventToState ===> $event");
      if (event.comment.trim().toString().isEmpty) {
        yield InputEmpty(text: "Text field is empty");
        return;
      }

      Comment comment = new Comment(currentUser.getId, currentUser.getUsername,
          currentUser.getImage, event.comment);

      yield AddComment(comment: comment);
    }
  }
}
