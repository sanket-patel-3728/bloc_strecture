import 'package:api_call/constants/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initiateDatabase();
    return _database;
  }

  initiateDatabase() async {
    String path = join(await getDatabasesPath(), DbConstants.DATABASE_NAME);
    return await openDatabase(path,
        version: DbConstants.DATABASE_VERSION, onCreate: onCreate);
  }

  Future onCreate(Database db, int dbversion) async {
    await db.execute(DbConstants.CREATE_USER_TABLE);
  }

  Future<int> insert(DatabaseModel data) async {
    Database? db = await instance.database;
    return await db!.insert(data.tableName(), data.toJson());
  }

  Future<List<Map<String, dynamic>>> queryAll(String tableName) async {
    Database? db = await instance.database;
    return await db!.query(tableName);
  }

  Future<int> update(DatabaseModel data) async {
    Database? db = await instance.database;
    int id = data.toJson()["id"];
    return await db!.update(data.tableName(), data.toJson(),
        where: 'id=?', whereArgs: [id]);
  }

  Future<int> delete(String tableName) async {
    Database? db = await instance.database;
    return await db!.delete(tableName);
  }
}

extension InsertDatabase on DatabaseModel {
  insertIntoDatabase() {
    DatabaseHelper.instance.insert(this);
  }

  deleteDatabase() {
    DatabaseHelper.instance.delete(tableName());
  }
}

abstract class DatabaseModel {
  String tableName();

  Map<String, dynamic> toJson();
}
