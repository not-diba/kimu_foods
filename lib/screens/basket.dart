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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Text(
              "RECIPES",
              textAlign: TextAlign.start,
              style: GoogleFonts.rubik(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: screenHeight * .5,
              width: double.infinity,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return BasketItem();
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              height: screenHeight * .5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Ingredients for Recipes",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return RecipeBasketItem();
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 24,
                            color: Colors.grey,
                            thickness: .3,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  backgroundColor: mainColor[500],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 16, bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  textStyle: GoogleFonts.rubik(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {},
                child: const Text('PURCHASE • KES. 4,500.00'),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
