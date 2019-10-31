import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class FeedDetailState extends Equatable {
  const FeedDetailState();

  @override
  List<Object> get props => [];
}

class InitialState extends FeedDetailState {}

class CommentAdded extends FeedDetailState{
  Comment comment;

  CommentAdded({@required this.comment});

  @override
  List<Object> get props => [comment];
}