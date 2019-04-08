import 'dart:_http';
import 'dart:io';

import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/remote/entities/UserEntity.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/entities/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:base_flutter/remote/network/ApiURL.dart';

class CloudUserRepository implements UserRepositoryRemote {
  Client _client;

  CloudUserRepository(this._client) {
    _client = Injector.inject().resolve<Client>();
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
