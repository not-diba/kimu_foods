import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/ingredient.dart';

part 'ingredient_details_model.g.dart';

@JsonSerializable()
class IngredientDetailsModel extends IngredientDetails {
  IngredientDetailsModel({
    required super.name,
    required super.type,
  });

  factory IngredientDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDetailsModelToJson(this);
}
