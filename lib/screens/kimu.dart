import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kimu_foods/utils/theme/partials/material_colors.dart';
import 'package:kimu_foods/widgets/icon_with_label.dart';
import 'package:line_icons/line_icons.dart';

class Kimu extends StatefulWidget {
  const Kimu({Key? key}) : super(key: key);

  @override
  State<Kimu> createState() => _KimuState();
}

class _KimuState extends State<Kimu> {
  int _selectedIndex = 1;
  final List<Widget> _views = <Widget>[
    Container(color: pumpkin),
    Container(color: teal),
    Container(color: Colors.black),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child: Icon(LineIcons.utensils), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      //floating action button location to left

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.white,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 90),
              child: IconButtonWithLabel(
                icon: LineIcons.book,
                label: 'Recipes',
                onPressed: () {
                  // Handle the button press
                },
              ),
            ),
            IconButtonWithLabel(
              icon: LineIcons.store,
              label: 'Products',
              onPressed: () {
                // Handle the button press
              },
            ),
            IconButtonWithLabel(
              icon: LineIcons.shoppingBasket,
              label: 'Basket',
              onPressed: () {
                // Handle the button press
              },
            ),
            IconButtonWithLabel(
              icon: LineIcons.user,
              label: 'Profile',
              onPressed: () {
                // Handle the button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
