import 'dart:convert';

import 'package:base_flutter/entities/User.dart';

UserEntity userEntityFromJson(String str) {
  final jsonData = json.decode(str);
  return UserEntity.fromJson(jsonData);
}

String userEntityToJson(UserEntity data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserEntity {
  int userId;
  int id;
  String title;
  bool completed;

  UserEntity({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => new UserEntity(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };

  static User toUser(UserEntity userEntity) {
    return new User(
      userEntity.userId,
      userEntity.id,
      userEntity.title,
      userEntity.completed
    );
  }
}
