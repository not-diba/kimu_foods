import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:kimu_foods/features/categories/presentation/views/categories.dart';
import 'package:kimu_foods/features/favourites/presentation/views/favourites.dart';
import 'package:kimu_foods/features/home/presentation/views/home.dart';
import 'package:ming_cute/ming_cute.dart';

// import 'package:kimu_foods/core/components/widgets/bottom_nav_icon.dart';
// import 'package:kimu_foods/features/categories/presentation/views/categories.dart';
// import 'package:kimu_foods/features/recipe/presentation/views/recipes.dart';
// import 'package:kimu_foods/features/products/presentation/views/products.dart';
// import 'package:kimu_foods/features/profile/presentation/views/profile_view.dart';
// import 'package:line_icons/line_icons.dart';
//
// class Kimu extends StatefulWidget {
//   const Kimu({super.key});
//
//   @override
//   State<Kimu> createState() => _KimuState();
// }
//
// class _KimuState extends State<Kimu> {
//   int _selectedIndex = 0;
//   final List<Widget> _screens = <Widget>[
//     const Recipes(
//       key: PageStorageKey('recipes'),
//     ),
//     const Categories(
//       key: PageStorageKey('categories'),
//     ),
//     const Products(
//       key: PageStorageKey('products'),
//     ),
//     const ProfileView(
//       key: PageStorageKey('profile'),
//     ),
//   ];
//
//   Widget currentScreen = const Recipes();
//
//   void _navigateToView(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final PageStorageBucket bucket = PageStorageBucket();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         body: PageStorage(
//           bucket: bucket,
//           child: _screens[_selectedIndex],
//         ),
//         floatingActionButton: FloatingActionButton(
//           shape: const CircleBorder(),
//           backgroundColor: _selectedIndex != 0 ? grey[100] : mainColor,
//           foregroundColor: _selectedIndex != 0 ? darkGrey[900] : Colors.white,
//           onPressed: () {
//             _navigateToView(0);
//           },
//           child: const Icon(LineIcons.utensils), //icon inside button
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
//         bottomNavigationBar: BottomAppBar(
//           height: 54.0,
//           padding: const EdgeInsets.all(0),
//           color: Colors.white,
//           shape: const CircularNotchedRectangle(),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(left: 90),
//                 child: BottomNavIcon(
//                   selectedColor:
//                       _selectedIndex == 1 ? mainColor : grey[100] ?? grey,
//                   icon: LineIcons.book,
//                   label: 'Categories',
//                   onPressed: () {
//                     _navigateToView(1);
//                   },
//                 ),
//               ),
//               BottomNavIcon(
//                 selectedColor:
//                     _selectedIndex == 2 ? mainColor : grey[100] ?? grey,
//                 icon: LineIcons.store,
//                 label: 'Products',
//                 badgeText: const Text('99+'),
//                 onPressed: () {
//                   _navigateToView(2);
//                 },
//               ),
//               // BottomNavIcon(
//               //   selectedColor:
//               //       _selectedIndex == 3 ? mainColor : grey[100] ?? grey,
//               //   icon: LineIcons.shoppingBasket,
//               //   label: 'Basket',
//               //   badgeText: const Text('9'),
//               //   onPressed: () {
//               //     _navigateToView(3);
//               //   },
//               // ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 12),
//                 child: BottomNavIcon(
//                   selectedColor:
//                       _selectedIndex == 4 ? mainColor : grey[100] ?? grey,
//                   icon: LineIcons.user,
//                   label: 'Profile',
//                   badge: true,
//                   onPressed: () {
//                     _navigateToView(3);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
    Center(
      child: Text(
        'Index 4: Orders',
      ),
    ),
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
