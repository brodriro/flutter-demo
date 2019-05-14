import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/entities/UserAuth.dart';

//Interface
abstract class UserRepositoryRemote {
  Future<User> getUser();

  Future<List<User>> getFriends();

  Future<String> getTestAuth();

  Future<UserAuth> login(String user, String password);
}
