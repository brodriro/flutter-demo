
import 'package:DemoFlutter/data/entities/UserAuth.dart';
import 'package:DemoFlutter/data/local/entities/UserEntity.dart';

abstract class UserRepositoryLocal {

  Future<UserAuth> getUser();

  Future<String> saveUser(UserEntity userEntity);

  Future deleteUser(int id);

}