import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kimu_foods/core/routes.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';

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
                    left: 32, right: 32, top: 40, bottom: 64),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        kimuLogo(context, height: 100),
                        const SizedBox(height: 32),
                        Text(
                          'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 32),
                        _signInActions(),
                        const SizedBox(height: 32),
                        Text(
                          'Or with Email',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 20),
                        _signInForm(),
                        const SizedBox(height: 20),
                      ],
                    ),
                    _signUp(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IntrinsicHeight _signInActions() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kimuSecondary,
                foregroundColor: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    MingCute.google_fill,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'with Google',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          IconButton.outlined(
            onPressed: () {},
            icon: Icon(
              MingCute.tiktok_line,
              size: 22.0,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(width: 12),
          IconButton.outlined(
            onPressed: () {},
            icon: Icon(MingCute.ins_line,
                size: 22.0,
                color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
        ],
      ),
    );
  }

  Form _signInForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Your email',
              suffixIcon: Icon(
                MingCute.check_line,
                color: kimuTertiary.withOpacity(.3),
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'password',
              suffixIcon: GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print('🟢');
                  }
                },
                child: Icon(
                  MingCute.eye_close_line,
                  color: kimuTertiary.withOpacity(.3),
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),
          IntrinsicHeight(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => context.goNamed('kimu'),
                child: const Text('Sign In'),
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector _signUp() {
    return GestureDetector(
      onTap: () => context.pushNamed('sign-up'),
      child: Text.rich(
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
    );
  }
}
