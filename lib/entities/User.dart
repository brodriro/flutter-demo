class User {
  int _id;
  String _username;
  String _name;
  String _lastname;
  String _image;
  String _occupation;
  String _age;
  String _email;
  String _location;
  Social _social;

  User(
    this._id,
    this._username,
    this._name,
    this._lastname,
    this._image,
    this._occupation,
    this._age,
    this._email,
    this._location,
    this._social,
  );
  int get getId => this._id;
  String get getUsername => this._username;
  String get getName => this._name;
  String get getLastName => this._lastname;
  String get getImage => this._image;
  String get getOccupation => this._occupation;
  String get getAge => this._age;
  String get getEmail => this._email;
  String get getLocation => this._location;
  Social get getSocial => this._social;
}

class Social {
  int _posts;
  int _likes;
  int _shares;
  int _friends;

  Social(
    this._posts,
    this._likes,
    this._shares,
    this._friends,
  );

  int get getPost => this._posts;
  int get getLikes => this._likes;
  int get getShares => this._shares;
  int get getFriends => this._friends;
}
