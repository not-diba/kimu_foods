import 'package:kimu_foods/features/recipe/domain/entities/ingredient.dart';
import 'package:kimu_foods/features/recipe/domain/entities/nutrition.dart';

class Recipe {
  final String id;
  final String imageUrl;
  final String recipeName;
  final String categoryName;
  final double amount;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final List<Nutrition> nutrition;

  Recipe({
    required this.id,
    required this.imageUrl,
    required this.recipeName,
    required this.categoryName,
    required this.amount,
    required this.ingredients,
    required this.instructions,
    required this.nutrition,
  });
}
