import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/local/entities/UserEntity.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryLocal.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';

class UserUseCase {
  UserRepositoryRemote userRepositoryRemote;
  UserRepositoryLocal userRepositoryLocal;

  User user;

  UserUseCase(this.userRepositoryRemote, this.userRepositoryLocal);

  Future<User> getUser() async {
    return await this.userRepositoryRemote.getUser();
  }

  Future<List<User>> getFriends() async {
    return await this.userRepositoryRemote.getFriends();
  }

  Future<String> testAuth() async {
    return await this.userRepositoryRemote.getTestAuth();
  }

  Future<Object> login(String user, String password) async {
    return await this.userRepositoryRemote.login(user, password);
  }

  Future<String> getUserFromDB() async {
    String result = await this.userRepositoryLocal.getUser();

    UserEntity userEntity = new UserEntity();
    userEntity.name = "Developer";
    userEntity.email = "developer@everis.com";


    if(result == null) result = await this.userRepositoryLocal.saveUser(userEntity);
    return result;
  }

  User get getCurrentUser => this.user;
}
