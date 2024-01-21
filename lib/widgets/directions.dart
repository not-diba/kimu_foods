import 'package:flutter/material.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Directions extends StatelessWidget {
  final List<String> instructions;

  const Directions({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    const double sharedWidth = 30;
    const double dividerSpacing = 5;
    return ListView.separated(
      itemCount: instructions.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: sharedWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: mainColor,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: darkAccentColor[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                instructions[index],
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) => Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: dividerSpacing),
            SizedBox(
              width: sharedWidth,
              height: 30,
              child: Center(
                child: VerticalDivider(
                  color: darkAccentColor[900],
                  thickness: 1.5,
                ),
              ),
            ),
            const SizedBox(height: dividerSpacing),
          ],
        ),
      ),
    );
  }
}
