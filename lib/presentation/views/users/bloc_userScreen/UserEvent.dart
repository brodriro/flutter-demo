import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserStartedEvent extends UserEvent {}

class UserGetAllFriendsEvent extends UserEvent {}
