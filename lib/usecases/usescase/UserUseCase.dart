import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/entities/User.dart';

class UserUseCase {
  UserRepositoryRemote userRepositoryRemote;

  User user;

  UserUseCase(this.userRepositoryRemote);


  Future<User> getUser() async {
    return await this.userRepositoryRemote.getUser();
  }

  Future<List<User>> getFriends() async {
    return await this.userRepositoryRemote.getFriends();
  }

  Future<String> testAuth() async {
    return await this.userRepositoryRemote.getTestAuth();
  }

  User get getCurrentUser => this.user; 
}
