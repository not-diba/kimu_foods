import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kimu_foods/core/components/stepper.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 44.0,
                      top: 72.0,
                    ),
                    child: KimuStepper(
                      onCompletion: () => context.goNamed('sign-in'),
                      steps: [
                        _intoItem(
                            context,
                            'lib/core/assets/svgs/ingredient_bowl.png',
                            'Diverse',
                            ' and fresh flavors',
                            'With extensive recipes with high-quality, fresh ingredients.',
                            isPng: true),
                        _intoItem(
                          context,
                          'lib/core/assets/svgs/ingredients_plate.svg',
                          'Easy to',
                          'change dish ingredients',
                          'You are a foodie, you can add or subtract ingredients in the recipe.',
                        ),
                        _intoItem(
                            context,
                            'lib/core/assets/svgs/delivery.svg',
                            'Delivery',
                            'is given on time',
                            'On schedule, just as promised.'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Column _intoItem(BuildContext context, String svgPath, String mainText,
      String highlightedMainText, String subText,
      {bool isPng = false}) {
    return Column(
      children: [
        isPng
            ? Image.asset(
                svgPath,
                height: 300,
              )
            : SvgPicture.asset(
                svgPath,
                height: 300,
              ),
        const SizedBox(height: 24),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .8,
          child: Column(
            children: [
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: mainText,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: ' $highlightedMainText',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subText,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }
}
