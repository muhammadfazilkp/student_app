import 'package:flutter/material.dart';

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
  //  final result= await db.insert('StudentsCards', data);
  //   await getAllStudentsCards();
  final result= await db.insert("StudentsCards",studentCard.toMap());


    if(result!=0){
      print("sucess");
      await showTableContents();
    }else{
      print('error');
    }
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

  Future<void> showTableContents() async {
  final db = await databaseConnection();
  final List<Map<String, dynamic>> tableData = await db.query('StudentsCards');

  // Printing the contents of the table
  tableData.forEach((row) {
    print('ID: ${row['id']}, Name: ${row['name']}, Roll Number: ${row['rollnumber']}, Email: ${row['email']}');
  });
}
}
