import 'package:go_router/go_router.dart';
import 'package:kimu_foods/features/home/domain/entities/recipe.dart';
import 'package:kimu_foods/features/home/presentation/views/recipe_details.dart';
import 'package:kimu_foods/features/intro/presentation/views/intro.dart';
import 'package:kimu_foods/features/login/presentation/views/sign_in.dart';
import 'package:kimu_foods/features/login/presentation/views/sign_up.dart';
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
