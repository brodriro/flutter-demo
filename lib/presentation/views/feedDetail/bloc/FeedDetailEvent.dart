import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class FeedDetailEvent extends Equatable {
  const FeedDetailEvent();

  @override
  List<Object> get props => [];
}

class InputSendMessage extends FeedDetailEvent {
  String comment;

  InputSendMessage({@required this.comment});

  @override
  List<Object> get props => [comment];

  @override
  String toString() => "InputSendMessageEvent:$comment";
}
