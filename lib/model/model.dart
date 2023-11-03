class FoodRecipe {
  final String id;
  final String foodName;
  final String description;
  final String photo;
  final List<String> foodIngredients;
  final List<String> steps;
  final String level;
  final String timeRequired;
  final String calories;

  FoodRecipe({
    required this.id,
    required this.foodName,
    required this.description,
    required this.photo,
    required this.foodIngredients,
    required this.steps,
    required this.level,
    required this.timeRequired,
    required this.calories,
  });

  factory FoodRecipe.fromJson(Map<String, dynamic> json) {
    return FoodRecipe(
      id: json['_id'],
      foodName: json['foodName'],
      description: json['description'],
      photo: json['photo'],
      foodIngredients: List<String>.from(json['foodIncrediance']),
      steps: List<String>.from(json['steps']),
      level: json['level'],
      timeRequired: json['timeRequired'],
      calories: json['calories'],
    );
  }
}