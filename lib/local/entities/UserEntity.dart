import 'package:base_flutter/entities/UserAuth.dart';

class UserEntity {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String token;

  static final String tableName = "User";
  static final String columnId = "id"; //INTEGER PRIMARY KEY
  static final String columnUsername = "username"; //TEXT
  static final String columnEmail = "email"; //TEXT
  static final String columnFirstName = "firstName"; //TEXT
  static final String columnLastName = "lastname"; // TEXT
  static final String columnToken = "token";

  static final String createTable = '''CREATE TABLE $tableName (
  $columnId INTEGER PRIMARY KEY autoincrement,
  $columnUsername TEXT,
  $columnEmail TEXT,
  $columnFirstName TEXT,
  $columnLastName TEXT,
  $columnToken TEXT
)''';

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      columnUsername: username,
      columnEmail: email,
      columnFirstName: firstName,
      columnLastName: lastName,
      columnToken : token

    };
    if (id != null) map[columnId] = id;
    return map;
  }

  UserEntity();

  UserEntity.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    username = map[columnUsername];
    email = map[columnEmail];
    firstName = map[columnFirstName];
    lastName = map[columnLastName];
    token = map[columnToken];
  }

  UserEntity.toUserEntity( UserAuth userAuth) {
    username = userAuth.username;
    email = userAuth.email;
    firstName = userAuth.firstName;
    lastName = userAuth.lastName;
    token = userAuth.token;
  }

}
