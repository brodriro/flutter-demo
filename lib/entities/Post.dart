class Post {
  String _id;
  String _userId;
  String _body;
  String _image;
  String _likes;
  List<Comment> _comment;

  Post(this._id, this._userId, this._body, this._image, this._likes, this._comment);

  String get getId => this._id;
  String get getUserId => this._userId;
  String get getBody => this._body;
  String get getImage => this._image;
  String get getLikes => this._likes;
  List<Comment> get getComments => this._comment;
}

class Comment {
  String _userId;
  String _userImage;
  String _comment;

  Comment(this._userId, this._userImage, this._comment);

  String get getUserId => this._userId;
  String get getUserImage => this._userImage;
  String get getComment => this._comment;
}
