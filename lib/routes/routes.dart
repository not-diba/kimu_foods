import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kimu_foods/data/responses/recipe/recipe.dart';
import 'package:kimu_foods/views/views.dart';

class AppRoutes {
  static const kimu = 'kimu';
  static const home = 'home';
  static const recipes = 'recipes';
  static const recipeDetails = 'recipe-details';
  static const products = 'products';
  static const basket = 'basket';
  static const profile = 'profile';
}

class AppRouter {
  final router = GoRouter(routes: <RouteBase>[
    GoRoute(
      name: AppRoutes.kimu,
      path: '/',
      builder: (context, state) => const Kimu(),
      routes: [
        GoRoute(
          name: AppRoutes.home,
          path: 'home',
          builder: (context, state) => const Home(
            key: PageStorageKey('home'),
          ),
        ),
        GoRoute(
          name: AppRoutes.recipes,
          path: 'recipes',
          builder: (context, state) => const Categories(
            key: PageStorageKey('recipes'),
          ),
        ),
        GoRoute(
            name: AppRoutes.recipeDetails,
            path: 'recipes-details',
            builder: (context, state) {
              Recipe recipe = state.extra as Recipe;
              return RecipeDetails(recipe: recipe);
            }),
        GoRoute(
          name: AppRoutes.products,
          path: 'products',
          builder: (context, state) => const Products(
            key: PageStorageKey('products'),
          ),
        ),
        GoRoute(
          name: AppRoutes.basket,
          path: 'basket',
          builder: (context, state) => BasketView(
            key: const PageStorageKey('basket'),
          ),
        ),
        GoRoute(
          name: AppRoutes.profile,
          path: 'profile',
          builder: (context, state) => const Profile(
            key: PageStorageKey('profile'),
          ),
        ),
      ],
    ),
  ]);
}
