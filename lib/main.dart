import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kimu_foods/core/utils/tools/cache_svgs.dart';
import 'package:provider/provider.dart';

import '../../core/routes.dart';
import '../../core/utils/theme/theme.dart';
import 'core/network/url.dart';
import 'features/home/domain/providers/recipe_provider.dart';
import 'features/profile/domain/providers/profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preloadSVGs([
    'lib/core/assets/svgs/logo.svg',
    'lib/core/assets/svgs/ingredients_plate.svg',
    'lib/core/assets/svgs/tossed_bowl.svg',
    'lib/core/assets/svgs/delivery.svg',
    'lib/core/assets/svgs/c_chicken_2.svg',
    'lib/core/assets/svgs/c_salad.svg',
    'lib/core/assets/svgs/c_fruits.svg',
    'lib/core/assets/svgs/c_beef.svg',
    'lib/core/assets/svgs/c_coffee.svg',
    'lib/core/assets/svgs/c_fish.svg',
    'lib/core/assets/svgs/c_flour.svg',
    'lib/core/assets/svgs/c_milkshakes.svg',
    'lib/core/assets/svgs/c_pasta.svg',
    'lib/core/assets/svgs/c_pastries.svg',
    'lib/core/assets/svgs/c_teas.svg'
  ]);
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
          ChangeNotifierProvider(create: (_) => RecipesProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: KimuFoodsTheme.lightThemeData,
          darkTheme: KimuFoodsTheme.darkThemeData,
          title: 'Kimu Foods',
          routerConfig: router,
        ),
      ),
    );
  }
}
