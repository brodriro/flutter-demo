class Post {
  int _id;
  int _userId;
  String _username;
  String _userImage;
  String _body;
  String _image;
  int _likes;
  List<Comment> _comment;

  Post(this._id, this._userId, this._username, this._userImage, this._body, this._image, this._likes, this._comment);

  int get getId => this._id;
  int get getUserId => this._userId;
  String get getUserName => this._username;
  String get getUserImage => this._userImage;
  String get getBody => this._body;
  String get getImage => this._image;
  int get getLikes => this._likes;
  List<Comment> get getComments => this._comment;
}

class Comment {
  int _userId;
  String _userImage;
  String _username;
  String _comment;

  Comment(this._userId, this._username, this._userImage, this._comment);

  int get getUserId => this._userId;
  String get getUserImage => this._userImage;
  String get getComment => this._comment;
  String get getUsername => this._username;
}
