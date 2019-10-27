import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserFailure extends UserState {
  final String error;

  const UserFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'UserFailure {error : $error}';
}
