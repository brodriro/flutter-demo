import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/entities/User.dart';

class UserUseCase {
  UserRepositoryRemote userRepositoryRemote;

  UserUseCase(this.userRepositoryRemote);


  Future<User> getUser() async {
    return await this.userRepositoryRemote.getUser();
  }

  Future<String> testAuth() async {
    return await this.userRepositoryRemote.getTestAuth();
  }
}
