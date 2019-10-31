import 'package:DemoFlutter/data/entities/User.dart';
import 'package:DemoFlutter/data/entities/UserAuth.dart';
import 'package:DemoFlutter/data/local/entities/UserEntity.dart';
import 'package:DemoFlutter/domain/repository/user/UserRepositoryLocal.dart';
import 'package:DemoFlutter/domain/repository/user/UserRepositoryRemote.dart';

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
