import 'package:json_annotation/json_annotation.dart';

part 'ingredients.g.dart';

@JsonSerializable()
class Ingredient {
  final String name;
  final String quantity;

  Ingredient({required this.name, required this.quantity});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}