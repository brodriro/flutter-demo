import 'package:base_flutter/entities/User.dart';

//Interface
abstract class UserRepositoryRemote {
  
  Future<User> getUser();

  Future<List<User>> getFriends();

  Future<String> getTestAuth();
}