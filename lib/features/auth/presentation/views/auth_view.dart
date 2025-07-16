import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kimu_foods/main.dart';
import 'package:ming_cute/ming_cute.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/kimu_foods_logo.dart';
import '../../domain/providers/auth_provider.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
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
                  children: [
                    const SizedBox(height: 150),
                    const KimuFoodsLogo(height: 200, subText: true),
                    const SizedBox(height: 64),
                    _signInActions(),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    MingCute.google_fill,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Sign in with Google',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
              onPressed: () => signInWithGoogle(),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TextButton(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    MingCute.apple_fill,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Sign in with Apple',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.apply(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? gUser =
        await googleSignIn.authenticate(scopeHint: ['email', 'profile']);

    if (gUser == null) {
      print('Google Sign In was cancelled');
      return;
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    Provider.of<AuthProvider>(context, listen: false)
        .signInWithGoogle(gAuth.idToken!)
        .then((response) {
      if (response.successful) {
        print('🟢 User authenticated successfully: ${response.data?.userId}');
        context.goNamed('add-phone-number', extra: response.data?.userId);
      } else {
        print('🔴 Error occurred: ${response.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? "An error occured.")),
        );
      }
    }).catchError((error) {
      print('🔴 Error occurred: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    });
  }

  // Form _signInForm() {
  //   return Form(
  //     child: Column(
  //       children: [
  //         TextFormField(
  //           decoration: InputDecoration(
  //             hintText: 'Your email',
  //             suffixIcon: Icon(
  //               MingCute.check_line,
  //               color: kimuTertiary.withOpacity(.3),
  //               size: 18,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 12),
  //         TextFormField(
  //           decoration: InputDecoration(
  //             hintText: 'password',
  //             suffixIcon: GestureDetector(
  //               onTap: () {
  //                 if (kDebugMode) {
  //                   print('🟢');
  //                 }
  //               },
  //               child: Icon(
  //                 MingCute.eye_close_line,
  //                 color: kimuTertiary.withOpacity(.3),
  //                 size: 18,
  //               ),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 28),
  //         IntrinsicHeight(
  //           child: SizedBox(
  //             width: double.infinity,
  //             child: TextButton(
  //               onPressed: () => context.goNamed('kimu'),
  //               child: const Text('Sign In'),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
