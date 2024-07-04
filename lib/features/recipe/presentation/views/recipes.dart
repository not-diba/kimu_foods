import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/core/utils/generics/notifier_state.dart';
import 'package:kimu_foods/features/recipe/domain/entities/recipe.dart';
import 'package:kimu_foods/features/recipe/domain/providers/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes.dart';
import '../widgets/recipe_card.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  void initState() {
    super.initState();
    _getRecipes();
  }

  List<Recipe> _recipes = [];
  NotifierState _loadingRecipesState = NotifierState.idle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 20,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Picks",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.rubik(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(
                  Icons.search_sharp,
                  size: 32,
                  color: Colors.black,
                )
              ],
            ),
          ),
          if (_loadingRecipesState == NotifierState.loaded) ...{
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => _getRecipes(),
                child: ListView.separated(
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = _recipes[index];
                    return InkWell(
                      child: RecipeCard(
                        recipe: Recipe(
                          id: recipe.id,
                          recipeName: recipe.recipeName,
                          categoryName: recipe.categoryName,
                          imageUrl: recipe.imageUrl,
                          amount: recipe.amount,
                          ingredients: recipe.ingredients,
                          instructions: recipe.instructions,
                          nutrition: recipe.nutrition,
                        ),
                      ),
                      onTap: () {
                        context.pushNamed(AppRoutes.recipeDetails,
                            extra: recipe);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                ),
              ),
            )
          } else if (_loadingRecipesState == NotifierState.loading) ...{
            const Expanded(
              child: Center(
                child: Text(
                  'Loading recipes...',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          }
        ],
      ),
    );
  }

  Future<void> _getRecipes() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _loadingRecipesState = NotifierState.loading;
      });
      Provider.of<RecipeProvider>(context, listen: false)
          .getRecipes()
          .then((response) {
        if (mounted) {
          setState(() {
            _loadingRecipesState = NotifierState.loaded;
          });
          if (response.successful) {
            _recipes = response.data!;
          } else {
            // TODO: handle error
            print(response.message);
          }
        }
      });
    });
  }
}

// TODO: dont fetch the page everytime on init state
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   bool isFetched = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 12,
//         right: 12,
//         top: 20,
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Today's Picks",
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.rubik(
//                     fontSize: 26,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const Icon(
//                   Icons.search_sharp,
//                   size: 32,
//                   color: Colors.black,
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Consumer<RecipesProvider>(
//                 builder: (context, recipesProvider, child) {
//                   if (isFetched == false) {
//                     recipesProvider.getRecipes();
//                     Future.delayed(
//                         const Duration(seconds: 2), () => isFetched = true);
//                   }
//                   return RefreshIndicator(
//                     onRefresh: () {
//                       recipesProvider.getRecipes();
//                       return Future.delayed(const Duration(seconds: 2));
//                     },
//                     child: ListView.separated(
//                       itemCount: recipesProvider.getResponseData().length,
//                       itemBuilder: (context, index) {
//                         final recipe = recipesProvider.getResponseData()[index];
//                         return InkWell(
//                           child: HomeCard(
//                             recipe: Recipe(
//                               id: recipe.id,
//                               recipeName: recipe.recipeName,
//                               categoryName: recipe.categoryName,
//                               imageUrl: recipe.imageUrl,
//                               amount: recipe.amount,
//                               ingredients: recipe.ingredients,
//                               instructions: recipe.instructions,
//                               nutrition: recipe.nutrition,
//                             ),
//                           ),
//                           onTap: () {
//                             context.pushNamed(AppRoutes.recipeDetails,
//                                 extra: recipe);
//                           },
//                         );
//                       },
//                       separatorBuilder: (context, index) => const SizedBox(
//                         height: 10,
//                       ),
//                     ),
//                   );
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }

