import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/model/student.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//studentadding HintText................&& controllers......
  List<String> hintText = [
    "Name",
    "rollnumber",
    "eamil",
  ];
  TextEditingController studentNameController = TextEditingController();
  TextEditingController rollnumber = TextEditingController();
  TextEditingController emailController = TextEditingController();

//.........editpageController........///



 TextEditingController editnameController = TextEditingController();
  TextEditingController editrollnumber = TextEditingController();
  TextEditingController editemailController = TextEditingController();


  addingDataToControllers(StudentModel studentModel){
    editemailController.text=studentModel.email;
    editnameController.text=studentModel.name;
    editrollnumber.text=studentModel.rollnumber;
    notifyListeners();
  }










//......................
  File? profileImage;

  Future<void> getphoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    } else {
      File file = File(photo.path);

      profileImage = file;
      notifyListeners();
    }
  }
}
