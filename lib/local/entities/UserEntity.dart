class UserEntity {
  int id;
  String name;
  String email;

  static final String tableName = "User";
  static final String columnId = "id"; //INTEGER PRIMARY KEY
  static final String columnName = "name"; //TEXT
  static final String columnEmail = "email"; //TEXT

  static final String createTable = '''CREATE TABLE $tableName (
  $columnId INTEGER PRIMARY KEY autoincrement,
  $columnName TEXT,
  $columnEmail TEXT
)''';

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      columnName: name,
      columnEmail: email,
    };
    if (id != null) map[columnId] = id;
    return map;
  }

  UserEntity();

  UserEntity.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    email = map[columnEmail];
  }
}
