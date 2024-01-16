import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/components/components.dart';
import 'package:kimu_foods/utils/utils.dart';
import 'package:kimu_foods/models/models.dart';


class Basket extends StatefulWidget {
  Basket({super.key});

  final List<BasketModel> recommendedData = [
    BasketModel(
        imageUrl:
            'https://wallpapers.com/images/hd/food-4k-1pf6px6ryqfjtnyr.jpg',
        recipeName: 'Stake',
        serving: 2,
        amount: 6000,
        categoryName: 'Grill'),
    BasketModel(
        imageUrl:
            'https://wallpapers.com/images/hd/food-4k-m37wpodzrcbv5gvw.jpg',
        recipeName: 'LASAGNA',
        serving: 3,
        amount: 220,
        categoryName: 'One Pot'),
    BasketModel(
        imageUrl: 'https://wallpaperaccess.com/full/438099.jpg',
        recipeName: 'SALAD',
        serving: 7,
        amount: 320,
        categoryName: 'healthy'),
    BasketModel(
      imageUrl:
          'https://c4.wallpaperflare.com/wallpaper/234/543/684/food-pizza-wallpaper-preview.jpg',
      recipeName: 'Pizza',
      serving: 8,
      amount: 850,
      categoryName: 'Fast Food',
    ),
    BasketModel(
        imageUrl: 'https://images7.alphacoders.com/110/1103153.jpg',
        recipeName: 'English Breakfast',
        serving: 1,
        amount: 125,
        categoryName: 'breakfast'),
    BasketModel(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        recipeName: 'Burgers',
        serving: 4,
        amount: 450,
        categoryName: 'fast food'),
    BasketModel(
        imageUrl:
            'https://assets.epicurious.com/photos/62c4790ccb99ba31b1339c02/4:3/w_4932,h_3699,c_limit/OnePotSpaghetti_RECIPE_062922_36622.jpg',
        recipeName: 'Spaghetti',
        serving: 6,
        amount: 200,
        categoryName: 'one pot'),
    BasketModel(
        imageUrl:
            'https://www.pixelstalk.net/wp-content/uploads/images5/Free-Download-4K-Food-Wallpaper-for-Desktop.jpg',
        recipeName: 'milkshakes',
        serving: 8,
        amount: 400,
        categoryName: 'new'),
    BasketModel(
        imageUrl:
            'https://t3.ftcdn.net/jpg/02/55/42/50/360_F_255425068_CyDrGsVcu1Bl2SdJ2yXx35Rlp8jyNCCQ.jpg',
        recipeName: 'Shwarma',
        serving: 8,
        amount: 350,
        categoryName: 'halal'),
    BasketModel(
        imageUrl:
            'https://food.mulembenation.co.ke/wp-content/uploads/sites/4/2020/05/ugali-with-fish-and-a-side-of-vegetables.jpg',
        recipeName: 'Ugali',
        serving: 12,
        amount: 250,
        categoryName: 'local cuisine'),
    BasketModel(
        imageUrl:
            'https://e1.pxfuel.com/desktop-wallpaper/903/907/desktop-wallpaper-6-vegan-healthy-food.jpg',
        recipeName: 'Chapati',
        serving: 10,
        amount: 30,
        categoryName: 'healthy'),
    BasketModel(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        recipeName: 'Burgers',
        serving: 14,
        amount: 450,
        categoryName: 'Quick & Easy'),
    BasketModel(
        imageUrl:
            'https://c1.wallpaperflare.com/preview/938/82/575/seafood-platter-crustaceans-food-seafood.jpg',
        recipeName: 'Lobster',
        serving: 17,
        amount: 3132,
        categoryName: 'Sea Food'),
    BasketModel(
        imageUrl: 'https://images8.alphacoders.com/407/407695.jpg',
        recipeName: 'Vanilla Cake',
        serving: 19,
        amount: 4000,
        categoryName: 'Cakes'),
  ];

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Baskets",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.rubik(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ActionChip(
                    side: BorderSide.none,
                    avatar: const Icon(
                      Icons.receipt_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                    label: const Text('Orders'),
                    backgroundColor: backgroundColor[600],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Text(
              "RECIPES",
              textAlign: TextAlign.start,
              style: GoogleFonts.rubik(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: screenHeight * .5,
              width: double.infinity,
              child: ListView.separated(
                itemCount: widget.recommendedData.length,
                itemBuilder: (context, index) {
                  final recipe = widget.recommendedData[index];
                  return BasketItem(
                    recipeName: recipe.recipeName,
                    categoryName: recipe.categoryName,
                    imageUrl: recipe.imageUrl,
                    amount: recipe.amount,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
            const SizedBox(height: 32),
            IngredientsList(recipe: widget.recommendedData),
            const SizedBox(height: 18),
            ElevatedPrimaryButton(
                amount: sumAmounts(widget.recommendedData), label: 'PURCHASE'),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

// TODO: remove this sum function
double sumAmounts(List<BasketModel> data) {
  double totalAmount = 0.0;
  for (var item in data) {
    totalAmount += item.amount;
  }
  return totalAmount;
}
