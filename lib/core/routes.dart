import 'package:go_router/go_router.dart';
import 'package:kimu_foods/features/home/domain/entities/recipe.dart';
import 'package:kimu_foods/features/home/presentation/views/recipe_details.dart';
import 'package:kimu_foods/features/intro/presentation/views/intro.dart';
import 'package:kimu_foods/features/auth/presentation/views/verify_phone_number_view.dart';
import 'package:kimu_foods/features/profile/presentation/views/profile_view.dart';
import 'package:kimu_foods/kimu.dart';

import '../features/auth/presentation/views/auth_view.dart';

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
    builder: (context, state) => const AuthView(),
  ),
  GoRoute(
    path: '/add_phone_number',
    name: 'add-phone-number',
    builder: (context, state) {
      String userId = state.extra as String;
      return VerifyPhoneNumberView(userId: userId);
    },
  ),
  GoRoute(
    path: '/kimu',
    name: 'kimu',
    builder: (context, state) => const Kimu(),
  ),
  GoRoute(
    path: '/recipe_details',
    name: 'recipe-details',
    builder: (context, state) {
      Recipe recipe = state.extra as Recipe;
      return RecipeDetails(recipe: recipe);
    },
  ),
  GoRoute(
    path: '/profile_view',
    name: 'profile-view',
    builder: (context, state) => const ProfileView(),
  ),
]);
