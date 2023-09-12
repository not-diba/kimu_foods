import 'package:flutter/material.dart';

void main() {
  runApp(const KimuFoods());
}

class KimuFoods extends StatelessWidget {
  const KimuFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kimu Foods',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Kimu Foods'),
          ),
          body: const Center(
            child: Text('Kimu Foods App')
          ),
        ));
  }
}
