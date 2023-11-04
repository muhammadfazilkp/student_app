import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/controller/login_page_provider/login_provider.dart';
import 'package:student_app/controller/table_provider/feath_table.dart';
import 'package:student_app/model/student.dart';
import 'package:student_app/view/presentetion/student_adding_page/widgets/custom_formfield.dart';


class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.studentModel});
  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Consumer<LoginProvider>(
                builder: (context, value, child) => CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(File(studentModel.image))),
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
                                ? value.editnameController
                                : index == 1
                                    ? value.editrollnumber
                                    : value.editemailController))),
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
                              if (key.editnameController.text.isNotEmpty &&
                                  key.editrollnumber.text.isNotEmpty &&
                                  key.editemailController.text.isNotEmpty &&
                                  key.profileImage != null) {
                                value.editStudentCard(StudentModel(
                                    email: key.editemailController.text,
                                    name: key.editnameController.text,
                                    rollnumber: key.editrollnumber.text,
                                    image: key.profileImage!.path)).then((value) => Navigator.pop(context));
                              } else {
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
