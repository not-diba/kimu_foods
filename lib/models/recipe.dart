import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class RecipeModel {
  final String id;
  final String imageUrl;
  final String recipeName;
  final String categoryName;
  final double amount;

  RecipeModel({
    required this.id,
    required this.imageUrl,
    required this.recipeName,
    required this.categoryName,
    required this.amount,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
