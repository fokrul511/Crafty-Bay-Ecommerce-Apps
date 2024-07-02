import 'package:crafty_bay_ecomarc_apps/presentation/screens/otp_verification_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/email_verify_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/utility/constans.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/centered_circular_progress_indicator.dart';
import '../widgets/show_snake_message.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              const SizedBox(height: 100),
              const AppLogo(),
              const SizedBox(height: 16),
              Text(
                "Welcome Back",
                style: textTheme.headlineLarge,
              ),
              const SizedBox(height: 5),
              Text(
                "Please Enter Your Email Address",
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: "Email Address",
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Your email";
                  }
                  if (Constants.emailValidatorRegExp.hasMatch(value!) ==
                      false) {
                    return "Enter a valid email Address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              GetBuilder<EmailVerifayController>(
                  builder: (emailVerifyController) {
                if (emailVerifyController.inProgress) {
                  return const CentredCircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      emailVerifyController
                          .emailVerify(_emailTEController.text.trim())
                          .then(
                            (result) => {
                              if (result)
                                {
                                  Get.to(
                                    () => OTPVerificationScreen(
                                      email: _emailTEController.text,
                                    ),
                                  )
                                }
                              else
                                {
                                  showSnakeMessage(
                                    context,
                                    emailVerifyController.errorMessage,
                                  )
                                }
                            },
                          );
                    }
                  },
                  child: const Text("Next"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController;
    super.dispose();
  }
}
