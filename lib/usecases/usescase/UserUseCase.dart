import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/remote/cloud/CloudUserRepository.dart';

class UserUseCase {
  UserRepositoryRemote userRepositoryRemote;

  UserUseCase(this.userRepositoryRemote) {
    this.userRepositoryRemote = Injector.inject().resolve<CloudUserRepository>();
  }


  Future<User> getUser() async {
    return await this.userRepositoryRemote.getUser();
  }

  Future<String> testAuth() async {
    return await this.userRepositoryRemote.getTestAuth();
  }
}
