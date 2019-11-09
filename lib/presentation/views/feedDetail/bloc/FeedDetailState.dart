import 'package:DemoFlutter/domain/entities/Post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class FeedDetailState extends Equatable {
  const FeedDetailState();

  @override
  List<Object> get props => [];
}

class InitialState extends FeedDetailState {}

class InputEmpty extends FeedDetailState{
  final String text;
  InputEmpty({@required this.text});

  @override
  List<Object> get props => [text];
}

class AddComment extends FeedDetailState{

  final Comment comment;

  AddComment({@required this.comment});

  @override
  List<Object> get props => [comment];

  @override
  String toString() => "AddComentState: $comment";
}