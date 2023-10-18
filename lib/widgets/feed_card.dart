import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:kimu_foods/widgets/widgets.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({super.key});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 580,
      child: Card(
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
                  height: 380,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18),
                    ),
                    child: Image.network(
                      'https://wallpapers.com/images/hd/food-4k-1pf6px6ryqfjtnyr.jpg',
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
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 6),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "CHAPATI & BEEF",
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
                                  "With extra Vegetables",
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
                                              "LOCAL CUISINE",
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
                                          '12',
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
                        padding: const EdgeInsets.only(
                            top: 6, bottom: 4, left: 16, right: 16),
                        child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  children: [
                                    Text(
                                      "KES. 1,500",
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
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      LineIcons.arrowRight,
                                      size: 20,
                                      color: mainColor[500],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
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
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const LabelBadge(badgeText: 'DELICIOUS MEALS'),
          ],
        ),
      ),
    );
  }
}
