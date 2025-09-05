import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/recipe.dart';
import 'category_model.dart';
import 'ingredient_model.dart';

part 'recipe_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeModel extends Recipe {
  final List<IngredientModel> _ingredients;
  final List<CategoryModel> _categories;

  RecipeModel({
    required super.id,
    required super.name,
    required super.image,
    required super.createdAt,
    super.createdBy,
    required super.duration,
    required super.instructions,
    required super.totalPrice,
    required super.updatedAt,
    required List<IngredientModel> ingredients,
    required List<CategoryModel> categories,
  })  : _ingredients = ingredients,
        _categories = categories,
        super(
          ingredients: ingredients,
          categories: categories,
        );

  @override
  List<IngredientModel> get ingredients => _ingredients;

  @override
  List<CategoryModel> get categories => _categories;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
