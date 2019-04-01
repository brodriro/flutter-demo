import 'package:base_flutter/remote/entities/UserEntity.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:flutter/foundation.dart';
import 'package:base_flutter/entities/User.dart';
import 'package:http/http.dart' show Client;
import 'package:base_flutter/remote/network/ApiURL.dart';
import 'package:kiwi/kiwi.dart';

class CloudUserRepository implements UserRepositoryRemote {
  Client _client;

  CloudUserRepository(this._client) {
    _client = Container().resolve<Client>();
  }

  @override
  Future<User> getUser() async {
    String url = ApiURL.userUrl;
    UserEntity userEntity;

    debugPrint(
        "Obteniendoo usuario desde consulta HTTP desde CloudUserRepository");

    final response = await _client.get(url);
    debugPrint(
        "====> Response status code: ${response.statusCode} <======");
    userEntity = userEntityFromJson(response.body);

    debugPrint(
        "====> Usuario obtenido ${response.body} <======");

    return UserEntity.toUser(userEntity);
  }
}
/**
 * https://app.quicktype.io/
 * https://jsonplaceholder.typicode.com/
 * 
 */
