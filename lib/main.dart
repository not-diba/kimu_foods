import 'package:flutter/material.dart';
import 'package:kimu_foods/screens/kimu.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(const KimuFoods());
}

class KimuFoods extends StatelessWidget {
  const KimuFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: KimuFoodsTheme.light(),
      title: 'Kimu Foods',
      home: const Kimu(),
    );
  }
}
