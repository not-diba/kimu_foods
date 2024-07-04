import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
import 'package:kimu_foods/features/recipe/domain/entities/recipe.dart';

abstract class RecipeRepo {
  Future<GraphqlBaseResponse<List<Recipe>>> getRecipes();
}