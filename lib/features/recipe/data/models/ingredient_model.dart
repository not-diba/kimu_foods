import 'package:json_annotation/json_annotation.dart';
import 'package:kimu_foods/features/recipe/domain/entities/ingredient.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel extends Ingredient {
  IngredientModel({
    required super.name,
    required super.quantity,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}
