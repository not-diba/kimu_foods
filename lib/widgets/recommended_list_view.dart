import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/components/components.dart';

class Category {
  final String imageUrl;
  final String recipeName;
  final String categoryName;

  Category({
    required this.imageUrl,
    required this.recipeName,
    required this.categoryName,
  });
}

class RecommendedListView extends StatelessWidget {
  RecommendedListView({super.key});

  final List<Category> recommendedData = [
    Category(
        imageUrl:
            'https://wallpapers.com/images/hd/food-4k-m37wpodzrcbv5gvw.jpg',
        recipeName: 'LASAGNA',
        categoryName: 'One Pot'),
    Category(
        imageUrl:
            'https://wallpapers.com/images/hd/food-4k-1pf6px6ryqfjtnyr.jpg',
        recipeName: 'Stake',
        categoryName: 'Grill'),
    Category(
        imageUrl: 'https://wallpaperaccess.com/full/438099.jpg',
        recipeName: 'SALAD',
        categoryName: 'healthy'),
    Category(
      imageUrl:
          'https://c4.wallpaperflare.com/wallpaper/234/543/684/food-pizza-wallpaper-preview.jpg',
      recipeName: 'Pizza',
      categoryName: 'Fast Food',
    ),
    Category(
        imageUrl: 'https://images7.alphacoders.com/110/1103153.jpg',
        recipeName: 'English Breakfast',
        categoryName: 'breakfast'),
    Category(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        recipeName: 'Burgers',
        categoryName: 'fast food'),
    Category(
        imageUrl:
            'https://assets.epicurious.com/photos/62c4790ccb99ba31b1339c02/4:3/w_4932,h_3699,c_limit/OnePotSpaghetti_RECIPE_062922_36622.jpg',
        recipeName: 'Spaghetti',
        categoryName: 'one pot'),
    Category(
        imageUrl:
            'https://www.pixelstalk.net/wp-content/uploads/images5/Free-Download-4K-Food-Wallpaper-for-Desktop.jpg',
        recipeName: 'milkshakes',
        categoryName: 'new'),
    Category(
        imageUrl:
            'https://t3.ftcdn.net/jpg/02/55/42/50/360_F_255425068_CyDrGsVcu1Bl2SdJ2yXx35Rlp8jyNCCQ.jpg',
        recipeName: 'Shwarma',
        categoryName: 'halal'),
    Category(
        imageUrl:
            'https://food.mulembenation.co.ke/wp-content/uploads/sites/4/2020/05/ugali-with-fish-and-a-side-of-vegetables.jpg',
        recipeName: 'Ugali',
        categoryName: 'local cuisine'),
    Category(
        imageUrl:
            'https://e1.pxfuel.com/desktop-wallpaper/903/907/desktop-wallpaper-6-vegan-healthy-food.jpg',
        recipeName: 'Chapati',
        categoryName: 'healthy'),
    Category(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        recipeName: 'Burgers',
        categoryName: 'Quick & Easy'),
    Category(
        imageUrl:
            'https://c1.wallpaperflare.com/preview/938/82/575/seafood-platter-crustaceans-food-seafood.jpg',
        recipeName: 'Lobster',
        categoryName: 'Sea Food'),
    Category(
        imageUrl: 'https://images8.alphacoders.com/407/407695.jpg',
        recipeName: 'Vanilla Cake',
        categoryName: 'Cakes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RECOMMENDED',
            style:
                GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w700)),
        const SizedBox(height: 3),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendedData.length,
              itemBuilder: (context, index) {
                final recommended = recommendedData[index];
                return RecentsCard(
                  imageUrl: recommended.imageUrl,
                  recipeName: recommended.recipeName,
                  categoryName: recommended.categoryName,
                );
              }),
        ),
      ],
    );
  }
}
