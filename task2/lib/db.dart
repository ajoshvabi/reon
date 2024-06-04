import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}cart.db';
    var db = await openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) => _createDb(db, version),
        onUpgrade: _onUpgrade);
    print("Database Created");
    return db;
  }

  void _createDb(Database db, int version) async {
    log("start create");
    await db.execute('''
      CREATE TABLE IF NOT EXISTS cart_data (
        id INTEGER PRIMARY KEY,
        title TEXT,
        price REAL,
        description TEXT,
        image TEXT
      )
    ''');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {}
  }

  Future<bool> tableExists(Database db, String tableName) async {
    var result = await db.rawQuery('''
        SELECT name FROM sqlite_master 
        WHERE type='table' AND name='$tableName'
      ''');
    return result.isNotEmpty;
  }

  Future<void> insertDate(Map<String, dynamic> data) async {
    Database db = await database;
    log("insert");
    print(data["title"]);

    bool hasTable = await tableExists(db, 'cart_data');
    if (!hasTable) {
      _createDb(db, 1);
    }

    await db.insert('cart_data', data);
  }

  Future<List<Map<String, dynamic>>> getCart() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('cart_data');
    return maps;
  }

  Future<int> deleteProduct(int id) async {
    Database db = await database;
    return await db.delete('cart_data', where: 'id = ?', whereArgs: [id]);
  }
}
