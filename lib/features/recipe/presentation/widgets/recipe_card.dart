import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/core/components/widgets/grey_badge.dart';
import 'package:kimu_foods/features/recipe/domain/entities/recipe.dart';
import 'package:kimu_foods/core/components/entities/grey_badge_props.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/utils/theme/material_colors.dart';
import '../../../../core/utils/generics/format_amount.dart';


class RecipeCard extends StatelessWidget {
  Recipe recipe;

  RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Card(
      elevation: 10,
      shadowColor: Colors.transparent,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.44,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18),
                  ),
                  child: Image.network(
                    recipe.imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, bottom: 6),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                recipe.recipeName.toUpperCase(),
                                textAlign: TextAlign.start,
                                style: GoogleFonts.rubik(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                // "With extra Vegetables",
                                recipe.id,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.rubik(
                                  fontSize: 16,
                                  color: backgroundColor[900],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        "Based On:",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 4,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 6,
                                              bottom: 6),
                                          decoration: BoxDecoration(
                                            color: secondaryColorTeal[500],
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            recipe.categoryName.toUpperCase(),
                                            style: GoogleFonts.rubik(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: backgroundColor[50]),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        'Ingredients-',
                                        style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          color: backgroundColor[900],
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '${recipe.ingredients.length}',
                                        style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: .75,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 6, left: 16, right: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: mediaQueryData.size.width * .6,
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  Text(
                                    formatAmount(recipe.amount),
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, bottom: 2),
                                    child: Text(
                                      'for 3 people',
                                      style: GoogleFonts.rubik(
                                        fontSize: 12,
                                        color: backgroundColor[900],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  LineIcons.arrowRight,
                                  size: 20,
                                  color: mainColor[500],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(
                                    "VIEW",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      color: mainColor[500],
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          GreyBadge(
            props: GreyBadgeProps(
              top: 0,
              left: 0,
              badgeText: recipe.categoryName.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
