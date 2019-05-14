import 'package:base_flutter/local/DatabaseHelper.dart';
import 'package:base_flutter/local/db/DbUserRepository.dart';
import 'package:base_flutter/presentation/views/feed/FeedPresenter.dart';
import 'package:base_flutter/presentation/views/feedDetail/FeedDetailPresenter.dart';
import 'package:base_flutter/presentation/views/home/HomePresenter.dart';
import 'package:base_flutter/presentation/views/login/LoginPresenter.dart';
import 'package:base_flutter/presentation/views/profile/ProfilePresenter.dart';
import 'package:base_flutter/presentation/views/users/UserPresenter.dart';
import 'package:base_flutter/remote/cloud/CloudPostRepository.dart';
import 'package:base_flutter/remote/cloud/CloudUserRepository.dart';
import 'package:base_flutter/remote/network/HttpAuth.dart';
import 'package:base_flutter/usecases/usescase/PostUseCase.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';
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
    mContainer.registerFactory((c)=> database);
    mContainer.registerFactory((c)=> new DatabaseHelper(c.resolve<Database>()));

    mContainer.registerFactory((c) => CloudUserRepository(c.resolve<Client>(), c.resolve<HttpAuth>()));
    mContainer.registerFactory((c) => CloudPostRepository(c.resolve<Client>()));
    mContainer.registerFactory((c)=> DbUserRepository(c.resolve<DatabaseHelper>()));

    mContainer.registerSingleton((c) => UserUseCase(c.resolve<CloudUserRepository>(), c.resolve<DbUserRepository>()));
    mContainer.registerFactory((c) => PostUseCase(c.resolve<CloudPostRepository>()));


    //Presenter
    mContainer.registerFactory((c) => new LoginPresenter());
    mContainer.registerFactory((c) => new HomePresenter());
    mContainer.registerFactory((c) => new ProfilePresenter());
    mContainer.registerFactory((c) => new FeedPresenter());
    mContainer.registerFactory((c) => new FeedDetailPresenter());
    mContainer.registerFactory((c) => new UserPresenter());
  }
  
  static Container inject() => mContainer; 
}