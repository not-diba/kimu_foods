import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/features/recipe/data/models/ingredient_model.dart';
import 'package:kimu_foods/features/basket/presentation/widgets/recipe_basket_item.dart';
import 'package:kimu_foods/features/recipe/domain/entities/ingredient.dart';

class IngredientsList extends StatefulWidget {
  final List<Ingredient> ingredients;

  const IngredientsList({super.key, required this.ingredients});

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenHeight * .5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Ingredients for Recipe",
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
                itemCount: widget.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = widget.ingredients[index];
                  return IngredientsListItem(
                    ingredientName: ingredient.name,
                    serving: ingredient.quantity,
                  );
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
    );
  }
}
