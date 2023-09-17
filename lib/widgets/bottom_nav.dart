// import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:kimu_foods/utils/theme/partials/material_colors.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
  
//   List<Widget> get tabs => _views;

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 1;
//   static final List<Widget> _views = <Widget>[
//     Container(color: pumpkin),
//     Container(color: teal),
//     Container(color: Colors.black),
//   ];

//   void _navigateBottomBar(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 20,
//             color: Colors.black.withOpacity(.1),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 8, top: 8, left: 15, right: 15),
//         child: GNav(
//           rippleColor: Colors.grey[300]!,
//           hoverColor: Colors.grey[100]!,
//           gap: 8,
//           activeColor: teal,
//           iconSize: 24,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           duration: const Duration(milliseconds: 500),
//           tabBackgroundColor: Colors.grey[100]!,
//           color: Colors.black,
//           tabs: const [
//             GButton(
//               icon: LineIcons.shapes,
//               text: 'Categories',
//             ),
//             GButton(
//               icon: LineIcons.utensils,
//               text: 'Recipes',
//             ),
//             GButton(
//               icon: LineIcons.shoppingBag,
//               text: 'Groceries',
//             ),
//           ],
//           selectedIndex: _selectedIndex,
//           onTabChange: _navigateBottomBar,
//         ),
//       ),
//     );
//   }
// }
