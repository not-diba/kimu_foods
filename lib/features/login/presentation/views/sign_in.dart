import 'package:flutter/material.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';

import '../../../../core/components/logo.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 40, bottom: 64),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        kimuLogo(context, height: 200),
                        const SizedBox(height: 40),
                        Text(
                          'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Text.rich(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                      const TextSpan(text: 'New user? ', children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(color: kimuPrimary),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
