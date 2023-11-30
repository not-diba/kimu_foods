import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';

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
      height: 32,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black45),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              LineIcons.minus,
              size: 12,
            ),
            onPressed: decreaseCount,
          ),
          Text(
            '$count',
            textAlign: TextAlign.start,
            style: GoogleFonts.rubik(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              LineIcons.plus,
              size: 12,
            ),
            onPressed: increaseCount,
          ),
        ],
      ),
    );
  }
}
