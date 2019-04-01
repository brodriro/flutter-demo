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

    final response = await _client.get(url);
    userEntity = userEntityFromJson(response.body);

    return UserEntity.toUser(userEntity);
  }
}

