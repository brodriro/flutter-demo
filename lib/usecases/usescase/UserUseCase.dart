import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/remote/cloud/CloudUserRepository.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';

class UserUseCase {
  UserRepositoryRemote userRepositoryRemote;

  UserUseCase(this.userRepositoryRemote) {
    this.userRepositoryRemote = Container().resolve<CloudUserRepository>();
    debugPrint("UserUseCase initializated");
  }


  Future<User> getUser() async {
    debugPrint("UsesCase getUser called");
    return await this.userRepositoryRemote.getUser();
  }
}
