import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';

class BasketItem extends StatefulWidget {
  const BasketItem({super.key});

  @override
  State<BasketItem> createState() => _BasketItemState();
}

class _BasketItemState extends State<BasketItem> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: screenWidth * .8,
            height: screenHeight * 0.16,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14)),
            ),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14)),
                child: Image.network(
                  'https://wallpapers.com/images/hd/food-4k-1pf6px6ryqfjtnyr.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: screenWidth * .34,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 18, bottom: 18, left: 16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Several Onions for health',
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      'KES. 1,500',
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: backgroundColor[900],
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: screenWidth * .1,
              height: screenHeight * 0.13,
              decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  )),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Remove',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
