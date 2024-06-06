import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kimu_foods/data/responses/recipe/recipe.dart';
import 'package:kimu_foods/schemas/recipes.dart';
import 'package:kimu_foods/utils/url/url.dart';

class RecipesProvider extends ChangeNotifier {
  bool _status = false;
  String _response = "";

  dynamic _list = [];

  bool get getStatus => _status;

  String get getResponse => _response;

  final EndPoint _endPoint = EndPoint();

  // Get Recipes
  void getRecipes() async {
    try {
      ValueNotifier<GraphQLClient> client = _endPoint.getClient();

      QueryResult result = await client.value.mutate(MutationOptions(
        document: gql(RecipesSchema.getRecipesSchemaJSON),
      ));

      if (result.hasException) {
        _status = false;
        if (result.exception!.graphqlErrors.isEmpty) {
          _response = "No Internet connection.";
        } else {
          _response = result.exception!.graphqlErrors[0].message.toString();
        }
        notifyListeners();
      } else {
        _status = false;
        _list = result.data;
        notifyListeners();
      }
    } catch (e, stackTrace) {
      // TODO: log instead of print
      print('Stack trace $stackTrace');
    }
  }


  dynamic getResponseData() {
    if (_list.isNotEmpty && _list['getRecipes'] != null) {
      final List<dynamic> recipesData = _list['getRecipes'];
      final List<Recipe> recipes = recipesData
          .map((recipe) => Recipe.fromJson(recipe))
          .toList();
      return recipes;
    } else {
      return [];
    }
  }


  void clear() {
    _response = '';
    notifyListeners();
  }
}
