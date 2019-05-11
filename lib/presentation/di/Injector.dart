import 'package:base_flutter/presentation/views/feed/FeedPresenter.dart';
import 'package:base_flutter/presentation/views/feedDetail/FeedDetailPresenter.dart';
import 'package:base_flutter/presentation/views/home/HomePresenter.dart';
import 'package:base_flutter/presentation/views/profile/ProfilePresenter.dart';
import 'package:base_flutter/presentation/views/users/UserPresenter.dart';
import 'package:base_flutter/remote/cloud/CloudPostRepository.dart';
import 'package:base_flutter/remote/cloud/CloudUserRepository.dart';
import 'package:base_flutter/remote/network/HttpAuth.dart';
import 'package:base_flutter/usecases/repository/post/PostRepositoryRemote.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/usecases/usescase/PostUseCase.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

class Injector {
  
  static Container mContainer;

  static void setup() {

    mContainer = Container();

    mContainer.registerFactory((c) => new Client());
    mContainer.registerFactory((c) => new HttpAuth());

    mContainer.registerFactory((c) => CloudUserRepository(c.resolve<Client>(), c.resolve<HttpAuth>()));
    mContainer.registerFactory((c) => CloudPostRepository(c.resolve<Client>()));

    mContainer.registerSingleton((c) => UserUseCase(c.resolve<CloudUserRepository>()));
    mContainer.registerFactory((c) => PostUseCase(c.resolve<CloudPostRepository>()));


    //Presenter
    mContainer.registerFactory((c) => new HomePresenter());
    mContainer.registerFactory((c) => new ProfilePresenter());
    mContainer.registerFactory((c) => new FeedPresenter());
    mContainer.registerFactory((c) => new FeedDetailPresenter());
    mContainer.registerFactory((c) => new UserPresenter());
  }
  
  static Container inject() => mContainer; 
}