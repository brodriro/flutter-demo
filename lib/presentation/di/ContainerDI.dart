import 'package:base_flutter/remote/cloud/CloudUserRepository.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/usecases/usescase/UserUseCase.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

class ContainerDI {
  
  static void setup() {
    Container mContainer = Container();
    
    mContainer.registerFactory((c) => new Client());
    mContainer.registerFactory((c) => UserRepositoryRemote);
    mContainer.registerFactory((c) => CloudUserRepository(c.resolve<Client>()));
    mContainer.registerFactory((c) => UserUseCase(c.resolve<CloudUserRepository>()));
  }
}