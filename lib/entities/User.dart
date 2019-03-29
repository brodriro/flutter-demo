class User {
  String uName;
  String uImage;

  User(name, image) {
    this.uName = name;
    this.uImage = image;
  }

  String get name => this.uName;
  String get image => this.uImage;
}
