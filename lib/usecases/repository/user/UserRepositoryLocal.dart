
import 'package:base_flutter/entities/UserAuth.dart';
import 'package:base_flutter/local/entities/UserEntity.dart';

abstract class UserRepositoryLocal {

  Future<UserAuth> getUser();

  Future<String> saveUser(UserEntity userEntity);

  Future deleteUser(int id);

}