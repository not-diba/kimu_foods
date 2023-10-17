import 'package:flutter/material.dart';
import 'package:kimu_foods/screens/screens.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';
import 'package:kimu_foods/widgets/bottom_nav_icon.dart';
import 'package:line_icons/line_icons.dart';

class Kimu extends StatefulWidget {
  const Kimu({Key? key}) : super(key: key);

  @override
  State<Kimu> createState() => _KimuState();
}

class _KimuState extends State<Kimu> {
  int _selectedIndex = 0;
  final List<Widget> _screens = <Widget>[
    Home(
      key: PageStorageKey('home'),
    ),
    Recipes(
      key: PageStorageKey('recipes'),
    ),
    Products(
      key: PageStorageKey('products'),
    ),
    Basket(
      key: PageStorageKey('basket'),
    ),
    Profile(
      key: PageStorageKey('profile'),
    ),
  ];

  final PageStorageBucket screenBucket = PageStorageBucket();
  Widget currentScreen = Home();

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
          height: 56.0,
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
                  label: 'Recipes',
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
                badge: true,
                onPressed: () {
                  _navigateToView(2);
                },
              ),
              BottomNavIcon(
                selectedColor:
                    _selectedIndex == 3 ? mainColor : grey[100] ?? grey,
                icon: LineIcons.shoppingBasket,
                label: 'Basket',
                onPressed: () {
                  _navigateToView(3);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: BottomNavIcon(
                  selectedColor:
                      _selectedIndex == 4 ? mainColor : grey[100] ?? grey,
                  icon: LineIcons.user,
                  label: 'Profile',
                  badgeText: Text('99+'),
                  onPressed: () {
                    _navigateToView(4);
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
