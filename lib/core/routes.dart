import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kimu_foods/features/basket/presentation/views/basket_view.dart';
import 'package:kimu_foods/features/categories/presentation/views/categories.dart';
import 'package:kimu_foods/features/intro/presentation/views/intro.dart';
import 'package:kimu_foods/features/login/presentation/views/sign_in.dart';
import 'package:kimu_foods/features/login/presentation/views/sign_up.dart';
import 'package:kimu_foods/features/products/presentation/views/products.dart';
import 'package:kimu_foods/features/profile/presentation/views/profile_view.dart';
import 'package:kimu_foods/kimu.dart';

class AppRoutes {
  static const kimu = 'kimu';
  static const home = 'home';
  static const recipes = 'recipes';
  static const recipeDetails = 'recipe-details';
  static const products = 'products';
  static const basket = 'basket';
  static const profile = 'profile';
}

final router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    name: 'intro',
    builder: (context, state) => const Intro(),
  ),
  GoRoute(
    path: '/sign_in',
    name: 'sign-in',
    builder: (context, state) => const SignIn(),
  ),
  GoRoute(
    path: '/sign_up',
    name: 'sign-up',
    builder: (context, state) => const SignUp(),
  ),
  GoRoute(
    path: '/kimu',
    name: 'kimu',
    builder: (context, state) => const Kimu(),
  ),

  // GoRoute(
  //   name: AppRoutes.kimu,
  //   path: '/',
  //   builder: (context, state) => const Kimu(),
  //   routes: [
  //     GoRoute(
  //       name: AppRoutes.home,
  //       path: 'home',
  //       builder: (context, state) => const Recipes(
  //         key: PageStorageKey('home'),
  //       ),
  //     ),
  //     GoRoute(
  //       name: AppRoutes.recipes,
  //       path: 'recipes',
  //       builder: (context, state) => const Categories(
  //         key: PageStorageKey('categories'),
  //       ),
  //     ),
  //     GoRoute(
  //         name: AppRoutes.recipeDetails,
  //         path: 'recipes-details',
  //         builder: (context, state) {
  //           Recipe recipe = state.extra as Recipe;
  //           return RecipeDetails(recipe: recipe);
  //         }),
  //     GoRoute(
  //       name: AppRoutes.products,
  //       path: 'products',
  //       builder: (context, state) => const Products(
  //         key: PageStorageKey('products'),
  //       ),
  //     ),
  //     GoRoute(
  //       name: AppRoutes.basket,
  //       path: 'basket',
  //       builder: (context, state) => BasketView(
  //         key: const PageStorageKey('basket'),
  //       ),
  //     ),
  //     GoRoute(
  //       name: AppRoutes.profile,
  //       path: 'profile',
  //       builder: (context, state) => const ProfileView(
  //         key: PageStorageKey('profile'),
  //       ),
  //     ),
  //   ],
  // ),
]);
