import 'package:DemoFlutter/data/local/entities/UserEntity.dart';
import 'package:DemoFlutter/domain/entities/UserAuth.dart';
import 'package:DemoFlutter/domain/repository/user/UserRepositoryLocal.dart';
import 'package:sql_helper/sql_helper.dart';

class UserRepositoryLocalImp implements UserRepositoryLocal {
  DatabaseHelper databaseHelper;

  UserRepositoryLocalImp(this.databaseHelper);

  @override
  Future deleteUser(int id) async {
    await databaseHelper.deleteRecord(
        table: UserEntity.tableName,
        valuesCondition: [UserEntity.columnId],
        whereColumns: [id.toString()]);
  }

  @override
  Future<UserAuth> getUser() async {
    List<Map> results;
    results = await databaseHelper.getRecords(UserEntity.tableName,
        columns: [UserEntity.columnUsername, UserEntity.columnEmail]);

    print("Result records: $results");

    if (results.length == 0) return null;

    UserEntity userEntity = UserEntity.fromMap(results[0]);

    return UserEntity.toUserAuth(userEntity);
  }

  @override
  Future<String> saveUser(UserEntity userEntity) async {
    int id = await databaseHelper.insertRecord(
        UserEntity.tableName, userEntity.toMap());

    print("new Record with id: $id");

    List<Map<String, dynamic>> results =
        await databaseHelper.getRecords(UserEntity.tableName);

    await databaseHelper.closeConnection();
    return UserEntity.fromMap(results[0]).email;
  }
}
