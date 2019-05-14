import 'dart:io';
import 'dart:convert';
import 'package:base_flutter/entities/User.dart';
import 'package:base_flutter/entities/UserAuth.dart';
import 'package:base_flutter/remote/entities/UserAuthEntity.dart';
import 'package:base_flutter/remote/entities/UserEntity.dart';
import 'package:base_flutter/remote/network/ApiURL.dart';
import 'package:base_flutter/remote/network/HttpAuth.dart';
import 'package:base_flutter/usecases/repository/user/UserRepositoryRemote.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

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

    HttpClientResponse response = await _httpAuth.getRequest(url);

    var responseBody = await HttpAuth.parseBody(response);
    return responseBody;
  }

  @override
  Future<List<User>> getFriends() async {
    String url = ApiURL.friends;
    List<UserEntity> userEntity;

    final response = await _client.get(url);
    userEntity = listUserEntityFromJson(response.body);

    return UserEntity.toList(userEntity);
  }

  @override
  Future<UserAuth> login(String user, String password) async {
    String url = ApiURL.authURL;

    Map<String, String> body = {"username": user, "password": password};

    HttpClientResponse response = await _httpAuth.postRequest(url, body);

    var responseBody = await HttpAuth.parseBody(response);

    debugPrint("ResponseBody: $responseBody");
    var _response = json.decode(responseBody);

    if(_response["status"]["code"] != 1) throw Exception("Error Auth");

    var data = _response["user"];

    return UserAuthEntity.toUserAuth(UserAuthEntity.fromJson(data));
  }
}
