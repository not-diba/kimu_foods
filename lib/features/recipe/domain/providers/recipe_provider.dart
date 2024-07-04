import 'package:flutter/material.dart';
import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
import 'package:kimu_foods/core/utils/generics/notifier_state.dart';
import 'package:kimu_foods/features/recipe/data/repositories/recipe_repository.dart';
import 'package:kimu_foods/features/recipe/domain/entities/recipe.dart';
import 'package:kimu_foods/features/recipe/domain/repos/recipe_repo.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeRepo recipeRepo = RecipeRepository();

  GraphqlBaseResponse<List<Recipe>>? _recipesResponse;

  GraphqlBaseResponse<List<Recipe>>? get recipesResponse => _recipesResponse;

  NotifierState _state = NotifierState.idle;

  NotifierState get state => _state;

  void setNotifierState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Future<GraphqlBaseResponse<List<Recipe>>> getRecipes() async {
    setNotifierState(NotifierState.loading);
    _recipesResponse = await recipeRepo.getRecipes();
    setNotifierState(NotifierState.loaded);
    return Future.value(_recipesResponse);
  }
}
