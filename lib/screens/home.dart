import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/components/components.dart';
import 'package:kimu_foods/screens/recipe_details.dart';

class Recipe {
  final String imageUrl;
  final String recipeName;
  final String categoryName;
  final double amount;

  Recipe(
      {required this.imageUrl,
      required this.recipeName,
      required this.categoryName,
      required this.amount});
}

class Home extends StatefulWidget {
  Home({super.key});

  final List<Recipe> recommendedData = [
    Recipe(
        imageUrl:
            'https://wallpapers.com/images/hd/food-4k-1pf6px6ryqfjtnyr.jpg',
        recipeName: 'Stake',
        amount: 6000,
        categoryName: 'Grill'),
    Recipe(
        imageUrl:
            'https://wallpapers.com/images/hd/food-4k-m37wpodzrcbv5gvw.jpg',
        recipeName: 'LASAGNA',
        amount: 220,
        categoryName: 'One Pot'),
    Recipe(
        imageUrl: 'https://wallpaperaccess.com/full/438099.jpg',
        recipeName: 'SALAD',
        amount: 320,
        categoryName: 'healthy'),
    Recipe(
      imageUrl:
          'https://c4.wallpaperflare.com/wallpaper/234/543/684/food-pizza-wallpaper-preview.jpg',
      recipeName: 'Pizza',
      amount: 850,
      categoryName: 'Fast Food',
    ),
    Recipe(
        imageUrl: 'https://images7.alphacoders.com/110/1103153.jpg',
        recipeName: 'English Breakfast',
        amount: 125,
        categoryName: 'breakfast'),
    Recipe(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        recipeName: 'Burgers',
        amount: 450,
        categoryName: 'fast food'),
    Recipe(
        imageUrl:
            'https://assets.epicurious.com/photos/62c4790ccb99ba31b1339c02/4:3/w_4932,h_3699,c_limit/OnePotSpaghetti_RECIPE_062922_36622.jpg',
        recipeName: 'Spaghetti',
        amount: 200,
        categoryName: 'one pot'),
    Recipe(
        imageUrl:
            'https://www.pixelstalk.net/wp-content/uploads/images5/Free-Download-4K-Food-Wallpaper-for-Desktop.jpg',
        recipeName: 'milkshakes',
        amount: 400,
        categoryName: 'new'),
    Recipe(
        imageUrl:
            'https://t3.ftcdn.net/jpg/02/55/42/50/360_F_255425068_CyDrGsVcu1Bl2SdJ2yXx35Rlp8jyNCCQ.jpg',
        recipeName: 'Shwarma',
        amount: 350,
        categoryName: 'halal'),
    Recipe(
        imageUrl:
            'https://food.mulembenation.co.ke/wp-content/uploads/sites/4/2020/05/ugali-with-fish-and-a-side-of-vegetables.jpg',
        recipeName: 'Ugali',
        amount: 250,
        categoryName: 'local cuisine'),
    Recipe(
        imageUrl:
            'https://e1.pxfuel.com/desktop-wallpaper/903/907/desktop-wallpaper-6-vegan-healthy-food.jpg',
        recipeName: 'Chapati',
        amount: 450,
        categoryName: 'healthy'),
    Recipe(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        recipeName: 'Burgers',
        amount: 3132,
        categoryName: 'Quick & Easy'),
    Recipe(
        imageUrl:
            'https://c1.wallpaperflare.com/preview/938/82/575/seafood-platter-crustaceans-food-seafood.jpg',
        recipeName: 'Lobster',
        amount: 4000,
        categoryName: 'Sea Food'),
    Recipe(
        imageUrl: 'https://images8.alphacoders.com/407/407695.jpg',
        recipeName: 'Vanilla Cake',
        amount: 5500,
        categoryName: 'Cakes'),
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            child: ListView.separated(
              itemCount: widget.recommendedData.length,
              itemBuilder: (context, index) {
                final recipe = widget.recommendedData[index];
                return InkWell(
                  child: FeedCard(
                    recipeName: recipe.recipeName,
                    categoryName: recipe.categoryName,
                    imageUrl: recipe.imageUrl,
                    amount: recipe.amount,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeDetails(recipe: recipe)),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
