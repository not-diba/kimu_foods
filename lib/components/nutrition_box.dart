import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';

class NutritionBox extends StatelessWidget {
  const NutritionBox({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> nutritionData = [
      {'nutrition-item': 'calories', 'quantity': 234, 'icon': LineIcons.fire},
      {'nutrition-item': 'saturates', 'quantity': 'low', 'icon': LineIcons.tint},
      {'nutrition-item': 'salt', 'quantity': 'med', 'icon': LineIcons.mortarPestle},
      {'nutrition-item': 'sugar', 'quantity': 'med', 'icon': LineIcons.cubes},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: buildContainers(nutritionData),
      ),
    );
  }
}

List<Widget> buildContainers(data) {
  List<Widget> containers = [];

  for (var item in data) {
    String nutritionItem = item['nutrition-item'];
    dynamic quantity = item['quantity'];
    IconData nutritionIcon = item['icon'];

    containers.add(
      Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Container(
          width: 77.5,
          height: 105,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                nutritionIcon,
                color: mainColor[500],
              ),
              const SizedBox(height: 6),
              Text(
                '$quantity'.toUpperCase(),
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                nutritionItem,
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  color: backgroundColor[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return containers;
}
