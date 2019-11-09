import 'package:DemoFlutter/domain/entities/User.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserListFriendsState extends UserState {
  final List<User> friends;

  const UserListFriendsState({@required this.friends});

  @override
  List<Object> get props => [friends];

  @override
  String toString() => 'UserFriendsList : $friends';
}

class UserFailureState extends UserState {
  final String error;

  const UserFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'UserFailure {error : $error}';
}
