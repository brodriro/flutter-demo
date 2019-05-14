
import 'package:base_flutter/local/entities/UserEntity.dart';

abstract class UserRepositoryLocal {

  Future<String> getUser();

  Future<String> saveUser(UserEntity userEntity);

  Future<String> deleteUser();

}