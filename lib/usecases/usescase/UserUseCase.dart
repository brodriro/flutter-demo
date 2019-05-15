import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/entities/UserAuth.dart';
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

  Future login(String user, String password) async {
    UserAuth userAuth =  await this.userRepositoryRemote.login(user, password);
    saveUser(UserEntity.toUserEntity(userAuth));
  }

  Future<UserAuth> getUserFromDB() async {
    return await this.userRepositoryLocal.getUser();
  }
  Future saveUser(UserEntity userEntity) async {
    await this.userRepositoryLocal.saveUser(userEntity);
  }

  User get getCurrentUser => this.user;
}
