import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class StartedState extends HomeState {}

class UserLoggedState extends HomeState {}

class FailedState extends HomeState {
  final String error;

  const FailedState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return "FailedEvent: $error";
  }
}
