import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

//.................///
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
