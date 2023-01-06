import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DatabaseProvider {
  late Database _database;
  static const int _currentVersion = 1;
  static const DB_NAME = "DRIVER_DB";

  Future<Database> get database async {
    _database = await openDatabase(await getDatabasesPath(), version: _currentVersion);
    return _database;
  }
}
