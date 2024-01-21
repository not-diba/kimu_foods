import 'package:flutter/material.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';
import 'package:kimu_foods/widgets/directions.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/components/components.dart';
import 'package:kimu_foods/models/models.dart';

class RecipeDetails extends StatefulWidget {
  final RecipeModel recipe;

  const RecipeDetails({super.key, required this.recipe});

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
                        color: Colors.white,
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
                      color: Colors.black,
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
                    child: Material(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: backgroundColor[300],
                      child: Container(
                        height: 30,
                      ),
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
                                  offset: const Offset(
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
                        const Align(
                          alignment: Alignment.center,
                          child: NutritionBox(),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              LineIcons.arrowRight,
                              size: 20,
                              color: mainColor[500],
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 20),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: screenHeight * .9,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Directions',
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.rubik(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 20),

                                              Expanded(
                                                child: Directions(
                                                    instructions: widget
                                                        .recipe.instructions),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(
                                  "CHECK OUT THE DIRECTIONS",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    color: mainColor[500],
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                        ElevatedPrimaryButton(
                            amount: widget.recipe.amount * selectedPeople,
                            label: 'ADD TO BASKET'),
                        const SizedBox(height: 18),
                        IngredientsList(ingredients: widget.recipe.ingredients),
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
