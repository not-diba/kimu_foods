import 'package:json_annotation/json_annotation.dart';

part 'nutrition_info.g.dart';

@JsonSerializable()
class NutritionInfo {
  final String nutritionItem;
  final String quantity;

  NutritionInfo({required this.nutritionItem, required this.quantity});

  factory NutritionInfo.fromJson(Map<String, dynamic> json) =>
      _$NutritionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionInfoToJson(this);
}
