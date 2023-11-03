import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Database Connection ---------------------------------------------------------

Future<Database> databaseConnection() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'student_card.db');

  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute('''
      CREATE TABLE StudentsCards (
        id INTEGER PRIMARY KEY,
        name TEXT,
        rollnumber TEXT,
        email TEXT
      )
    ''');
  });
  return database;
}
