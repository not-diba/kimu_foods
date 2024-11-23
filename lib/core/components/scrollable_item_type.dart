import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';

Column scrollableItemType(BuildContext context,
    {required String item,
    required String externalItem,
    GestureTapCallback? onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Text(
              item,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: externalItem == item
                      ? Theme.of(context).textTheme.bodyLarge?.color
                      : taupe,
                  fontWeight:
                      externalItem == item ? FontWeight.w500 : FontWeight.w400),
            ),
          ),
          if (externalItem == item)
            Positioned(
              bottom: 0,
              child: Container(
                width: 20,
                height: 2.0,
                color: kimuPrimary,
              ),
            ),
        ],
      ),
    ],
  );
}
