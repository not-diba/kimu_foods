import 'package:flutter/material.dart';
import 'package:kimu_foods/screens/screens.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/components/components.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;

  RecipeDetails({super.key, required this.recipe});

  final List<BasketData> recommendedData = [
    BasketData(
        imageUrl:
            'https://wallpapers.com/images/hd/food-4k-1pf6px6ryqfjtnyr.jpg',
        recipeName: 'Stake',
        serving: 2,
        amount: 6000,
        categoryName: 'Grill'),
    BasketData(
        imageUrl:
            'https://wallpapers.com/images/hd/food-4k-m37wpodzrcbv5gvw.jpg',
        recipeName: 'LASAGNA',
        serving: 3,
        amount: 220,
        categoryName: 'One Pot'),
    BasketData(
        imageUrl: 'https://wallpaperaccess.com/full/438099.jpg',
        recipeName: 'SALAD',
        serving: 7,
        amount: 320,
        categoryName: 'healthy'),
    BasketData(
      imageUrl:
          'https://c4.wallpaperflare.com/wallpaper/234/543/684/food-pizza-wallpaper-preview.jpg',
      recipeName: 'Pizza',
      serving: 8,
      amount: 850,
      categoryName: 'Fast Food',
    ),
    BasketData(
        imageUrl: 'https://images7.alphacoders.com/110/1103153.jpg',
        recipeName: 'English Breakfast',
        serving: 1,
        amount: 125,
        categoryName: 'breakfast'),
    BasketData(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        recipeName: 'Burgers',
        serving: 4,
        amount: 450,
        categoryName: 'fast food'),
    BasketData(
        imageUrl:
            'https://assets.epicurious.com/photos/62c4790ccb99ba31b1339c02/4:3/w_4932,h_3699,c_limit/OnePotSpaghetti_RECIPE_062922_36622.jpg',
        recipeName: 'Spaghetti',
        serving: 6,
        amount: 200,
        categoryName: 'one pot'),
    BasketData(
        imageUrl:
            'https://www.pixelstalk.net/wp-content/uploads/images5/Free-Download-4K-Food-Wallpaper-for-Desktop.jpg',
        recipeName: 'milkshakes',
        serving: 8,
        amount: 400,
        categoryName: 'new'),
    BasketData(
        imageUrl:
            'https://t3.ftcdn.net/jpg/02/55/42/50/360_F_255425068_CyDrGsVcu1Bl2SdJ2yXx35Rlp8jyNCCQ.jpg',
        recipeName: 'Shwarma',
        serving: 8,
        amount: 350,
        categoryName: 'halal'),
    BasketData(
        imageUrl:
            'https://food.mulembenation.co.ke/wp-content/uploads/sites/4/2020/05/ugali-with-fish-and-a-side-of-vegetables.jpg',
        recipeName: 'Ugali',
        serving: 12,
        amount: 250,
        categoryName: 'local cuisine'),
    BasketData(
        imageUrl:
            'https://e1.pxfuel.com/desktop-wallpaper/903/907/desktop-wallpaper-6-vegan-healthy-food.jpg',
        recipeName: 'Chapati',
        serving: 10,
        amount: 30,
        categoryName: 'healthy'),
    BasketData(
        imageUrl:
            'https://i.pinimg.com/originals/ee/08/f2/ee08f2a462156f94e6a7034baa73d6ab.jpg',
        recipeName: 'Burgers',
        serving: 14,
        amount: 450,
        categoryName: 'Quick & Easy'),
    BasketData(
        imageUrl:
            'https://c1.wallpaperflare.com/preview/938/82/575/seafood-platter-crustaceans-food-seafood.jpg',
        recipeName: 'Lobster',
        serving: 17,
        amount: 3132,
        categoryName: 'Sea Food'),
    BasketData(
        imageUrl: 'https://images8.alphacoders.com/407/407695.jpg',
        recipeName: 'Vanilla Cake',
        serving: 19,
        amount: 4000,
        categoryName: 'Cakes'),
  ];

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  int selectedPeople = 1;

  void updateAmount(int count) {
    setState(() {
      selectedPeople = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              collapsedHeight: screenHeight * .15,
              expandedHeight: screenHeight * .3,
              stretchTriggerOffset: 300.0,
              pinned: true,
              leading: Padding(
                padding: const EdgeInsets.all(6),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: darkGrey.withOpacity(.65),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.transparent,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(100)),
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.close_sharp,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * .1,
                    child: ClipRRect(
                      child: Image.network(
                        widget.recipe.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    width: screenWidth,
                    bottom: 0,
                    child: Container(
                      height: 30,
                      color: backgroundColor[300],
                    ),
                  ),
                  Positioned(
                    width: screenWidth,
                    bottom: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            height: 40,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(LineIcons.clock, size: 24),
                                      SizedBox(width: 5),
                                      Text(
                                        '25 min',
                                        style: TextStyle(
                                            fontSize: 12, color: grey),
                                      )
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  width: 20,
                                  thickness: 1,
                                  indent: 6.5,
                                  endIndent: 6.5,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(LineIcons.utensils, size: 24),
                                      SizedBox(width: 5),
                                      Text(
                                        '3 People',
                                        style: TextStyle(
                                            fontSize: 12, color: grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: mainColor[500],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recipe.categoryName.toUpperCase(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: backgroundColor[900],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.recipe.recipeName.toUpperCase(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.rubik(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/originals/20/92/ee/2092ee80c9f9dad52060c65724b1cc15.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'by',
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          color: backgroundColor[900],
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Elvis Madiba',
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.rubik(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'elvis.madiba@gmail.com',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.rubik(
                                      fontSize: 14,
                                      color: backgroundColor[900],
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Nutritional Information per person',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.center,
                          child: NutritionBox(),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'People',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Counter(
                              onCountChanged: updateAmount,
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        IngredientsList(recipe: widget.recommendedData),
                        const SizedBox(height: 18),
                        ElevatedPrimaryButton(
                            amount: widget.recipe.amount * selectedPeople,
                            label: 'ADD TO BASKET'),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
