import 'package:json_annotation/json_annotation.dart';
import 'package:kimu_foods/features/recipe/domain/entities/nutrition.dart';

part 'nutrition_model.g.dart';

@JsonSerializable()
class NutritionModel extends Nutrition {
  NutritionModel({
    required super.nutritionItem,
    required super.quantity,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionModelToJson(this);
}
