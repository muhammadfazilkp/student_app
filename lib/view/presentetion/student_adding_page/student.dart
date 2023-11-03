import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/controller/login_page_provider/login_provider.dart';

import 'widgets/custom_formfield.dart';

class StudentAddingScreen extends StatelessWidget {
  const StudentAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 70,
            ),
            TextButton(onPressed: () {}, child: const Text('Select Image')),
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
              child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('data'))),
            )
          ],
        ),
      ),
    );
  }
}
