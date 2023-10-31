import 'package:flutter/material.dart';
import 'package:kimu_foods/utils/utils.dart';

class BottomNavIcon extends StatelessWidget {
  final bool badge;
  final Text? badgeText;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color selectedColor;

  const BottomNavIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.selectedColor,
    this.badge = false,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    bool isBadgeTextPresent = badgeText != null;

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Badge(
            backgroundColor: secondaryColorTeal[500],
            label: badgeText,
            isLabelVisible: isBadgeTextPresent || badge,
            child: Icon(
              icon,
              color: selectedColor,
              size: 30,
            ),
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
