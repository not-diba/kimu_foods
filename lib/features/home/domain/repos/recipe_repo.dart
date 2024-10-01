import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
import 'package:kimu_foods/features/home/domain/entities/recipe.dart';

abstract class RecipeRepo {
  Future<GraphqlBaseResponse<List<Recipe>>> getRecipes();
}