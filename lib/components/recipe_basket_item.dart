import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';

class RecipeBasketItem extends StatefulWidget {
  const RecipeBasketItem({super.key});

  @override
  State<RecipeBasketItem> createState() => _RecipeBasketItemState();
}

class _RecipeBasketItemState extends State<RecipeBasketItem> {
  String? _character;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Arrow Root",
              textAlign: TextAlign.start,
              style: GoogleFonts.rubik(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "1 tbsp",
              textAlign: TextAlign.start,
              style: GoogleFonts.rubik(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Visibility(
              visible: _character == 'recipe',
              child: Text(
                "I HAVE IT!",
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  color: mainColor[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Transform.scale(
              scale: 1.3,
              child: Radio(
                toggleable: true,
                activeColor: teal[700],
                value: 'recipe',
                groupValue: _character,
                onChanged: (String? value) {
                  setState(() {
                    if (_character == value) {
                      _character = null;
                    } else {
                      _character = value;
                    }
                  });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
