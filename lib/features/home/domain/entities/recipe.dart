import 'category.dart';
import 'ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String image;
  final DateTime createdAt;
  final String? createdBy;
  final int duration;
  final String instructions;
  final double totalPrice;
  final DateTime updatedAt;
  final List<Category> categories;
  final List<Ingredient> ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    this.createdBy,
    required this.duration,
    required this.instructions,
    required this.totalPrice,
    required this.updatedAt,
    required this.categories,
    required this.ingredients,
  });
}
