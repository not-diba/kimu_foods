import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';

class KimuStepper extends StatefulWidget {
  final List<Widget> steps;
  final VoidCallback onCompletion;

  const KimuStepper(
      {super.key, required this.steps, required this.onCompletion});

  @override
  State<KimuStepper> createState() => _KimuStepperState();
}

class _KimuStepperState extends State<KimuStepper> {
  int isActiveStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _stepItem(),
            const SizedBox(height: 36),
            _stepIndicator(),
            const SizedBox(height: 36),
          ],
        ),
        _stepActions(),
      ],
    );
  }

  Widget _stepItem() {
    return SizedBox(
      child: widget.steps[isActiveStep],
    );
  }

  Row _stepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.steps.length, (index) {
        return Row(
          children: [
            Container(
              height: 5,
              width: isActiveStep == index ? 20 : 5,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: isActiveStep == index
                    ? kimuPrimary
                    : kimuPrimary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(width: 10),
          ],
        );
      }),
    );
  }

  IntrinsicHeight _stepActions() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isActiveStep > 0)
            IconButton(
              onPressed: () {
                setState(() {
                  if (isActiveStep > 0) {
                    isActiveStep -= 1;
                  }
                });
              },
              icon: const Icon(
                Icons.chevron_left,
                size: 24.0,
              ),
            ),
          const SizedBox(width: 6),
          TextButton(
            onPressed: () {
              setState(() {
                if (isActiveStep < widget.steps.length - 1) {
                  isActiveStep += 1;
                } else {
                  widget.onCompletion();
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Text(
                  isActiveStep < widget.steps.length - 1 ? 'Next' : 'Finish'),
            ),
          ),
        ],
      ),
    );
  }
}
