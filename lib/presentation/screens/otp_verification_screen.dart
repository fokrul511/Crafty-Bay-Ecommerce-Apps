import 'dart:async';

import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
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
  int _countdownSeconds = 120; // Initial countdown value
  late Timer _timer; // Timer variable

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Next"),
            ),
            const SizedBox(height: 16),
            _buildResendCodeMessage(),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text("Resend code"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: "This code will Expire in",
          ),
          TextSpan(
            text: "$_countdownSeconds s",
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ],
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

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_countdownSeconds < 1) {
          _timer.cancel(); // Cancel the timer when countdown is finished
        } else {
          _countdownSeconds--; // Decrement countdown seconds
        }
      });
    });
  }

  @override
  void dispose() {
    _otpTEController;
    _timer.cancel();
    super.dispose();
  }
}
