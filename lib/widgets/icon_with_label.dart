import 'package:flutter/material.dart';
import 'package:kimu_foods/utils/utils.dart';

class IconButtonWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color selectedColor;

  const IconButtonWithLabel({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selectedColor,
            size: 30,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              color: selectedColor,
            ),
          ),
        ],
      ),
    );
  }
}
