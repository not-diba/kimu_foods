import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kimu_foods/core/utils/theme/colours.dart';
import 'package:ming_cute/ming_cute.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/kimu_foods_logo.dart';
import '../../../../core/utils/generics/formatters.dart';
import '../../domain/providers/auth_provider.dart';

class VerifyPhoneNumberView extends StatefulWidget {
  final String userId;
  const VerifyPhoneNumberView({super.key, required this.userId});

  @override
  State<VerifyPhoneNumberView> createState() => _VerifyPhoneNumberViewState();
}

class _VerifyPhoneNumberViewState extends State<VerifyPhoneNumberView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    const KimuFoodsLogo(
                      height: 150,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Verify your phone number',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'We will send you a verification code to this number',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            inputFormatters: [KenyanPhoneNumberFormatter()],
                            controller: _phoneNumberController,
                            maxLines: 1,
                            maxLength: 12,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '07xx xxx xxx',
                              counterText: '',
                              labelText: 'Phone Number',
                              focusColor: kimuPrimary,
                              suffixIcon: Icon(
                                MingCute.cellphone_2_line,
                                size: 18.0,
                                color: kimuTertiary.withValues(alpha: .8),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 32),
                          IntrinsicHeight(
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () => verifyPhoneNumber(),
                                child: Text(
                                  'Continue',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void verifyPhoneNumber() {
    if (_formKey.currentState?.validate() ?? false) {
      final phoneNumber = _phoneNumberController.text.replaceAll(' ', '');

      Provider.of<AuthProvider>(context, listen: false)
          .verifyPhoneNumber(
        phoneNumber: phoneNumber,
        userId: widget.userId,
      )
          .then((response) {
        if (response.successful) {
          print('🟢 Phone number verified successfully');
          context.goNamed('kimu');
        } else {
          print('🔴 Error occurred: ${response.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.message ?? "An error occurred.")),
          );
        }
      }).catchError((error) {
        print('🔴 Error occurred: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $error')),
        );
      });
    } else {
      // Show validation errors
      print('Form is not valid');
    }
  }
}
