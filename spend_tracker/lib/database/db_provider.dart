import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spend_tracker/models/account.dart';

class DbProvider {
  Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initialize();
    }

    return _database;
  }

  Future<int> createAccount(Account account) async {
    final db = await database;
    return await db.insert('account', account.toMap());
  }

  Future<int> updateAccount(Account account) async {
    final db = await database;
    return await db.update('Account', account.toMap(),
      where: 'id = ?', whereArgs: [account.id] );
  }

  Future<List<Account>> getAllAccounts() async {
    final db = await database;

    var res = await db.query('Account');
    List<Account> list = res.isNotEmpty?
      res.map((a) => Account.fromMap(a)).toList(): [];

    return list;
  }

  void dispose() {
    _database?.close();
    _database = null;
  }

  Future<Database> _initialize() async {
    Directory docDir = await getApplicationDocumentsDirectory();

    String path = join(docDir.path, 'spend_tracker.db');

    Database db = await openDatabase(
       path,
       version: 1,
       onOpen: (db) {
         print ('Database open');
       },
       onCreate: _onCreate, 
    );

    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE Account("
      "id INTEGER PRIMARY KEY,"
      "name TEXT,"
      "codePoint INTEGER,"
      "balance REAL"
    ")");
  }


}