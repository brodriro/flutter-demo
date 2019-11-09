import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User extends Equatable {
  int id;
  String username;
  String name;
  String lastname;
  String image;
  String occupation;
  String age;
  String email;
  String location;
  String phoneNumber;
  Social social;

  User(
    this.id,
    this.username,
    this.name,
    this.lastname,
    this.image,
    this.occupation,
    this.age,
    this.email,
    this.location,
    this.phoneNumber,
    this.social,
  );

  int get getId => this.id;

  String get getUsername => this.username;

  String get getName => this.name;

  String get getLastName => this.lastname;

  String get getImage => this.image;

  String get getOccupation => this.occupation;

  String get getAge => this.age;

  String get getEmail => this.email;

  String get getLocation => this.location;

  Social get getSocial => this.social;

  get getPhoneNumber => this.phoneNumber;

  @override
  List<Object> get props => [
        id,
        username,
        name,
        lastname,
        image,
        occupation,
        age,
        email,
        location,
        social
      ];


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Social extends Equatable {
  int posts;
  int likes;
  int shares;
  int friends;

  Social(
    this.posts,
    this.likes,
    this.shares,
    this.friends,
  );

  int get getPost => this.posts;

  int get getLikes => this.likes;

  int get getShares => this.shares;

  int get getFriends => this.friends;

  @override
  List<Object> get props => [posts, likes, shares, friends];


  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);
  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
