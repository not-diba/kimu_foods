// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionInfo _$NutritionInfoFromJson(Map<String, dynamic> json) =>
    NutritionInfo(
      nutritionItem: json['nutritionItem'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$NutritionInfoToJson(NutritionInfo instance) =>
    <String, dynamic>{
      'nutritionItem': instance.nutritionItem,
      'quantity': instance.quantity,
    };
