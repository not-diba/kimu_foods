import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';

Column kimuLogo(BuildContext context,
    {double height = 250, bool subText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(
        'lib/core/assets/svgs/logo.svg',
        semanticsLabel: 'Kimu Foods',
        height: height,
      ),
      RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontWeight: FontWeight.w500),
          children: const <TextSpan>[
            TextSpan(text: 'Kimu '),
            TextSpan(text: 'F'),
            TextSpan(text: 'o', style: TextStyle(color: kimuSecondary)),
            TextSpan(text: 'o', style: TextStyle(color: kimuPrimary)),
            TextSpan(text: 'ds')
          ],
        ),
      ),
      if (subText)
        Text(
          'GROCERIES DELIVERY APP',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.w700, color: kimuSecondary),
        )
    ],
  );
}
