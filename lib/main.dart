import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/controller/login_page_provider/login_provider.dart';
import 'package:student_app/controller/recipe_provider/recipe_provider.dart';
import 'package:student_app/controller/table_provider/feath_table.dart';
import 'package:student_app/view/presentetion/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>LoginProvider()),
        ChangeNotifierProvider(create: (context)=>GetRecipeProvider()),
        ChangeNotifierProvider(create: (context)=>StoringTable())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
