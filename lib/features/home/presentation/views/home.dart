import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kimu_foods/core/components/kimu_app_bar.dart';
import 'package:kimu_foods/core/utils/configs.dart';
import 'package:kimu_foods/core/utils/generics/sliver_header_delegate.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/generics/notifier_state.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/providers/recipe_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String _selectedCategory = 'all';

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RecipesProvider>(context, listen: false).getRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<GestureDetector> categoriesList = [
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_all.svg',
        label: 'All',
        category: 'all',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_chicken_2.svg',
        label: 'Chicken',
        category: 'chicken',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_salad.svg',
        label: 'Salad',
        category: 'salad',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_fruits.svg',
        label: 'Fruits',
        category: 'fruits',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_beef.svg',
        label: 'Beef',
        category: 'beef',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_coffee.svg',
        label: 'Coffee',
        category: 'coffee',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_fish.svg',
        label: 'Fish',
        category: 'fish',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_flour.svg',
        label: 'Flour',
        category: 'flour',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_milkshakes.svg',
        label: 'Shakes',
        category: 'shakes',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_pasta.svg',
        label: 'Pasta',
        category: 'pasta',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_pastries.svg',
        label: 'Pastries',
        category: 'pastries',
      ),
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_teas.svg',
        label: 'Teas',
        category: 'teas',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Consumer<RecipesProvider>(
          builder: (context, recipeProvider, child) {
            if (recipeProvider.state == NotifierState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (recipeProvider.recipesResponse == null ||
                recipeProvider.recipesResponse!.data == null) {
              return const Center(child: Text("No recipes available"));
            }

            return CustomScrollView(
              slivers: [
                kimuAppBar(
                  context: context,
                  collapsedTitle: 'Recipes',
                  mainTitleMedium: 'Amazing recipes',
                  mainTitleBold: 'for you ✨',
                ),
                _categoriesHeader(categoriesList),
                _recipesList(recipeProvider.recipesResponse!.data!),
              ],
            );
          },
        ),
      ),
    );
  }

  SliverPersistentHeader _categoriesHeader(List<GestureDetector> categories) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        height: 80.0,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.only(top: 12.0),
          child: Center(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SizedBox(
                width: 70,
                height: 70,
                child: categories[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: categories.length,
            ),
          ),
        ),
      ),
    );
  }

  SliverList _recipesList(List<Recipe> recipes) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Recipe recipe = recipes[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: _recipeItem(
              index: index,
              recipe: recipe,
            ),
          );
        },
        childCount: recipes.length,
      ),
    );
  }

  GestureDetector _recipeItem({required int index, required Recipe recipe}) {
    return GestureDetector(
      onTap: () => context.pushNamed('recipe-details', extra: recipe),
      child: Container(
        decoration: BoxDecoration(
          color: apricot,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(recipe.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .6,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                recipe.recipeName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Text(
                              'Ingredients - ${recipe.ingredients.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: taupe,
                                  ),
                            ),
                          ),
                          Text(
                            '${Configs.defaultCurrency} ${recipe.amount.toInt()}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: kimuSecondary,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20.0,
                                ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: paleTaupe, width: 1),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(MingCute.add_fill, size: 18.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  index.isEven ? MingCute.heart_line : MingCute.heart_fill,
                  color: kimuSecondary,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildCategoryItem(
      {required BuildContext context,
      required String assetName,
      required String label,
      required String category}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetName,
            height: 40,
            width: 40,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: _selectedCategory == category ? kimuSecondary : taupe,
                  fontWeight: _selectedCategory == category
                      ? FontWeight.w500
                      : FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}

// Future<>
