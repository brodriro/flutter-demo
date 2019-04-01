class User {
  int userId;
  int id;
  String title;
  bool completed;

  User(
    this.userId,
    this.id,
    this.title,
    this.completed,
  );

  int get getUserId => this.userId;
  int get getId => this.id;
  String get getTitle => this.title;
  bool get isComplete => this.completed;

  
}
