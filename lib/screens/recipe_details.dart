import 'package:flutter/material.dart';
import 'package:kimu_foods/screens/screens.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/components/components.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  RecipeDetails({required this.recipe});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  child: ClipRRect(
                    child: Image.network(
                      recipe.imageUrl,
                      fit: BoxFit.cover,
                      height: screenHeight * 0.35,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.categoryName.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: backgroundColor[900],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        recipe.recipeName.toUpperCase(),
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
                            padding: EdgeInsets.only(left: 6),
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
                          // TODO: counter
                          const Text('Counter')
                        ],
                      ),
                      const SizedBox(height: 18),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            backgroundColor: mainColor[500],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.only(
                                left: 70, right: 70, top: 16, bottom: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            textStyle: GoogleFonts.rubik(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {},
                          child: Text('ADD TO BASKET • ${recipe.amount}'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              width: screenWidth,
              top: screenHeight * 0.32,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(LineIcons.clock, size: 24),
                                SizedBox(width: 5),
                                Text(
                                  '25 min',
                                  style: TextStyle(fontSize: 12, color: grey),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(LineIcons.utensils, size: 24),
                                SizedBox(width: 5),
                                Text(
                                  '3 People',
                                  style: TextStyle(fontSize: 12, color: grey),
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
                            offset: Offset(0, 3), // changes position of shadow
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
            Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
