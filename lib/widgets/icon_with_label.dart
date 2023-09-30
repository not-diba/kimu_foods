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
    return Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 6),
        child: GestureDetector(
          onTap: onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: selectedColor,
                size: 30,
              ),
              const SizedBox(height: 2.5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: selectedColor,
                ),
              ),
            ],
          ),
        ));
  }
}
