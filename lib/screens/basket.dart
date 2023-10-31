import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/components/components.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Baskets",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.rubik(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ActionChip(
                    side: BorderSide.none,
                    avatar: const Icon(
                      Icons.receipt_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                    label: const Text('Orders'),
                    backgroundColor: backgroundColor[600],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            BasketItem()
          ],
        ));
  }
}
