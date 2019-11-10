// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    json['id'] as int,
    json['userId'] as int,
    json['username'] as String,
    json['userImage'] as String,
    json['body'] as String,
    json['image'] as String,
    json['likes'] as int,
    (json['comment'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'username': instance.username,
      'userImage': instance.userImage,
      'body': instance.body,
      'image': instance.image,
      'likes': instance.likes,
      'comment': instance.comment,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['userId'] as int,
    json['username'] as String,
    json['userImage'] as String,
    json['comment'] as String,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'userId': instance.userId,
      'userImage': instance.userImage,
      'username': instance.username,
      'comment': instance.comment,
    };
