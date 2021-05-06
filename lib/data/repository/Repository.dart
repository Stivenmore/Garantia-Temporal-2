import 'dart:io';

import 'package:flutter_y_sqflite/domain/entities/model_data.dart';
import 'package:path/path.dart';
import 'package:flutter_y_sqflite/data/services/Servces.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Repository implements Services {
  String path;
  Database _database;
  Repository();
  Register rg = Register();
  int id;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    String path = await getDatabasesPath();
    path = join(path, 'notes.db');
    print("Entered path $path");

    return openDatabase(path, version: 1,
        onCreate: (Database rg, int version) async {
      await rg.execute(
          'CREATE TABLE Users(id INTEGER PRIMARY KEY, name TEXT, lastname TEXT, date TEXT, direction LIST);');
      print('New table created at $path');
    });
  }

  Future<ServiceResult> setDataforSQL(
      String name, String lastname, String date, List direction) async {
    final db = await database;
    Directory databasesPathparcial = await getApplicationDocumentsDirectory();
    String databasesPath = databasesPathparcial.path;
    path = join(databasesPath, 'Users.db');
    try {
      final res = await db.rawInsert(
          'INSERT into Users(name, lastname, date, direction) VALUES ("$name", "$lastname", "$date", "$direction")');
      print(res);
      return ServiceResult(snapbar: 'Usuario no agregado', status: true);
    } catch (e) {
      print(e.toString());
      print('hubo un error');
      return ServiceResult(message: 'Hubo un error en el registro');
    }
  }

  Future<ServiceResult<List<Register>>> getDatafromSQL() async {
    final db = await database;
    final res = await db.query('Users');
    try {
      if (res.isNotEmpty) {
        List<Register> register =
            res.map((e) => Register.fromSQL(e)).toList();
        print('tenemos data');
        return ServiceResult(data: register);
      } else {
        print('sin registros');
        return ServiceResult(snapbar: 'No encontramos registros', status: true);
      }
    } catch (e) {
      print(e.toString());
      return ServiceResult(message: e.toString());
    }
  }

  @override
  void dispones() {}

  @override
  void init() {}
}
