// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['username'] as String,
    json['name'] as String,
    json['lastname'] as String,
    json['image'] as String,
    json['occupation'] as String,
    json['age'] as String,
    json['email'] as String,
    json['location'] as String,
    json['phoneNumber'] as String,
    json['social'] == null
        ? null
        : Social.fromJson(json['social'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'lastname': instance.lastname,
      'image': instance.image,
      'occupation': instance.occupation,
      'age': instance.age,
      'email': instance.email,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'social': instance.social,
    };

Social _$SocialFromJson(Map<String, dynamic> json) {
  return Social(
    json['posts'] as int,
    json['likes'] as int,
    json['shares'] as int,
    json['friends'] as int,
  );
}

Map<String, dynamic> _$SocialToJson(Social instance) => <String, dynamic>{
      'posts': instance.posts,
      'likes': instance.likes,
      'shares': instance.shares,
      'friends': instance.friends,
    };
