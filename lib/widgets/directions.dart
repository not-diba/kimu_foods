import 'package:flutter/material.dart';

class Directions extends StatelessWidget {
  final List<String> instructions;

  const Directions({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: instructions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(instructions[index]),
          // TODO: customize this
        );
      },
    );
  }
}
