import 'package:kimu_foods/features/home/domain/providers/recipe_provider.dart';
import 'package:kimu_foods/features/auth/domain/providers/auth_provider.dart';
import 'package:kimu_foods/features/profile/domain/providers/profile_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider(create: (_) => RecipesProvider()),
  ChangeNotifierProvider(create: (_) => ProfileProvider()),
  ChangeNotifierProvider(create: (_) => AuthProvider()),
];
