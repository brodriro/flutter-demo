import 'package:base_flutter/data/entities/User.dart';
import 'package:base_flutter/data/entities/UserAuth.dart';

//Interface
abstract class UserRepositoryRemote {
  Future<User> getUser();

  Future<List<User>> getFriends();

  Future<String> getTestAuth();

  Future<UserAuth> login(String user, String password);
}
