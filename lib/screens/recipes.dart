import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimu_foods/widgets/categories_list_view.dart';
import 'package:kimu_foods/widgets/widgets.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: SearchBar(
              leading: Icon(
                Icons.search_sharp,
                size: 26,
              ),
              hintText: 'Search in Categories',
              elevation: MaterialStatePropertyAll<double>(0.0),
              padding: MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 15)),
            ),
          ),
          RecommendedListView(),
          SizedBox(height: 24),
          Text('CATEGORIES', style: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w700)),
          CategoriesListView(),
        ],
      ),
    );
  }
}
