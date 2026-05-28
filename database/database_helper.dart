import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../classes/carga.dart';

class DatabaseHelper {

  static final DatabaseHelper instance =
      DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('cargas.db');

    return _database!;
  }

  Future<Database> _initDB(
      String filePath) async {

    final dbPath =
        await getDatabasesPath();

    final path =
        join(dbPath, filePath);

    return await openDatabase(

      path,

      version: 1,

      onCreate: _createDB,
    );
  }

  Future _createDB(
    Database db,
    int version,
  ) async {

    await db.execute('''
CREATE TABLE cargas(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mes TEXT,
  kwh REAL,
  valor REAL
)
''');
  }

  Future<int> insertCarga(
      Carga carga) async {

    final db = await instance.database;

    return await db.insert(
      'cargas',
      carga.toMap(),
    );
  }

  Future<List<Carga>> getCargas() async {

    final db = await instance.database;

    final result =
        await db.query('cargas');

    return result
        .map((json) =>
            Carga.fromMap(json))
        .toList();
  }

  Future<int> deleteCarga(
      int id) async {

    final db = await instance.database;

    return await db.delete(
      'cargas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {

    final db =
        await instance.database;

    db.close();
  }
}