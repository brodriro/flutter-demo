import 'package:DemoFlutter/domain/entities/User.dart';
import 'package:DemoFlutter/domain/entities/UserAuth.dart';

//Interface
abstract class UserRepositoryRemote {
  Future<User> getUser();

  Future<List<User>> getFriends();

  Future<UserAuth> login(String user, String password);
}
