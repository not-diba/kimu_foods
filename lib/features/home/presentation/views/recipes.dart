// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:kimu_foods/core/network/entities/graphql_base_response.dart';
// import 'package:kimu_foods/features/recipe/domain/entities/recipe.dart';
// import 'package:kimu_foods/features/recipe/domain/providers/recipe_provider.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../core/routes.dart';
// import '../widgets/recipe_card.dart';
//
// class Recipes extends StatefulWidget {
//   const Recipes({super.key});
//
//   @override
//   State<Recipes> createState() => _RecipesState();
// }
//
// class _RecipesState extends State<Recipes> {
//   Future<GraphqlBaseResponse<List<Recipe>>>? _futureRecipes;
//   @override
//   void initState() {
//     super.initState();
//     _getRecipes();
//   }
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
//           FutureBuilder(
//             future: _futureRecipes,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 if (snapshot.data!.successful) {
//                   return Expanded(
//                     child: RefreshIndicator(
//                       onRefresh: () => _getRecipes(),
//                       child: ListView.separated(
//                         itemCount: snapshot.data!.data!.length,
//                         itemBuilder: (context, index) {
//                           final recipe = snapshot.data!.data![index];
//                           return InkWell(
//                             child: RecipeCard(
//                               recipe: Recipe(
//                                 id: recipe.id,
//                                 recipeName: recipe.recipeName,
//                                 categoryName: recipe.categoryName,
//                                 imageUrl: recipe.imageUrl,
//                                 amount: recipe.amount,
//                                 ingredients: recipe.ingredients,
//                                 instructions: recipe.instructions,
//                                 nutrition: recipe.nutrition,
//                               ),
//                             ),
//                             onTap: () {
//                               context.pushNamed(AppRoutes.recipeDetails,
//                                   extra: recipe);
//                             },
//                           );
//                         },
//                         separatorBuilder: (context, index) => const SizedBox(
//                           height: 10,
//                         ),
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Center(
//                     child: Text('${snapshot.data!.message}'),
//                   );
//                 }
//               }
//               return const Center(
//                 child: SizedBox(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _getRecipes() async {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setState(() {
//         _futureRecipes =
//             Provider.of<RecipeProvider>(context, listen: false).getRecipes();
//       });
//     });
//   }
// }
