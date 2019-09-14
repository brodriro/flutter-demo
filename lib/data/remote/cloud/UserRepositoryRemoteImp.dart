import 'dart:io';
import 'dart:convert';
import 'package:base_flutter/data/entities/User.dart';
import 'package:base_flutter/data/entities/UserAuth.dart';
import 'package:base_flutter/data/remote/entities/UserAuthEntity.dart';
import 'package:base_flutter/data/remote/entities/UserEntity.dart';
import 'package:base_flutter/data/remote/network/ApiURL.dart';
import 'package:base_flutter/data/remote/network/HttpAuth.dart';
import 'package:base_flutter/domain/repository/user/UserRepositoryRemote.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class UserRepositoryRemoteImp implements UserRepositoryRemote {
  Client _client;
  HttpAuth _httpAuth;

  UserRepositoryRemoteImp(this._client, this._httpAuth);

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
