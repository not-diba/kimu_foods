// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      price: (json['price'] as num).toDouble(),
      unit: json['unit'] as String,
      quantity: (json['quantity'] as num).toInt(),
      ingredient: IngredientDetailsModel.fromJson(
          json['ingredient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'ingredient': instance.ingredient.toJson(),
    };
