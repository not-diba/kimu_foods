import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/ingredient.dart';
import 'ingredient_details_model.dart';

part 'ingredient_model.g.dart';

@JsonSerializable(explicitToJson: true)
class IngredientModel extends Ingredient {
  @JsonKey(name: 'ingredient')
  final IngredientDetailsModel ingredient;

  IngredientModel({
    required super.price,
    required super.unit,
    required super.quantity,
    required this.ingredient,
  }) : super(ingredientDetails: ingredient);

  @override
  IngredientDetailsModel get ingredientDetails => ingredient;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}
