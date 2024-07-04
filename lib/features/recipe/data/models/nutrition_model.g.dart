// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) =>
    NutritionModel(
      nutritionItem: json['nutritionItem'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$NutritionModelToJson(NutritionModel instance) =>
    <String, dynamic>{
      'nutritionItem': instance.nutritionItem,
      'quantity': instance.quantity,
    };
