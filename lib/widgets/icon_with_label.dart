import 'package:flutter/material.dart';

class IconButtonWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const IconButtonWithLabel({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              size: 30,
              icon,
              // color: Colors.white,
            ),
            onPressed: onPressed,
          ),
          Text(label, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
