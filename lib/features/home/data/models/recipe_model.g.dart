// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      recipeName: json['recipeName'] as String,
      categoryName: json['categoryName'] as String,
      amount: (json['amount'] as num).toDouble(),
      duration: json['duration'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nutrition: (json['nutrition'] as List<dynamic>)
          .map((e) => NutritionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'recipeName': instance.recipeName,
      'categoryName': instance.categoryName,
      'amount': instance.amount,
      'duration': instance.duration,
      'instructions': instance.instructions,
      'ingredients': instance.ingredients,
      'nutrition': instance.nutrition,
    };
