import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:kimu_foods/features/categories/presentation/views/categories.dart';
import 'package:kimu_foods/features/favourites/presentation/views/favourites.dart';
import 'package:kimu_foods/features/home/presentation/views/home.dart';
import 'package:kimu_foods/features/orders/presentation/views/orders.dart';
import 'package:ming_cute/ming_cute.dart';

class Kimu extends StatefulWidget {
  const Kimu({super.key});

  @override
  State<Kimu> createState() => _KimuState();
}

class _KimuState extends State<Kimu> {
  int _selectedIndex = 0;

  static const List<Widget> _views = <Widget>[
    Home(),
    Favourites(),
    Categories(),
    Center(
      child: Text(
        'Index 3: Meal plans',
      ),
    ),
    Orders()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MingCute.home_4_line),
            activeIcon: Icon(MingCute.home_4_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MingCute.heart_line),
            activeIcon: Icon(MingCute.heart_fill),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(MingCute.grid_line),
            activeIcon: Icon(MingCute.grid_fill),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(MingCute.calendar_line),
            activeIcon: Icon(MingCute.calendar_fill),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(MingCute.shopping_cart_2_line),
            activeIcon: Icon(MingCute.shopping_cart_2_fill),
            label: 'Orders',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: kimuTertiary,
        selectedItemColor: kimuTertiary,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 24,
        elevation: 0.0,
        enableFeedback: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
        child: _views.elementAt(_selectedIndex),
      ),
    );
  }
}
