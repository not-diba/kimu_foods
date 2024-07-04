import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/theme/material_colors.dart';
import 'package:kimu_foods/core/components/widgets/bottom_nav_icon.dart';
import 'package:kimu_foods/features/categories/presentation/views/categories.dart';
import 'package:kimu_foods/features/recipe/presentation/views/recipes.dart';
import 'package:kimu_foods/features/products/presentation/views/products.dart';
import 'package:kimu_foods/features/profile/presentation/views/profile_view.dart';
import 'package:line_icons/line_icons.dart';

class Kimu extends StatefulWidget {
  const Kimu({super.key});

  @override
  State<Kimu> createState() => _KimuState();
}

class _KimuState extends State<Kimu> {
  int _selectedIndex = 0;
  final List<Widget> _screens = <Widget>[
    const Recipes(
      key: PageStorageKey('recipes'),
    ),
    const Categories(
      key: PageStorageKey('categories'),
    ),
    const Products(
      key: PageStorageKey('products'),
    ),
    const ProfileView(
      key: PageStorageKey('profile'),
    ),
  ];

  Widget currentScreen = const Recipes();

  void _navigateToView(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: PageStorage(
          bucket: bucket,
          child: _screens[_selectedIndex],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: _selectedIndex != 0 ? grey[100] : mainColor,
          foregroundColor: _selectedIndex != 0 ? darkGrey[900] : Colors.white,
          onPressed: () {
            _navigateToView(0);
          },
          child: const Icon(LineIcons.utensils), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        bottomNavigationBar: BottomAppBar(
          height: 54.0,
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: BottomNavIcon(
                  selectedColor:
                      _selectedIndex == 1 ? mainColor : grey[100] ?? grey,
                  icon: LineIcons.book,
                  label: 'Categories',
                  onPressed: () {
                    _navigateToView(1);
                  },
                ),
              ),
              BottomNavIcon(
                selectedColor:
                    _selectedIndex == 2 ? mainColor : grey[100] ?? grey,
                icon: LineIcons.store,
                label: 'Products',
                badgeText: const Text('99+'),
                onPressed: () {
                  _navigateToView(2);
                },
              ),
              // BottomNavIcon(
              //   selectedColor:
              //       _selectedIndex == 3 ? mainColor : grey[100] ?? grey,
              //   icon: LineIcons.shoppingBasket,
              //   label: 'Basket',
              //   badgeText: const Text('9'),
              //   onPressed: () {
              //     _navigateToView(3);
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: BottomNavIcon(
                  selectedColor:
                      _selectedIndex == 4 ? mainColor : grey[100] ?? grey,
                  icon: LineIcons.user,
                  label: 'Profile',
                  badge: true,
                  onPressed: () {
                    _navigateToView(3);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
