import 'dart:io';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/remote/entities/UserEntity.dart';
import 'package:base_flutter/remote/network/HttpAuth.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:base_flutter/entities/User.dart';
import 'package:http/http.dart';
import 'package:base_flutter/remote/network/ApiURL.dart';

class CloudUserRepository implements UserRepositoryRemote {
  Client _client;
  HttpAuth _httpAuth;
  
  CloudUserRepository(this._client, this._httpAuth);

  @override
  Future<User> getUser() async {
    String url = ApiURL.userUrl;
    UserEntity userEntity;

    final response = await _client.get(url);
    userEntity = userEntityFromJson(response.body);

    return UserEntity.toUser(userEntity);
  }

  Future<String> getTestAuth() async {
    String url = ApiURL.authURL;

    HttpClientResponse response =
        await _httpAuth.getRequest(url);

    var responseBody = await HttpAuth.parseBody(response);
    return responseBody;
  }
}
