import 'dart:convert';

import 'package:base_flutter/entities/UserAuth.dart';

UserAuthEntity userAuthFromJson(String str) => UserAuthEntity.fromJson(json.decode(str));

String userAuthToJson(UserAuthEntity data) => json.encode(data.toJson());

class UserAuthEntity {
  String username;
  String email;
  String firstName;
  String lastName;
  String token;

  UserAuthEntity({
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.token,
  });

  factory UserAuthEntity.fromJson(Map<String, dynamic> json) => new UserAuthEntity(
    username: json["username"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "token": token,
  };

  static UserAuth toUserAuth(UserAuthEntity entity){
    return new UserAuth(
      username: entity.username,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      token: entity.token
    );
  }
}