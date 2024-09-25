// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:kimu_foods/features/categories/domain/entities/recipe_category.dart';
//
// import '../widgets/recent_card.dart';
// import '../widgets/categories_card.dart';
//
// class Categories extends StatefulWidget {
//   const Categories({super.key});
//
//   @override
//   State<Categories> createState() => _CategoriesState();
// }
//
// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20,
//         right: 20,
//         top: 20,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(bottom: 15),
//             child: SearchBar(
//               leading: Icon(
//                 Icons.search_sharp,
//                 size: 26,
//               ),
//               hintText: 'Search in Categories',
//               elevation: WidgetStatePropertyAll<double>(0.0),
//               padding: WidgetStatePropertyAll<EdgeInsets>(
//                   EdgeInsets.symmetric(horizontal: 15)),
//             ),
//           ),
//           _recentScrollView(),
//           const SizedBox(height: 24),
//           Text('CATEGORIES', style: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w700)),
//           _categoriesListView(),
//         ],
//       ),
//     );
//   }
//
//
//
//   Widget _recentScrollView() {
//     final List<RecipeCategory> recommendedData = [
//       RecipeCategory(
//           imageUrl:
//           'https://wallpapers.com/images/hd/food-4k-m37wpodzrcbv5gvw.jpg',
//           recipeName: 'LASAGNA',
//           categoryName: 'One Pot'),
//       RecipeCategory(
//           imageUrl:
//           'https://wallpapers.com/images/hd/food-4k-1pf6px6ryqfjtnyr.jpg',
//           recipeName: 'Stake',
//           categoryName: 'Grill'),
//       RecipeCategory(
//           imageUrl: 'https://wallpaperaccess.com/full/438099.jpg',
//           recipeName: 'SALAD',
//           categoryName: 'healthy'),
//       RecipeCategory(
//         imageUrl:
//         'https://c4.wallpaperflare.com/wallpaper/234/543/684/food-pizza-wallpaper-preview.jpg',
//         recipeName: 'Pizza',
//         categoryName: 'Fast Food',
//       ),
//       RecipeCategory(
//           imageUrl: 'https://images7.alphacoders.com/110/1103153.jpg',
//           recipeName: 'English Breakfast',
//           categoryName: 'breakfast'),
//       RecipeCategory(
//           imageUrl:
//           'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
//           recipeName: 'Burgers',
//           categoryName: 'fast food'),
//       RecipeCategory(
//           imageUrl:
//           'https://assets.epicurious.com/photos/62c4790ccb99ba31b1339c02/4:3/w_4932,h_3699,c_limit/OnePotSpaghetti_RECIPE_062922_36622.jpg',
//           recipeName: 'Spaghetti',
//           categoryName: 'one pot'),
//       RecipeCategory(
//           imageUrl:
//           'https://www.pixelstalk.net/wp-content/uploads/images5/Free-Download-4K-Food-Wallpaper-for-Desktop.jpg',
//           recipeName: 'milkshakes',
//           categoryName: 'new'),
//       RecipeCategory(
//           imageUrl:
//           'https://t3.ftcdn.net/jpg/02/55/42/50/360_F_255425068_CyDrGsVcu1Bl2SdJ2yXx35Rlp8jyNCCQ.jpg',
//           recipeName: 'Shwarma',
//           categoryName: 'halal'),
//       RecipeCategory(
//           imageUrl:
//           'https://food.mulembenation.co.ke/wp-content/uploads/sites/4/2020/05/ugali-with-fish-and-a-side-of-vegetables.jpg',
//           recipeName: 'Ugali',
//           categoryName: 'local cuisine'),
//       RecipeCategory(
//           imageUrl:
//           'https://e1.pxfuel.com/desktop-wallpaper/903/907/desktop-wallpaper-6-vegan-healthy-food.jpg',
//           recipeName: 'Chapati',
//           categoryName: 'healthy'),
//       RecipeCategory(
//           imageUrl:
//           'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
//           recipeName: 'Burgers',
//           categoryName: 'Quick & Easy'),
//       RecipeCategory(
//           imageUrl:
//           'https://c1.wallpaperflare.com/preview/938/82/575/seafood-platter-crustaceans-food-seafood.jpg',
//           recipeName: 'Lobster',
//           categoryName: 'Sea Food'),
//       RecipeCategory(
//           imageUrl: 'https://images8.alphacoders.com/407/407695.jpg',
//           recipeName: 'Vanilla Cake',
//           categoryName: 'Cakes'),
//     ];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('RECENT',
//             style:
//             GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w700)),
//         const SizedBox(height: 3),
//         SizedBox(
//           height: 170,
//           child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: recommendedData.length,
//               itemBuilder: (context, index) {
//                 final recommended = recommendedData[index];
//                 return RecentCard(
//                   imageUrl: recommended.imageUrl,
//                   recipeName: recommended.recipeName,
//                   categoryName: recommended.categoryName,
//                 );
//               }),
//         ),
//       ],
//     );
//   }
//
//   Widget _categoriesListView() {
//     final List<RecipeCategory> categoryData = [
//       RecipeCategory(
//           imageUrl:
//           'https://wallpapers.com/images/hd/food-4k-m37wpodzrcbv5gvw.jpg',
//           recipeName: 'LASAGNA',
//           categoryName: 'One Pot'),
//       RecipeCategory(
//           imageUrl:
//           'https://wallpapers.com/images/hd/food-4k-1pf6px6ryqfjtnyr.jpg',
//           recipeName: 'Stake',
//           categoryName: 'Grill'),
//       RecipeCategory(
//           imageUrl: 'https://wallpaperaccess.com/full/438099.jpg',
//           recipeName: 'SALAD',
//           categoryName: 'healthy'),
//       RecipeCategory(
//         imageUrl:
//         'https://c4.wallpaperflare.com/wallpaper/234/543/684/food-pizza-wallpaper-preview.jpg',
//         recipeName: 'Pizza',
//         categoryName: 'Fast Food',
//       ),
//       RecipeCategory(
//           imageUrl: 'https://images7.alphacoders.com/110/1103153.jpg',
//           recipeName: 'English Breakfast',
//           categoryName: 'breakfast'),
//       RecipeCategory(
//           imageUrl:
//           'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
//           recipeName: 'Burgers',
//           categoryName: 'fast food'),
//       RecipeCategory(
//           imageUrl:
//           'https://assets.epicurious.com/photos/62c4790ccb99ba31b1339c02/4:3/w_4932,h_3699,c_limit/OnePotSpaghetti_RECIPE_062922_36622.jpg',
//           recipeName: 'Spaghetti',
//           categoryName: 'one pot'),
//       RecipeCategory(
//           imageUrl:
//           'https://www.pixelstalk.net/wp-content/uploads/images5/Free-Download-4K-Food-Wallpaper-for-Desktop.jpg',
//           recipeName: 'milkshakes',
//           categoryName: 'new'),
//       RecipeCategory(
//           imageUrl:
//           'https://t3.ftcdn.net/jpg/02/55/42/50/360_F_255425068_CyDrGsVcu1Bl2SdJ2yXx35Rlp8jyNCCQ.jpg',
//           recipeName: 'Shwarma',
//           categoryName: 'halal'),
//       RecipeCategory(
//           imageUrl:
//           'https://food.mulembenation.co.ke/wp-content/uploads/sites/4/2020/05/ugali-with-fish-and-a-side-of-vegetables.jpg',
//           recipeName: 'Ugali',
//           categoryName: 'local cuisine'),
//       RecipeCategory(
//           imageUrl:
//           'https://e1.pxfuel.com/desktop-wallpaper/903/907/desktop-wallpaper-6-vegan-healthy-food.jpg',
//           recipeName: 'Chapati',
//           categoryName: 'healthy'),
//       RecipeCategory(
//           imageUrl:
//           'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
//           recipeName: 'Burgers',
//           categoryName: 'Quick & Easy'),
//       RecipeCategory(
//           imageUrl:
//           'https://c1.wallpaperflare.com/preview/938/82/575/seafood-platter-crustaceans-food-seafood.jpg',
//           recipeName: 'Lobster',
//           categoryName: 'Sea Food'),
//       RecipeCategory(
//           imageUrl: 'https://images8.alphacoders.com/407/407695.jpg',
//           recipeName: 'Vanilla Cake',
//           categoryName: 'Cakes'),
//     ];
//     return Expanded(
//       child: ListView.separated(
//         itemCount: categoryData.length,
//         itemBuilder: (context, index) {
//           final category = categoryData[index];
//           return CategoriesCard(
//             imageUrl: category.imageUrl,
//             categoryName: category.categoryName,
//           );
//         },
//         separatorBuilder: (context, index) => const SizedBox(
//           height: 4,
//         ),
//       ),
//     );
//   }
//
// }
//
//
