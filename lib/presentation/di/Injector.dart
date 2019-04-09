import 'package:base_flutter/presentation/views/home/HomePresenter.dart';
import 'package:base_flutter/remote/cloud/CloudUserRepository.dart';
import 'package:base_flutter/remote/network/HttpAuth.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

class Injector {
  
  static Container mContainer;

  static void setup() {

    mContainer = Container();

    mContainer.registerFactory((c) => new Client());
    mContainer.registerFactory((c) => new HttpAuth());
    mContainer.registerFactory((c) => UserRepositoryRemote);
    mContainer.registerFactory((c) => CloudUserRepository(c.resolve<Client>(), c.resolve<HttpAuth>()));
    mContainer.registerFactory((c) => UserUseCase(c.resolve<CloudUserRepository>()));


    //Presenter
    mContainer.registerFactory((c) => new HomePresenter());
  }
  
  static Container inject() => mContainer; 
}