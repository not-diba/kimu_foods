import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';

class KimuStepper extends StatefulWidget {
  List<Widget> steps;
  Function onCompletion;

  KimuStepper({super.key, required this.steps, required this.onCompletion});

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
          ],
        ),
        _stepActions()
      ],
    );
  }

  SizedBox _stepItem() {
    return SizedBox(
      child: widget.steps[isActiveStep >= widget.steps.length - 1
          ? isActiveStep - 1
          : isActiveStep],
    );
  }

  Row _stepIndicator() {
    List<Row> indicators = [];
    for (int i = 0; i <= widget.steps.length - 1; i++) {
      if (isActiveStep == i) {
        indicators.insert(
          isActiveStep,
          Row(
            children: [
              Container(
                height: 5,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: kimuPrimary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        );
      } else {
        indicators.insert(
          i,
          Row(
            children: [
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kimuPrimary.withOpacity(.5),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  Row _stepActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TODO: dont display back if its the first item.
        IconButton.outlined(
          onPressed: () {
            setState(() {
              if (isActiveStep > 0) {
                isActiveStep -= 1;
              }
            });
          },
          icon: const Icon(Icons.chevron_left),
        ),
        const SizedBox(width: 6),
        TextButton(
          onPressed: () {
            setState(() {
              if (isActiveStep < widget.steps.length) {
                isActiveStep += 1;
              }
            });
            if (isActiveStep == widget.steps.length) {
              widget.onCompletion();
            }
          },
          child: const Text('Next'),
        ),
      ],
    );
  }
}
