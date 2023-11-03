import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:student_app/model/model.dart';
import 'package:http/http.dart' as http;

class GetRecipeProvider extends ChangeNotifier {
  List<FoodRecipe> recipes = [];
  //List to store multiple FoodRecipe objects//

  Future<void> fetchRecipes() async {
    final response = await http.get(Uri.parse(
        'https://food-maker-rcd0rv1d8-arjun2628s-projects.vercel.app'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      recipes =
          jsonList.map((jsonMap) => FoodRecipe.fromJson(jsonMap)).toList();
      notifyListeners();
    } else {
      // Handle the error case
      throw Exception('Failed to load data');
    }
  }
}
