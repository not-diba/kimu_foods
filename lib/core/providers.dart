import 'package:kimu_foods/features/profile/domain/providers/profile_provider.dart';
import 'package:kimu_foods/features/recipe/domain/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider(create: (_) => RecipeProvider()),
  ChangeNotifierProvider(create: (_) => ProfileProvider()),
];
