import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/controller/recipe_provider/recipe_provider.dart';
import 'package:student_app/view/presentetion/login_page/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigator(context);
    Provider.of<GetRecipeProvider>(context,listen: false).fetchRecipes();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/splash.png'),
                fit: BoxFit.cover)),
      ),
    );
  }

  Future<void> navigator(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  LoginScreen()),
            (route) => false));
  }
}
