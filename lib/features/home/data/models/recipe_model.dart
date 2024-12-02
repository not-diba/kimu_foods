import 'package:json_annotation/json_annotation.dart';
import 'package:kimu_foods/features/home/data/models/ingredient_model.dart';
import 'package:kimu_foods/features/home/data/models/nutrition_model.dart';
import 'package:kimu_foods/features/home/domain/entities/recipe.dart';


part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel extends Recipe {
  final List<IngredientModel> _ingredients;
  final List<NutritionModel> _nutrition;

  RecipeModel({
    required super.id,
    required super.imageUrl,
    required super.recipeName,
    required super.categoryName,
    required super.amount,
    required super.duration,
    required List<IngredientModel> ingredients,
    required super.instructions,
    required List<NutritionModel> nutrition,
  })  : _ingredients = ingredients,
        _nutrition = nutrition,
        super(
          ingredients: ingredients,
          nutrition: nutrition,
        );

  @override
  List<IngredientModel> get ingredients => _ingredients;

  @override
  List<NutritionModel> get nutrition => _nutrition;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
