import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
import 'package:kimu_foods/core/network/url.dart';
import 'package:kimu_foods/features/recipe/data/models/recipe_model.dart';
import 'package:kimu_foods/features/recipe/data/schemas/recipes.dart';
import 'package:kimu_foods/features/recipe/domain/entities/recipe.dart';
import 'package:kimu_foods/features/recipe/domain/repos/recipe_repo.dart';

class RecipeRepository implements RecipeRepo {
  final EndPoint _endPoint = EndPoint();

  @override
  Future<GraphqlBaseResponse<List<Recipe>>> getRecipes() async {
    try {
      ValueNotifier<GraphQLClient> client = _endPoint.getClient();

      QueryResult result = await client.value.mutate(MutationOptions(
        document: gql(RecipesSchema.recipesSchemaJSON),
      ));

      if (result.hasException) {
        String errorMessage;
        if (result.exception!.graphqlErrors.isEmpty) {
          errorMessage = "No Internet connection.";
        } else {
          errorMessage = result.exception!.graphqlErrors[0].message.toString();
        }
        return GraphqlBaseResponse(message: errorMessage, successful: false);
      } else {
        List<Recipe> recipes = mapRecipeResponseData(result.data!);
        return GraphqlBaseResponse(data: recipes, successful: true);
      }
    } catch (e, stackTrace) {
      // TODO: log instead of print
      print('Stack trace $stackTrace');
      return GraphqlBaseResponse(message: 'An error occurred: $e', successful: false);
    }
  }

  List<Recipe> mapRecipeResponseData(Map<String, dynamic> recipeGraphQLData) {
    if (recipeGraphQLData.isNotEmpty &&
        recipeGraphQLData['recipes'] != null) {
      final List<dynamic> recipesData = recipeGraphQLData['recipes'];
      final List<Recipe> recipes =
      recipesData.map((recipe) => RecipeModel.fromJson(recipe)).toList();
      return recipes;
    } else {
      return [];
    }
  }
}
