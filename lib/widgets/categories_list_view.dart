import 'package:flutter/material.dart';
import 'package:kimu_foods/components/components.dart';

class Category {
  final String imageUrl;
  final String categoryName;

  Category({
    required this.imageUrl,
    required this.categoryName,
  });
}

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});

  final List<Category> categoryData = [
    Category(
        imageUrl: 'https://wallpaperaccess.com/full/438099.jpg',
        categoryName: 'Fruits'),
    Category(
        imageUrl:
            'https://c4.wallpaperflare.com/wallpaper/234/543/684/food-pizza-wallpaper-preview.jpg',
        categoryName: 'Pizza'),
    Category(
        imageUrl: 'https://images7.alphacoders.com/110/1103153.jpg',
        categoryName: 'Breakfast'),
    Category(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        categoryName: 'Burgers'),
    Category(
        imageUrl:
            'https://assets.epicurious.com/photos/62c4790ccb99ba31b1339c02/4:3/w_4932,h_3699,c_limit/OnePotSpaghetti_RECIPE_062922_36622.jpg',
        categoryName: 'One Pot'),
    Category(
        imageUrl:
            'https://www.pixelstalk.net/wp-content/uploads/images5/Free-Download-4K-Food-Wallpaper-for-Desktop.jpg',
        categoryName: 'New In'),
    Category(
        imageUrl:
            'https://t3.ftcdn.net/jpg/02/55/42/50/360_F_255425068_CyDrGsVcu1Bl2SdJ2yXx35Rlp8jyNCCQ.jpg',
        categoryName: 'Halal'),
    Category(
        imageUrl:
            'https://food.mulembenation.co.ke/wp-content/uploads/sites/4/2020/05/ugali-with-fish-and-a-side-of-vegetables.jpg',
        categoryName: 'Local Cuisine'),
    Category(
        imageUrl:
            'https://e1.pxfuel.com/desktop-wallpaper/903/907/desktop-wallpaper-6-vegan-healthy-food.jpg',
        categoryName: 'Healthy'),
    Category(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        categoryName: 'Quick & Easy'),
    Category(
        imageUrl:
            'https://c1.wallpaperflare.com/preview/938/82/575/seafood-platter-crustaceans-food-seafood.jpg',
        categoryName: 'Sea Food'),
    Category(
        imageUrl:
            'https://images8.alphacoders.com/407/407695.jpg',
        categoryName: 'Cakes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: categoryData.length,
        itemBuilder: (context, index) {
          final category = categoryData[index];
          return CategoriesCard(
            imageUrl: category.imageUrl,
            categoryName: category.categoryName,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 4,
        ),
      ),
    );
  }
}
