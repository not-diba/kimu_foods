import 'package:flutter/material.dart';
import 'package:kimu_foods/widgets/recents_card.dart';
import 'package:line_icons/line_icons.dart';
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
          RecentsCard(),
        ],
      ),
    );
  }
}
