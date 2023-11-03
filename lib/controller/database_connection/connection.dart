import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Database Connection ---------------------------------------------------------

Future<Database> databaseConnection() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'student_card.db');

// open the database
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute('''
  CREATE TABLE StudentsCards (
    id INTEGER PRIMARY KEY,
    name TEXT,
    rollnumber TEXT,
    email TEXT,
   
  )
''');
  });
  return database;
}