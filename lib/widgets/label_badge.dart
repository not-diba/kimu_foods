import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/utils/utils.dart';

class LabelBadge extends StatelessWidget {
  final String badgeText;
  const LabelBadge({super.key, required this.badgeText});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0, // Adjust the top position as needed
      left: 0, // Adjust the left position as needed
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor[900],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), bottomRight: Radius.circular(18)),
        ),
        child: Text(
          badgeText,
          style: GoogleFonts.rubik(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
