import 'dart:convert';
import 'package:base_flutter/entities/Post.dart';

List<PostEntity> postEntityFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<PostEntity>.from(jsonData.map((x) => PostEntity.fromJson(x)));
}

String postEntityToJson(List<PostEntity> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class PostEntity {
  int id;
  int userId;
  String username;
  String body;
  String image;
  int likes;
  List<CommentEntity> comment;

  PostEntity({
    this.id,
    this.userId,
    this.username,
    this.body,
    this.image,
    this.likes,
    this.comment,
  });

  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return new PostEntity(
        id: json["id"],
        userId: json["user_id"],
        username: json["username"],
        body: json["body"],
        image: json["image"],
        likes: json["likes"],
        comment: new List<CommentEntity>.from(
            json["comment"].map((x) => CommentEntity.fromJson(x))));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "username": username,
        "body": body,
        "image": image,
        "likes": likes,
        "comment": new List<dynamic>.from(comment.map((x) => x.toJson())),
      };

  static List<Post> toPosts(List<PostEntity> posts) {
    List<Post> list = new List();

    for (PostEntity row in posts) {
      list.add(_toPost(row));
    }
    return list;
  }

  static Post _toPost(PostEntity p) {
    return new Post(p.id, p.userId, p.username, p.body, p.image, p.likes,
        CommentEntity.toComments(p.comment));
  }
}

class CommentEntity {
  int userId;
  String userImage;
  String comment;

  CommentEntity({
    this.userId,
    this.userImage,
    this.comment,
  });
  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      new CommentEntity(
        userId: json["user_id"],
        userImage: json["user_image"],
        comment: json["comment"],
      );
  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_image": userImage,
        "comment": comment,
      };

  static List<Comment> toComments(List<CommentEntity> comments) {
    List<Comment> list = new List();
    for (CommentEntity row in comments) {
      list.add(toComment(row));
    }
    return list;
  }

  static Comment toComment(CommentEntity comment) {
    return new Comment(comment.userId, comment.userImage, comment.comment);
  }
}