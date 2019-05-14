import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'entities/UserEntity.dart';

class DatabaseHelper {
  Database _database;

  final String _dbName = 'demo_flutter.db';
  final int _dbVersion = 1;
  String _pathDb;

  DatabaseHelper(this._database);

  Future init() async {
    var databasesPath = await getDatabasesPath();
    _pathDb = join(databasesPath, _dbName);

    //bool exist = await databaseExists(_pathDb);

    await _createTables();

    debugPrint("Database $_dbName has been initializated");
  }

  Future _createTables() async {
    //transaction
    _database = await openDatabase(_pathDb, version: _dbVersion,
        onCreate: (Database db, int version) async {
      //add queries
      await db.execute(UserEntity.createTable);
    });
  }

  Future<int> insertRecord(String table, Map values) async {
    debugPrint("Insert record : $table with values: $values");
    int id = await this._database.insert(table, values);
    debugPrint("record inserted with id $id");
    return id;
  }

  Future<List<Map>> getData(String table, List<String> columns,
      {String where, List<dynamic> args, String groupBy, String orderBy, int limit, int offset}) async {
    return await this._database.query(table,
        columns: columns,
        where: where,
        whereArgs: args,
        groupBy: groupBy,
        orderBy: orderBy,
        limit: limit,
        offset: offset);
  }

  Future<int> deleteRecord(String table, String column, int id) async {
    return await this._database.delete(table, where: '$column = ?', whereArgs: [id]);
  }

  Future<int> updateRecord(String table, String columnId, int id, Map values) async {
    return await this._database.update(table, values, where: '$columnId = ?', whereArgs: [id]);
  }

  Future deleteDataBase() async {
    if (_pathDb == null) {
      debugPrint("Database $_dbName has not been initializated");
      return;
    }
    await deleteDatabase(_pathDb);
  }

  Future closeConnection() async => this._database.close();
}
