import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kimu_foods/Routes/routes.dart';
import 'package:kimu_foods/providers/recipes.dart';
import 'package:kimu_foods/utils/utils.dart';
import 'package:provider/provider.dart';


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
          ChangeNotifierProvider(create: (_) => GetRecipesProvider()),
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
