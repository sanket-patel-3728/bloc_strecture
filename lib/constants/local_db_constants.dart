part of 'constants.dart';

class DbConstants {
  static const String DATABASE_NAME = "bloc_testapp_databse";
  static const DATABASE_VERSION = 2;

  /// User Table
  static const String USER_TABLE_NAME = "user_table";
  static const String CREATE_USER_TABLE =
      "CREATE TABLE $USER_TABLE_NAME (id INTEGER PRIMARY KEY AUTOINCREMENT, data TEXT NOT NULL)";
}
