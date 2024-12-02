import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';

class Counter extends StatefulWidget {
  final ValueChanged<int> onCountChanged;

  const Counter({super.key, required this.onCountChanged});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;

  void increaseCount() {
    setState(() {
      count++;
      widget.onCountChanged(count);
    });
  }

  void decreaseCount() {
    if (count > 1) {
      setState(() {
        count--;
        widget.onCountChanged(count);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black45),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              foregroundColor: taupe,
              padding: const EdgeInsets.all(10),
              side: const BorderSide(color: Colors.transparent, width: 0),
            ),
            icon: const Icon(
              MingCute.minimize_fill,
              size: 12,
            ),
            onPressed: decreaseCount,
          ),
          Text(
            '$count',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          IconButton(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              foregroundColor: taupe,
              padding: const EdgeInsets.all(10),
              side: const BorderSide(color: Colors.transparent, width: 0),
            ),
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              MingCute.add_fill,
              size: 12,
            ),
            onPressed: increaseCount,
          ),
        ],
      ),
    );
  }
}
