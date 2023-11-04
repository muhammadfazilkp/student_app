
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:student_app/controller/database_connection/connection.dart';
import 'package:student_app/model/student.dart';

class StoringTable extends ChangeNotifier {
  List<StudentModel> studentList = [];

  Future<void> insertStudents(StudentModel studentCard) async {
    final db = await databaseConnection();
    
  //  final result= await db.insert('StudentsCards', data);
    //await getAllStudentsCards();
  final result= await db.insert("StudentsCards",studentCard.toMap());


    if(result!=0){
      print("sucess");
      await getAllStudentsCards();
    }else{
      print('error');
    }
    notifyListeners();
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
              image: cardMap['image']
            ))
        .toList());
        studentList.forEach((row) {
    print('ID: ${row.id}, Name: ${row.name}, Roll Number: ${row.rollnumber}, Email: ${row.email},Image:${row.image}');
  });
        print(studentList[studentList.length-1]);
        notifyListeners();
    // update();
  }

 Future<void> editStudentCard(StudentModel studentCard) async {
  Database database = await databaseConnection();
  await database.update('StudentsCards', studentCard.toMap(), where: 'id =${studentCard.id}', whereArgs: [studentCard.id]);
}



//////// firebase functions
Future<void> addStudentCardToFirebase(StudentModel studentCard) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference studentCardRef = firestore.collection('StudentsCards').doc(studentCard.id.toString());
  await studentCardRef.set(studentCard.toMap()); // <-- await keyword should be here
  print("data added.........................................");
}


}
