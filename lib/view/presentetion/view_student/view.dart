import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/controller/table_provider/feath_table.dart';

class StudentViewPage extends StatelessWidget {
  const StudentViewPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(

     ),
      body: Consumer<StoringTable>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.studentList.length,
          itemBuilder: (context, index) {
            final data=value.studentList[index];
            return Column(
              children: [

                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("StudentsCards").where("id",isEqualTo:data.id).snapshots()
                , builder: (context, snapshot) {
                  
                  final length=snapshot.data!.docs.length;
                  return length!=0?
                   Container(
                  color: Colors.blue,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(value.studentList[index].image)),
                    ),
                    title: Text(value.studentList[index].name), // Fixed: Wrap with Text widget
                    subtitle: Row(
                      children: [
                        Text(value.studentList[index].rollnumber),
                        Text(value.studentList[index].email)
                      ],
                    ), 
                    trailing: ElevatedButton(onPressed:() {

                      value.addStudentCardToFirebase(value.studentList[index]);
                      
                    }, child: Text("Add")),
                     // Fixed: Wrap with Text widget
                    // You can add more content or trailing icons to the list tile if needed
                    // trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add functionality when a list tile is tapped
                      // For example, navigate to a student details page
                    },
                  ),
                )
                :
                 Container(
                  color: Colors.red,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(value.studentList[index].image)),
                    ),
                    title: Text(value.studentList[index].name), // Fixed: Wrap with Text widget
                    subtitle: Row(
                      children: [
                        Text(value.studentList[index].rollnumber),
                        Text(value.studentList[index].email)
                      ],
                    ), 
                    trailing: ElevatedButton(onPressed:() {

                      value.addStudentCardToFirebase(value.studentList[index]);
                      
                    }, child: Text("Add")),
                     // Fixed: Wrap with Text widget
                    // You can add more content or trailing icons to the list tile if needed
                    // trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add functionality when a list tile is tapped
                      // For example, navigate to a student details page
                    },
                  ),
                );
                },),
               
                SizedBox(
                  height: 10,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
