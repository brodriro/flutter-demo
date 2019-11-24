import 'package:DemoFlutter/data/local/db/UserRepositoryLocalImp.dart';
import 'package:DemoFlutter/data/local/entities/UserEntity.dart';
import 'package:DemoFlutter/data/remote/cloud/PostRepositoryRemoteImp.dart';
import 'package:DemoFlutter/data/remote/cloud/UserRepositoryRemoteImp.dart';
import 'package:DemoFlutter/data/remote/network/HttpAuth.dart';
import 'package:DemoFlutter/domain/usescase/PostUseCase.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';
import 'package:sql_helper/sql_helper.dart';

class Injector {
  static Container mContainer;

  static void setup() {
    mContainer = Container();

    mContainer.registerFactory((c) => new Client());
    mContainer.registerFactory((c) => new HttpAuth());
    mContainer.registerSingleton((c) {
      DatabaseHelper _dbInstance =
          SqlHelperBuilder(dbName: 'flutter_demo', dbVersion: 1).build();

      List<String> tables = new List();
      tables.add(UserEntity.createTable);

      _dbInstance.init(tables);

      return _dbInstance;
    });

    mContainer.registerFactory((c) =>
        UserRepositoryRemoteImp(c.resolve<Client>(), c.resolve<HttpAuth>()));
    mContainer
        .registerFactory((c) => PostRepositoryRemoteImp(c.resolve<Client>()));
    mContainer.registerFactory(
        (c) => UserRepositoryLocalImp(c.resolve<DatabaseHelper>()));

    mContainer.registerSingleton((c) => UserUseCase(
        c.resolve<UserRepositoryRemoteImp>(),
        c.resolve<UserRepositoryLocalImp>()));
    mContainer.registerFactory(
        (c) => PostUseCase(c.resolve<PostRepositoryRemoteImp>()));

    //BLoCs
  }

  static Container inject() => mContainer;
}
