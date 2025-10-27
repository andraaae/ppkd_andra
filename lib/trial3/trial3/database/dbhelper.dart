import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:ppkd_andra/trial3/trial3/model_trial/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tableUser = 'users';

  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'aGreen.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT, phone TEXT, city TEXT)",
        );
      },

      //onUpgrade: (db, oldVersion, newVersion) async {
      //if (newVersion == 2) {
      //await db.execute(
      //"CREATE TABLE $tableStudent(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, pass TEXT, )",
      //);
      //}
      //},
      version: 3,
    );
  }

  static Future<void> checkAllUsers() async {
    final dbs = await db();
    final result = await dbs.query(tableUser);
    print("CEK ISI TABEL USERS: $result");
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    await dbs.insert(
      tableUser,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('User inserted: ${user.toMap()}');

    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableUser,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final result = await dbs.query(
      tableUser,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    print('Login query result: $result');
    //query adalah fungsi untuk menampilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      tableUser,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    print('Login query result: $results');
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }
}
