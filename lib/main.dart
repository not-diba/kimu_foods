import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:kimu_foods/core/utils/tools/cache_svgs.dart';
import 'package:provider/provider.dart';

import '../../core/utils/theme/theme.dart';
import 'core/network/url.dart';
import '../../core/routes.dart';
import '../../core/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preloadSVGs([
    'lib/core/assets/svgs/logo.svg',
    'lib/core/assets/svgs/ingredients_plate.svg',
    'lib/core/assets/svgs/tossed_bowl.svg',
    'lib/core/assets/svgs/delivery.svg',
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
        providers: providers,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          //or ThemeMode.dark
          theme: KimuFoodsTheme.lightThemeData,
          darkTheme: KimuFoodsTheme.darkThemeData,
          title: 'Kimu Foods',
          routerConfig: router,
        ),
      ),
    );
  }
}
