import 'dart:io';
import 'package:accusia_assesment/model/dbmodel/categories.dart';
import 'package:accusia_assesment/model/dbmodel/child_cat.dart';
import 'package:accusia_assesment/model/dbmodel/ordercount.dart';
import 'package:accusia_assesment/model/dbmodel/products.dart';
import 'package:accusia_assesment/model/dbmodel/ranking_order.dart';
import 'package:accusia_assesment/model/dbmodel/ranking_share.dart';
import 'package:accusia_assesment/model/dbmodel/ranking_view.dart';
import 'package:accusia_assesment/model/dbmodel/sharecount.dart';
import 'package:accusia_assesment/model/dbmodel/tax.dart';
import 'package:accusia_assesment/model/dbmodel/variants.dart';
import 'package:accusia_assesment/model/dbmodel/viewcount.dart';
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
           "CREATE TABLE varaints(id INTEGER PRIMARY KEY, color TEXT, size TEXT, price INTEGER, product_id INTEGER)",
         );

         await db.execute(
           "CREATE TABLE tax(name TEXT, value TEXT, product_id INTEGER)",
         );

         await db.execute(
           "CREATE TABLE childcat(child_cat INTEGER, cat_id INTEGER)",
         );

         await db.execute(
           "CREATE TABLE share_count(id INTEGER PRIMARY KEY, share_c INTEGER)",
         );

         await db.execute(
           "CREATE TABLE order_count(id INTEGER PRIMARY KEY, order_c INTEGER)",
         );

         await db.execute(
           "CREATE TABLE view_count(id INTEGER PRIMARY KEY, view_c INTEGER)",
         );
      },

      version: 1,
    );

    return database;

  }

  // Insert employee on database
  createEmployee(Categories categories) async {

    final db = await database;
    final res = await db.insert('categories', categories.toJson());

    return res;
  }

  createProduct(Products products) async {

    final db = await database;
    final res = await db.insert('products', products.toJson());

    return res;
  }

  createVariants(Variants variants) async {

    final db = await database;
    final res = await db.insert('varaints', variants.toJson());

    return res;
  }

  createTax(Tax tax) async {

    final db = await database;
    final res = await db.insert('tax', tax.toJson());

    return res;
  }

  createChildCat(ChildCat childCat) async {
    final db = await database;
    final res = await db.insert('childcat', childCat.toJson());

    return res;
  }

  createViewCount(ViewCount viewCount) async {
    final db = await database;
    final res = await db.insert('view_count', viewCount.toJson());

    return res;
  }

  createOrderCount(OrderCount orderCount) async {
    final db = await database;
    final res = await db.insert('order_count', orderCount.toJson());

    return res;
  }

  createShareCount(ShareCount shareCount) async {
    final db = await database;
    final res = await db.insert('share_count', shareCount.toJson());

    return res;
  }

  Future  getCatCount() async {
    final db = await database;

    final res  = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM categories'));

    return res;
  }

  // Delete all employees
  Future<int> deleteAllEmployees() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM categories');
    return res;
  }

  Future<List<Categories>> getAllCategories() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM categories");

    List<Categories> list =
    res.isNotEmpty ? res.map((c) => Categories.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<Products>> getProductByCatId(String id) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM products where cat_id = "+ id.toString());

    List<Products> list =
    res.isNotEmpty ? res.map((c) => Products.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<Variants>> getVaraintByProductId(String id) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM varaints where product_id = "+ id.toString());

    List<Variants> list =
    res.isNotEmpty ? res.map((c) => Variants.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<Tax>> getTaxByProductId(String id) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM tax where product_id = "+ id.toString());

    List<Tax> list =
    res.isNotEmpty ? res.map((c) => Tax.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<RankingView>> getProductByViewData() async {
    final db = await database;
    final res = await db.rawQuery("SELECT view_count.id,products.name, view_count.view_c FROM view_count INNER JOIN products ON view_count.id = products.id ORDER by view_c  ASC");

    List<RankingView> list =
    res.isNotEmpty ? res.map((c) => RankingView.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<RankingShare>> getProductByShareData() async {
    final db = await database;
    final res = await db.rawQuery("SELECT share_count.id,products.name, share_count.share_c FROM share_count INNER JOIN products ON share_count.id = products.id  ORDER by share_c  ASC");

    List<RankingShare> list =
    res.isNotEmpty ? res.map((c) => RankingShare.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<RankingOrder>> getProductByOrderData() async {
    final db = await database;
    final res = await db.rawQuery("SELECT order_count.id,products.name, order_count.order_c FROM order_count INNER JOIN products ON order_count.id = products.id  ORDER by order_c  ASC");

    List<RankingOrder> list =
    res.isNotEmpty ? res.map((c) => RankingOrder.fromJson(c)).toList() : [];

    return list;
  }

}