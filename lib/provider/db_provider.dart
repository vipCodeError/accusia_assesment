import 'dart:io';
import 'package:accusia_assesment/model/dbmodel/categories.dart';
import 'package:accusia_assesment/model/dbmodel/products.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();

    final Future<Database> database = openDatabase(

      join(await getDatabasesPath(), 'ecommerce.db'),

      onCreate: (db, version) async {
         await db.execute(
          "CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT)",
        );

         await db.execute(
           "CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, date DATETIME, cat_id INTEGER)",
         );

         await db.execute(
           "CREATE TABLE varaints(id INTEGER PRIMARY KEY, color TEXT, size TEXT, price TEXT, product_id INTEGER)",
         );

         await db.execute(
           "CREATE TABLE tax(id INTEGER PRIMARY KEY, name TEXT, value TEXT, product_id INTEGER)",
         );

         await db.execute(
           "CREATE TABLE childcat(id INTEGER PRIMARY KEY, child_cat INTEGER, cat_id INTEGER)",
         );
      },

      version: 1,
    );

  }

  // Insert employee on database
  createEmployee(Categories categories) async {
    await deleteAllEmployees();
    final db = await database;
    final res = await db.insert('Categories', categories.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllEmployees() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Categories');

    return res;
  }

  Future<List<Categories>> getAllEmployees() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Categories");

    List<Categories> list =
    res.isNotEmpty ? res.map((c) => Categories.fromJson(c)).toList() : [];

    return list;
  }
}