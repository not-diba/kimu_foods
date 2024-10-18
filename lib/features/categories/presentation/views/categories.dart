import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kimu_foods/core/utils/generics/sliver_header_delegate.dart';
import 'package:ming_cute/ming_cute.dart';

import '../../../../core/components/kimu_app_bar.dart';
import '../../../../core/utils/theme/colours.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

String _selectedCategoryItem = 'Main dishes';

class _CategoriesState extends State<Categories> {
  //TODO: Might have to change this to an object.
  final List<String> _typesList = [
    'Main dishes',
    'Breakfast',
    'Brunch',
    'Lunch',
    'Dinner',
    'Healthy',
    'Drinks',
    'Desserts'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Stack> categoriesList = [
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_chicken_2.svg',
        label: 'Chicken',
        category: 'chicken',
        dishCount: 12,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_salad.svg',
        label: 'Salad',
        category: 'salad',
        dishCount: 10,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_fruits.svg',
        label: 'Fruits',
        category: 'fruits',
        dishCount: 9,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_beef.svg',
        label: 'Beef',
        category: 'beef',
        dishCount: 8,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_coffee.svg',
        label: 'Coffee',
        category: 'coffee',
        dishCount: 7,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_fish.svg',
        label: 'Fish',
        category: 'fish',
        dishCount: 6,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_flour.svg',
        label: 'Flour',
        category: 'flour',
        dishCount: 5,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_milkshakes.svg',
        label: 'Shakes',
        category: 'shakes',
        dishCount: 4,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_pasta.svg',
        label: 'Pasta',
        category: 'pasta',
        dishCount: 11,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_pastries.svg',
        label: 'Pastries',
        category: 'pastries',
        dishCount: 13,
      ),
      _buildCategoryItem(
        assetName: 'lib/core/assets/svgs/c_teas.svg',
        label: 'Teas',
        category: 'teas',
        dishCount: 2,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            kimuAppBar(
              context: context,
              collapsedTitle: 'Categories',
              mainTitleMedium: 'Our curated',
              mainTitleBold: 'Categories ⌘',
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                height: 124.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _searchBox(),
                      const SizedBox(height: 24.0),
                      _categoryTypesList(),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return categoriesList[index];
                  },
                  childCount: categoriesList.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  mainAxisExtent: 180,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _searchBox() {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                suffixIcon: const Icon(
                  MingCute.search_3_line,
                  color: kimuTertiary,
                  size: 18.0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          //TODO: Might have to remove this i cant think of any functionality for it.
          Container(
            height: double.infinity,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: bone, width: 1.2),
            ),
            child: const Center(
              child: Icon(MingCute.settings_6_line, size: 24.0),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _categoryTypesList() {
    return SizedBox(
      height: 24.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _typeItem(index);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 20.0),
        itemCount: _typesList.length,
      ),
    );
  }

  Column _typeItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryItem = _typesList[index];
                });
              },
              child: Text(
                _typesList[index],
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: _selectedCategoryItem == _typesList[index]
                        ? Theme.of(context).textTheme.bodyLarge?.color
                        : taupe,
                    fontWeight: _selectedCategoryItem == _typesList[index]
                        ? FontWeight.w500
                        : FontWeight.w400),
              ),
            ),
            if (_selectedCategoryItem == _typesList[index])
              Positioned(
                bottom: 0,
                child: Container(
                  width: 20,
                  height: 2.0,
                  color: kimuPrimary,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Stack _buildCategoryItem(
      {required String assetName,
      required String label,
      required String category,
      required int dishCount}) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: blanchedAlmond,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '$dishCount dishes',
                style:
                    Theme.of(context).textTheme.bodySmall?.apply(color: taupe),
              )
            ],
          ),
        ),
        Positioned(
          bottom: -35,
          right: -35,
          child: SvgPicture.asset(
            assetName,
            height: 160,
            width: 160,
          ),
        ),
      ],
    );
  }
}
