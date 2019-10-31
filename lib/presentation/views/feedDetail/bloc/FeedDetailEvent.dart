import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class FeedDetailEvent extends Equatable {
  const FeedDetailEvent();

  @override
  List<Object> get props => [];
}

class GetData extends FeedDetailEvent {}
class NewCommentEvent extends FeedDetailEvent {
  String comment;

  NewCommentEvent({@required this.comment});

  @override
  List<Object> get props => [comment];
}
