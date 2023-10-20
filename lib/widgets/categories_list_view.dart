import 'package:flutter/material.dart';
import 'package:kimu_foods/components/components.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 30,
        itemBuilder: (context, index) {
          return CategoriesCard();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 4,
        ),
      ),
    );
  }
}
