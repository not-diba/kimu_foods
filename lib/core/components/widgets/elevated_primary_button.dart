import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/generics/format_amount.dart';
import '../../utils/theme/material_colors.dart';

class ElevatedPrimaryButton extends StatefulWidget {
  final double amount;
  final String label;
  const ElevatedPrimaryButton(
      {super.key, required this.amount, required this.label});

  @override
  State<ElevatedPrimaryButton> createState() => _ElevatedPrimaryButtonState();
}

class _ElevatedPrimaryButtonState extends State<ElevatedPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            backgroundColor: mainColor[500],
            foregroundColor: Colors.white,
            padding:
                const EdgeInsets.only(top: 16, bottom: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            textStyle: GoogleFonts.rubik(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {},
          child: Text('${widget.label} • ${formatAmount(widget.amount)}'),
        ),
      ),
    );
  }
}
