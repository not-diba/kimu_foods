import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/configs.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:kimu_foods/features/home/domain/entities/ingredient.dart';
import 'package:kimu_foods/features/home/domain/entities/nutrition.dart';
import 'package:ming_cute/ming_cute.dart';

import '../../domain/entities/recipe.dart';

class RecipeDetails extends StatefulWidget {
  Recipe recipe;

  RecipeDetails({super.key, required this.recipe});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  final List<String> _alreadyHave = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apricot,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            collapsedHeight: MediaQuery.sizeOf(context).height * .15,
            expandedHeight: MediaQuery.sizeOf(context).height * .3,
            stretchTriggerOffset: 300.0,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: apricot,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    MingCute.left_line,
                    size: 24.0,
                  ),
                ),
              ),
            ),
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: apricot,
                    border: Border(
                      bottom: BorderSide(
                        color: apricot,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      widget.recipe.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.sizeOf(context).width,
                  bottom: 0,
                  child: Material(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: apricot,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: apricot,
                        ),
                        color: apricot,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.sizeOf(context).width,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: kimuPrimary,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          MingCute.heart_line,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .5,
                            child: Text(
                              widget.recipe.recipeName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            '${Configs.defaultCurrency} ${widget.recipe.amount.toInt()}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: taupe,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22.0),
                      _buildNutritionItems(widget.recipe.nutrition),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              MingCute.soup_pot_2_line,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Ingredients',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        ..._ingredientsList(),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              MingCute.soup_pot_line,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Cooking instructions',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        _directions(widget.recipe.instructions),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomAppBar(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 20,
                decoration: const BoxDecoration(
                  color: apricot,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Counter here'),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Add to cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Padding> _ingredientsList() {
    return widget.recipe.ingredients.map((item) {
      return _ingredientsListItem(item);
    }).toList();
  }

  Padding _ingredientsListItem(Ingredient ingredient) {
    final bool isChecked = _alreadyHave.contains(ingredient.name);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 22.0),
                  const Text(
                    '·',
                    style: TextStyle(
                      height: .6,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    '${ingredient.quantity} - ${ingredient.name}',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
                child: Checkbox(
                  value: isChecked,
                  activeColor: kimuPrimary,
                  onChanged: (bool? checked) {
                    setState(() {
                      if (checked == true) {
                        _alreadyHave.add(ingredient.name);
                      } else {
                        _alreadyHave.remove(ingredient.name);
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          if (isChecked)
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 1.2,
                  color: taupe,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ),
        ],
      ),
    );
  }

  ListView _directions(List<String> instructions) {
    const double sharedWidth = 25;
    const double sharedHeight = 25;
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: instructions.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: sharedHeight,
              width: sharedWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: kimuSecondary,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
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
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) => Align(
        alignment: Alignment.centerLeft,
        child:  SizedBox(
          width: sharedWidth,
          height: sharedHeight,
          child: Center(
            child: VerticalDivider(
              color: Colors.grey[900],
              thickness: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNutrientTagItem(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: taupe.withOpacity(.8), width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16.0,
            color: taupe.withOpacity(.8),
          ),
          const SizedBox(width: 4.0),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.apply(
                  color: taupe.withOpacity(.8),
                ),
          ),
        ],
      ),
    );
  }

  Wrap _buildNutritionItems(List<Nutrition> nutritionItems) {
    const nutritionInfoMap = {
      "calories": {'label': 'Kcal', 'icon': MingCute.flame_line},
      "saturates": {'label': 'Saturates', 'icon': MingCute.drop_line},
      "salt": {'label': 'Salts', 'icon': MingCute.hemisphere_line},
      "sugar": {'label': 'Sugar', 'icon': MingCute.cube_line},
    };

    final nutritionWidgets = nutritionItems.map((item) {
      final nutritionInfo = nutritionInfoMap[item.nutritionItem];
      if (nutritionInfo == null) return const SizedBox();

      return _buildNutrientTagItem(
        '${item.quantity} ${nutritionInfo['label']}',
        nutritionInfo['icon'] as IconData,
      );
    }).toList();

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runSpacing: 10.0,
      spacing: 10.0,
      children: nutritionWidgets,
    );
  }
}
