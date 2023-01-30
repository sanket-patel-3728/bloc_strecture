import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../constants/constants.dart';

class DatabaseServices {
  late Database _database;

  Future<void> initialize() async {
    try {
      _database = await openDatabase(
        DbConstants.DATABASE_NAME,
        version: DbConstants.DATABASE_VERSION,
      );
    } catch (e) {
      rethrow;
    }
  }
}
