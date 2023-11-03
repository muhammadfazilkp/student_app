import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_app/controller/database_connection/connection.dart';
import 'package:student_app/model/student.dart';

class StoringTable extends ChangeNotifier {
  List<StudentModel> studentList = [];

  Future<void> insertStudents(StudentModel studentCard) async {
    final db = await databaseConnection();
    final data = {
      "name": studentCard.name,
      "rollnumber": studentCard.rollnumber,
      "email": studentCard.email,
    };
    await db.insert('StudentsCards', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    await getAllStudentsCards();
  }

  Future<void> getAllStudentsCards() async {
    final db = await databaseConnection();
    final List<Map<String, dynamic>> cardDataMaps =
        await db.query('StudentsCards');
    // businessCardsData.clear();
    studentList.addAll(cardDataMaps
        .map((cardMap) => StudentModel(
              id: cardMap['id'],
              name: cardMap['name'],
              rollnumber: cardMap['rollnumber'],
              email: cardMap['email'],
            ))
        .toList());
    // update();
  }
}
