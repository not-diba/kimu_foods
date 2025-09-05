import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kimu_foods/core/components/kimu_app_bar.dart';
import 'package:kimu_foods/core/utils/configs.dart';
import 'package:kimu_foods/core/utils/generics/sliver_header_delegate.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      _getRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<GestureDetector> categoriesList = [
      _buildCategoryItem(
        context: context,
        assetName: 'lib/core/assets/svgs/c_all.svg',
        label: 'All',
        category: '',
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
        label: 'Dairy',
        category: 'dairy',
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
            final isLoading = recipeProvider.state == NotifierState.loading;

            final recipes = (recipeProvider.recipesResponse?.data ?? []);

            return CustomScrollView(
              slivers: [
                kimuAppBar(
                  context: context,
                  collapsedTitle: 'Recipes',
                  mainTitleMedium: 'Amazing recipes',
                  mainTitleBold: 'for you ✨',
                ),
                _categoriesHeader(categoriesList),
                _recipesList(recipes, isLoading),
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

  Widget _recipesList(List<Recipe> recipes, bool isLoading) {
    if (recipes.isEmpty && !isLoading) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MingCute.soup_pot_line,
                size: 150,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .7,
                child: Text(
                  'No tasty ideas here right now — try another category!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final displayRecipes =
        isLoading ? List.generate(5, (index) => _fakeRecipe()) : recipes;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final recipe = displayRecipes[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Skeletonizer(
              enabled: isLoading,
              child: _recipeItem(
                index: index,
                recipe: recipe,
                isLoading: isLoading,
              ),
            ),
          );
        },
        childCount: displayRecipes.length,
      ),
    );
  }

  Recipe _fakeRecipe() {
    return Recipe(
      id: "skeleton",
      name: "Loading...",
      image: "https://via.placeholder.com/300",
      createdAt: DateTime.now(),
      createdBy: null,
      duration: 0,
      instructions: "",
      totalPrice: 0,
      updatedAt: DateTime.now(),
      categories: [],
      ingredients: [],
    );
  }

  GestureDetector _recipeItem(
      {required int index, required Recipe recipe, required bool isLoading}) {
    return GestureDetector(
      onTap: isLoading
          ? null
          : () => context.pushNamed('recipe-details', extra: recipe),
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
                  height: 270,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(recipe.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    MingCute.soup_pot_2_line,
                                    size: 16,
                                    color: taupe,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
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
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    MingCute.time_duration_line,
                                    size: 16,
                                    color: taupe,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${recipe.duration.toString()} minutes',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: taupe,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: .4, color: taupe),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .6,
                            child: Text(
                              '${Configs.defaultCurrency} ${recipe.totalPrice}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                MingCute.arrow_right_line,
                                color: kimuSecondary,
                                size: 20,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                'VIEW',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: kimuSecondary,
                                      fontWeight: FontWeight.w800,
                                    ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
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
                  color: Colors.white,
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
        _getRecipes(category: category);
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

  void _getRecipes({String? category}) {
    Provider.of<RecipesProvider>(context, listen: false)
        .getRecipes(category: category);
  }
}
