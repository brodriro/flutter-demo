import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Post.g.dart';


@JsonSerializable()
class Post extends Equatable {
  int id;
  int userId;
  String username;
  String userImage;
  String body;
  String image;
  int likes;
  List<Comment> comment;

  Post(this.id, this.userId, this.username, this.userImage, this.body,
      this.image, this.likes, this.comment);

  int get getId => this.id;

  int get getUserId => this.userId;

  String get getUserName => this.username;

  String get getUserImage => this.userImage;

  String get getBody => this.body;

  String get getImage => this.image;

  int get getLikes => this.likes;

  List<Comment> get getComments => this.comment;

  @override
  List<Object> get props => [id, userId, username, userImage, body, image, likes, comment];


  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
@JsonSerializable()
class Comment  extends Equatable{
  int userId;
  String userImage;
  String username;
  String comment;

  Comment(this.userId, this.username, this.userImage, this.comment);

  int get getUserId => this.userId;

  String get getUserImage => this.userImage;

  String get getComment => this.comment;

  String get getUsername => this.username;

  @override
  List<Object> get props => [userId, userImage, comment, username];


  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
