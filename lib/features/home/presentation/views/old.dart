// import 'package:flutter/material.dart';
// import 'package:kimu_foods/core/components/widgets/counter.dart';
// import 'package:kimu_foods/core/components/widgets/elevated_primary_button.dart';
// import 'package:kimu_foods/features/recipe/domain/entities/nutrition.dart';
// import 'package:kimu_foods/features/recipe/domain/entities/recipe.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../widgets/ingredients_list.dart';
// import '../../../../../core/utils/generics/nutrition_icons.dart';
// import '../../../../core/utils/theme/material_colors.dart';
//
// class RecipeDetails extends StatefulWidget {
//   final Recipe recipe;
//
//   const RecipeDetails({super.key, required this.recipe});
//
//   @override
//   State<RecipeDetails> createState() => _RecipeDetailsState();
// }
//
// class _RecipeDetailsState extends State<RecipeDetails> {
//   int _selectedPeople = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     final MediaQueryData mediaQueryData = MediaQuery.of(context);
//     return SafeArea(
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               collapsedHeight: mediaQueryData.size.height * .15,
//               expandedHeight: mediaQueryData.size.height * .3,
//               stretchTriggerOffset: 300.0,
//               pinned: true,
//               leading: Padding(
//                 padding: const EdgeInsets.all(6),
//                 child: InkWell(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.transparent,
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(100)),
//                     width: 50,
//                     height: 50,
//                     child: const Icon(
//                       Icons.close_sharp,
//                       color: Colors.black,
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//               flexibleSpace: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     child: ClipRRect(
//                       child: Image.network(
//                         widget.recipe.imageUrl,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     width: mediaQueryData.size.width,
//                     bottom: 0,
//                     child: Material(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(8),
//                         topRight: Radius.circular(8),
//                       ),
//                       color: backgroundColor[300],
//                       child: Container(
//                         height: 30,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: backgroundColor[300]!,
//                           ),
//                           color: backgroundColor[300],
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(8),
//                             topRight: Radius.circular(8),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     width: mediaQueryData.size.width,
//                     bottom: 0,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(22),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 5,
//                                   blurRadius: 7,
//                                   offset: const Offset(
//                                       0, 3), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             height: 40,
//                             child: const Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 10),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Icon(LineIcons.clock, size: 24),
//                                       SizedBox(width: 5),
//                                       Text(
//                                         '25 min',
//                                         style: TextStyle(
//                                             fontSize: 12, color: grey),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 VerticalDivider(
//                                   width: 20,
//                                   thickness: 1,
//                                   indent: 6.5,
//                                   endIndent: 6.5,
//                                   color: Colors.grey,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(right: 10),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Icon(LineIcons.utensils, size: 24),
//                                       SizedBox(width: 5),
//                                       Text(
//                                         '3 People',
//                                         style: TextStyle(
//                                             fontSize: 12, color: grey),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 20),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: mainColor[500],
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 5,
//                                   blurRadius: 7,
//                                   offset: const Offset(
//                                       0, 3), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             child: const Padding(
//                               padding: EdgeInsets.all(15),
//                               child: Icon(
//                                 Icons.favorite,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 12,
//                       right: 12,
//                       top: 10,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.recipe.categoryName.toUpperCase(),
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.rubik(
//                             fontSize: 16,
//                             color: backgroundColor[900],
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Text(
//                           widget.recipe.recipeName.toUpperCase(),
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.rubik(
//                             fontSize: 22,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Row(
//                           children: [
//                             Text('Place Holder for like counter and rating.')
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Text(
//                                 'Nutritional Information per person',
//                                 textAlign: TextAlign.start,
//                                 style: GoogleFonts.rubik(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         Align(
//                           alignment: Alignment.center,
//                           child: _nutritionInfoItems(
//                             widget.recipe.nutrition,
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         Wrap(
//                           crossAxisAlignment: WrapCrossAlignment.center,
//                           children: [
//                             Icon(
//                               LineIcons.arrowRight,
//                               size: 20,
//                               color: mainColor[500],
//                             ),
//                             InkWell(
//                               onTap: () => _recipeDirections(context,
//                                   mediaQueryData, widget.recipe.instructions),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 2),
//                                 child: Text(
//                                   "CHECK OUT THE DIRECTIONS",
//                                   textAlign: TextAlign.start,
//                                   style: GoogleFonts.rubik(
//                                     fontSize: 16,
//                                     color: mainColor[500],
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'People',
//                               textAlign: TextAlign.start,
//                               style: GoogleFonts.rubik(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             Counter(
//                               onCountChanged: _updateAmount,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 18),
//                         IngredientsList(ingredients: widget.recipe.ingredients),
//                         const SizedBox(height: 18),
//                         ElevatedPrimaryButton(
//                             amount: widget.recipe.amount * _selectedPeople,
//                             label: 'ADD TO BASKET'),
//                         const SizedBox(height: 18),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _updateAmount(int count) {
//     setState(() {
//       _selectedPeople = count;
//     });
//   }
// }
//
// Widget _nutritionInfoItems(List<Nutrition> nutrition) {
//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: _buildContainers(nutrition),
//     ),
//   );
// }
//
// List<Widget> _buildContainers(List<Nutrition> nutrition) {
//   List<Widget> containers = [];
//
//   for (var item in nutrition) {
//     containers.add(
//       Padding(
//         padding: const EdgeInsets.only(left: 5, right: 5),
//         child: _nutritionInfoItem(item),
//       ),
//     );
//   }
//   return containers;
// }
//
// Widget _nutritionInfoItem(Nutrition nutritionItem) {
//   return Container(
//     width: 77.5,
//     height: 105,
//     decoration: BoxDecoration(
//         color: Colors.white, borderRadius: BorderRadius.circular(12)),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           nutritionInfoIconMap[nutritionItem.nutritionItem],
//           color: mainColor[500],
//         ),
//         const SizedBox(height: 6),
//         Text(
//           nutritionItem.quantity.toUpperCase(),
//           textAlign: TextAlign.start,
//           style: GoogleFonts.rubik(
//             fontSize: 16,
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         Text(
//           nutritionItem.nutritionItem,
//           textAlign: TextAlign.start,
//           style: GoogleFonts.rubik(
//             fontSize: 14,
//             color: backgroundColor[900],
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Future<void> _recipeDirections(BuildContext context,
//     MediaQueryData mediaQueryData, List<String> instructions) {
//   return showModalBottomSheet<void>(
//     isScrollControlled: true,
//     useSafeArea: true,
//     context: context,
//     builder: (BuildContext context) {
//       return DraggableScrollableSheet(
//         initialChildSize: 0.6,
//         minChildSize: 0.6,
//         maxChildSize: 0.9,
//         expand: false,
//         builder: (context, scrollController) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Directions',
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.rubik(
//                     fontSize: 20,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 _directions(instructions, scrollController),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }
//
// Widget _directions(
//     List<String> instructions, ScrollController scrollController) {
//   const double sharedWidth = 30;
//   const double sharedHeight = 30;
//   const double dividerSpacing = 5;
//   return Expanded(
//     child: ListView.separated(
//       controller: scrollController,
//       itemCount: instructions.length,
//       itemBuilder: (context, index) {
//         return Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: sharedHeight,
//               width: sharedWidth,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 2.5,
//                   color: mainColor,
//                 ),
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Text(
//                   (index + 1).toString(),
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.rubik(
//                     fontSize: 16,
//                     color: darkAccentColor[900],
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Flexible(
//               child: Text(
//                 instructions[index],
//                 textAlign: TextAlign.start,
//                 style: GoogleFonts.rubik(
//                   fontSize: 14,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             )
//           ],
//         );
//       },
//       separatorBuilder: (context, index) => Align(
//         alignment: Alignment.centerLeft,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(height: dividerSpacing),
//             SizedBox(
//               width: sharedWidth,
//               height: sharedHeight,
//               child: Center(
//                 child: VerticalDivider(
//                   color: darkAccentColor[900],
//                   thickness: 1.5,
//                 ),
//               ),
//             ),
//             const SizedBox(height: dividerSpacing),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
