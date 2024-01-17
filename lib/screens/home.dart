import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/Routes/routes.dart';
import 'package:kimu_foods/components/components.dart';
import 'package:kimu_foods/providers/recipes/get_recipes.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFetched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
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
          Expanded(
            child: Consumer<GetRecipesProvider>(
                builder: (context, recipes, child) {
              if (isFetched == false) {
                recipes.getRecipes();
                Future.delayed(
                    const Duration(seconds: 2), () => isFetched = true);
              }
              return RefreshIndicator(
                onRefresh: () {
                  recipes.getRecipes();
                  return Future.delayed(const Duration(seconds: 2));
                },
                child: ListView.separated(
                  itemCount: recipes.getResponseData().length,
                  itemBuilder: (context, index) {
                    final recipe = recipes.getResponseData()[index];
                    return InkWell(
                      child: FeedCard(
                        id: recipe.id,
                        recipeName: recipe.recipeName,
                        categoryName: recipe.categoryName,
                        imageUrl: recipe.imageUrl,
                        amount: recipe.amount,
                        ingredients: recipe.ingredients,
                        instructions: recipe.instructions,
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
              );
            }),
          )
        ],
      ),
    );
  }
}
