import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const AppLogo(),
            const SizedBox(height: 16),
            Text(
              "Enter OTP Code",
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 5),
            Text(
              "A 4 Digit OTP code has been Send",
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildPinField(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.white),
      controller: _otpTEController,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      appContext: context,
    );
  }

  @override
  void dispose() {
    _otpTEController;
    super.dispose();
  }
}
