import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kimu_foods/features/recipe/domain/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../../core/utils/theme/theme.dart';
import 'core/network/url.dart';
import '../../core/routes.dart';


void main() async {
  await initHiveForFlutter();
  runApp(const KimuFoods());
}

class KimuFoods extends StatelessWidget {
  const KimuFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: EndPoint().getClient(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ],
        child: MaterialApp.router(
          theme: KimuFoodsTheme.light(),
          title: 'Kimu Foods',
          routerConfig: AppRouter().router,
        ),
      ),
    );
  }
}
