import 'package:json_annotation/json_annotation.dart';
import 'package:kimu_foods/data/responses/recipe/ingredient.dart';
import 'package:kimu_foods/data/responses/recipe/nutrition_info.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final String id;
  final String imageUrl;
  final String recipeName;
  final String categoryName;
  final double amount;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final List<NutritionInfo> nutrition;

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

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
