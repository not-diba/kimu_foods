// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      duration: (json['duration'] as num).toInt(),
      instructions: json['instructions'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'duration': instance.duration,
      'instructions': instance.instructions,
      'totalPrice': instance.totalPrice,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
