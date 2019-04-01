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
  String username;
  String name;
  String lastname;
  String image;
  String occupation;
  String age;
  String email;
  String location;
  SocialEntity socialEntity;

  UserEntity({
    this.username,
    this.name,
    this.lastname,
    this.image,
    this.occupation,
    this.age,
    this.email,
    this.location,
    this.socialEntity,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => new UserEntity(
        username: json["username"],
        name: json["name"],
        lastname: json["lastname"],
        image: json["image"],
        occupation: json["occupation"],
        age: json["age"],
        email: json["email"],
        location: json["location"],
        socialEntity: SocialEntity.fromJson(json["social"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "lastname": lastname,
        "image": image,
        "occupation": occupation,
        "age": age,
        "email": email,
        "location": location,
        "social": socialEntity.toJson(),
      };

  static User toUser(UserEntity userEntity) {
    return new User(
        userEntity.username,
        userEntity.name,
        userEntity.lastname,
        userEntity.image,
        userEntity.occupation,
        userEntity.age,
        userEntity.email,
        userEntity.location,
        SocialEntity.toSocial(userEntity.socialEntity));
  }
}

class SocialEntity {
  int posts;
  int likes;
  int shares;
  int friends;

  SocialEntity({
    this.posts,
    this.likes,
    this.shares,
    this.friends,
  });

  factory SocialEntity.fromJson(Map<String, dynamic> json) => new SocialEntity(
        posts: json["posts"],
        likes: json["likes"],
        shares: json["shares"],
        friends: json["friends"],
      );

  Map<String, dynamic> toJson() => {
        "posts": posts,
        "likes": likes,
        "shares": shares,
        "friends": friends,
      };

  static Social toSocial(SocialEntity socialEntity) {
    return new Social(socialEntity.posts, socialEntity.likes,
        socialEntity.shares, socialEntity.friends);
  }
}
