import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/data/models/grey_badge_props.dart';
import 'package:kimu_foods/utils/utils.dart';

class GreyBadge extends StatelessWidget {
  final GreyBadgeProps props;
  

  const GreyBadge(
      {super.key, required this.props});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: props.top,
      bottom: props.bottom,
      left: props.left,
      right: props.right,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: Text(
          props.badgeText,
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
