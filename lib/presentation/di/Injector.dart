import 'package:DemoFlutter/data/local/DatabaseHelper.dart';
import 'package:DemoFlutter/data/local/db/UserRepositoryLocalImp.dart';
import 'package:DemoFlutter/data/remote/cloud/PostRepositoryRemoteImp.dart';
import 'package:DemoFlutter/data/remote/cloud/UserRepositoryRemoteImp.dart';
import 'package:DemoFlutter/data/remote/network/HttpAuth.dart';
import 'package:DemoFlutter/domain/usescase/PostUseCase.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/FeedDetailPresenter.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';
import 'package:sqflite/sqlite_api.dart';

class Injector {
  static Container mContainer;

  static void setup() {
    Database database;

    mContainer = Container();

    mContainer.registerFactory((c) => new Client());
    mContainer.registerFactory((c) => new HttpAuth());
    mContainer.registerFactory((c) => database);
    mContainer
        .registerFactory((c) => new DatabaseHelper(c.resolve<Database>()));

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

    //Presenter
    mContainer.registerFactory((c) => new FeedDetailPresenter());
  }

  static Container inject() => mContainer;
}
