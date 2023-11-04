import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/controller/login_page_provider/login_provider.dart';
import 'package:student_app/controller/table_provider/feath_table.dart';
import 'package:student_app/model/student.dart';
import 'package:student_app/view/presentetion/view_student/view.dart';
import 'widgets/custom_formfield.dart';

class StudentAddingScreen extends StatelessWidget {
  const StudentAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Consumer<LoginProvider>(
                builder: (context, value, child) => CircleAvatar(
                  radius: 70,
                  backgroundImage: value.profileImage != null
                      ? FileImage(File(value.profileImage!.path))
                      : const AssetImage('assets/profile.jpg') as ImageProvider,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Provider.of<LoginProvider>(context, listen: false)
                        .getphoto();
                  },
                  child: const Text('Select Image')),
              Consumer<LoginProvider>(
                builder: (context, value, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        value.hintText.length,
                        (index) => CustomTextFormField(
                            hintText: value.hintText[index],
                            controller: index == 0
                                ? value.studentNameController
                                : index == 1
                                    ? value.rollnumber
                                    : value.emailController))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<LoginProvider>(
                  builder: (context, key, child) => SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Consumer<StoringTable>(
                        builder: (context, value, child) => ElevatedButton(
                            onPressed: () {
                              if (key.usernameController.text.isNotEmpty &&
                                  key.rollnumber.text.isNotEmpty &&
                                  key.emailController.text.isNotEmpty &&
                                  key.profileImage != null) {
                                value.insertStudents(StudentModel(
                                    name: key.studentNameController.text,
                                    rollnumber: key.rollnumber.text,
                                    email: key.emailController.text,
                                    image: Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .profileImage!
                                        .path)).then((value) => Navigator.push(context,MaterialPageRoute(builder: (context)=> const StudentViewPage())));

                              }else{
                                print('reerererere');
                              }
                            },
                            child: const Text('data')),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
